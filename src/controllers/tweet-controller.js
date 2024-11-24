import { Redis } from '../services/redis.js'
import { BullMQ } from '../services/bullmq.js'

/* Gets trending hashtags from Redis and returns them as a 200 */
export async function getTrendingHashtags (req, res) {
  const trendingHashtags = await Redis.getTrendingHashtags()
  res.status(200).json({ hashtags: trendingHashtags })
}

/* Adds tweet to the job queue and returns a 200 unless 'tweet' is missing from request body */
export async function postTweet (req, res) {
  const { tweet } = req.body
  if (!tweet) {
    res.status(400).json({ error: 'Client must provide \'tweet\' in JSON request body' })
  } else {
    await BullMQ.addTweetToJobQueue(tweet)
    res.status(200).json({ success: `Successfully queued up this tweet for processing: ${tweet}` })
  }
}
