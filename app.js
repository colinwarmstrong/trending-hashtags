import { Express } from './src/services/express.js'
import { Redis } from './src/services/redis.js'
import { BullMQ } from './src/services/bullmq.js'
import { config } from './src/config/config.js'
import { tweetRouter } from './src/routes/tweets.js'

/* Start the three services: Express, Redis, and BullMQ */
console.log('Starting trending hashtag service...')
await Express.startServer(config)
await Redis.initializeClient(config)
await BullMQ.initializeJobQueue(config)
console.log('Trending hashtag service successfully started!\n')

/* Use the endpoints defined in the router */
Express.app.use(tweetRouter)
