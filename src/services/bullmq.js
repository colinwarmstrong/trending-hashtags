import { Queue, Worker } from 'bullmq'
import { Redis } from './redis.js'

export class BullMQ {

  /* Initialize BullMQ job queue and worker */
  static async initializeJobQueue (config) {
    this.jobQueue = new Queue('jobQueue', config.bullMQ.jobQueueConfig)
    const worker = new Worker('jobQueue', job => this.processTweetFromJobQueue(job), config.bullMQ.workerConfig)

    worker.on('completed', job => console.log('BullMQ job completed:', job.id))
    worker.on('failed', job => console.warn('BullMQ job failed:', job.id))
    worker.on('error', err => console.error('BullMQ worker error:', err))

    console.log(`- BullMQ job queue configured and connected to ${config.redis.url}`)
  }

  /* Function for adding tweets to the job queue */
  static async addTweetToJobQueue (tweet) {
    await this.jobQueue.add('processTweet', tweet)
  }

  /* Function for processing jobs from the job queue */
  static async processTweetFromJobQueue (job) {
    const normalizedHashtags = await Redis.getNormalizedHashtagsInTweet(job.data)
    await Redis.incrementHashtagFrequencies(normalizedHashtags)
  }
}
