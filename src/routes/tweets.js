import express from 'express'
import { getTrendingHashtags, postTweet } from '../controllers/tweet-controller.js'

export const tweetRouter = express.Router()

/* GET request returning currently trending hashtags */
tweetRouter.get('/trending-hashtags', getTrendingHashtags)

/* POST request that accepts tweet data */
tweetRouter.post('/tweet', postTweet)
