import express from 'express'
import { Redis } from '../services/redis.js'
import { BullMQ } from '../services/bullmq.js'

export const tweetRouter = express.Router()

/* GET request returning currently trending hashtags */
tweetRouter.get('/trending-hashtags', async (req, res) => {
  const trendingHashtags = await Redis.getTrendingHashtags()
  res.status(200).json({ hashtags: trendingHashtags })
})

/* POST request that accepts tweet data and adds it to our job queue for background processing */
tweetRouter.post('/tweet', async (req, res) => {
  const { tweet } = req.body
  if (!tweet) {
    res.status(400).json({ error: 'Client must provide \'tweet\' in JSON request body' })
  } else {
    await BullMQ.addTweetToJobQueue(tweet)
    res.status(200).json({ success: `Successfully queued up this tweet for processing: ${tweet}` })
  }
})
