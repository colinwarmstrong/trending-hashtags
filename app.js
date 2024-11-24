import express from 'express'
import { config } from './config.js'
import { createClient } from 'redis'
import { Queue, Worker } from 'bullmq'

/* Initialize Express server */
const app = express()
app.use(express.json())
app.listen(config.express.port, () => {
  console.log(`Express server up and running on port :${config.express.port}`)
})

/* Initialize Redis client */
const HASHTAG_FREQUENCIES_KEY = 'hashtag_frequencies'
const redisClient = createClient({
  url: config.redis.url,
  password: config.redis.password
})
redisClient.on('error', err => console.error('Redis client error:', err))
await redisClient.connect()
console.log(`Redis client configured and connected to ${config.redis.url}`)

/* Initialize BullMQ Job Queue and Worker */
const jobQueue = new Queue('jobQueue', config.jobQueueConfig)
const worker = new Worker('jobQueue', job => processTweetFromJobQueue(job), config.workerConfig)

worker.on('completed', job => console.log('BullMQ job completed:', job.id))
worker.on('failed', job => console.warn('BullMQ job failed:', job.id))
worker.on('error', err => console.error('BullMQ worker error:', err))

console.log(`BullMQ job queue configured and connected to ${config.redis.url}`)

/* Define functions for adding jobs to the job queue and processing jobs from the job queue */
async function addTweetToJobQueue (tweet) {
  await jobQueue.add('processTweet', tweet)
}

async function processTweetFromJobQueue (job) {
  const normalizedHashtags = await getNormalizedHashtagsInTweet(job.data)
  await incrementHashtagFrequencies(normalizedHashtags)
}

/* Set max count of trending tweets to return (default 25) */
const maxTrendingCount = 25

/* GET request returning currently trending hashtags */
app.get('/trending-hashtags', async (req, res) => {
  const trendingHashtags = await getTrendingHashtags()
  res.status(200).json({ hashtags: trendingHashtags })
})

/* POST request that accepts tweet data and adds it to our job queue for background processing */
app.post('/tweet', async (req, res) => {
  const { tweet } = req.body
  if (!tweet) {
    res.status(400).json({ error: 'Client must provide \'tweet\' in JSON request body' })
  } else {
    await addTweetToJobQueue(tweet)
    res.status(200).json({ success: `Successfully queued up this tweet for processing: ${tweet}` })
  }
})

/* Function for parsing hashtags from a tweet (returns a cached array of hashtags if possible) */
async function getNormalizedHashtagsInTweet (tweet) {
  const normalizedTweet = tweet.toLowerCase()
  const cachedHashtagsForTweet = await redisClient.json.get(normalizedTweet, '$')
  if (cachedHashtagsForTweet) {
    return cachedHashtagsForTweet
  } else {
    const hashtagsForTweet = normalizedTweet.match(/#\w+/g)
    await redisClient.json.set(normalizedTweet, '$', hashtagsForTweet)
    return hashtagsForTweet
  }
}

/* Function for incrementing the score of hashtag frequencies in Redis */
async function incrementHashtagFrequencies (hashtags) {
  for (const hashtag of hashtags) {
    await redisClient.zIncrBy(HASHTAG_FREQUENCIES_KEY, 1, hashtag)
  }
}

/* Function for getting the top hashtags from Redis in descending order */
function getTrendingHashtags () {
  return redisClient.zRange(HASHTAG_FREQUENCIES_KEY, 0, maxTrendingCount - 1, { REV: true })
}
