import { createClient } from 'redis'

export class Redis {
  static HASHTAG_FREQUENCIES_KEY = 'hashtag_frequencies'
  static TRENDING_START_INDEX = 0
  static TRENDING_END_INDEX = 25

  /* Initialize Redis client */
  static async initializeClient (config) {
    this.redisClient = createClient(config.redis)
    this.redisClient.on('error', err => console.error('Redis client error:', err))
    await this.redisClient.connect()
    console.log(`- Redis client configured and connected to ${config.redis.url}`)
  }

  /* Function for getting hashtags for a tweet. Returns a cached array of hashtags if possible.
   * Uses a regular expression to parse the hashtags and then save them as an array in Redis */
  static async getNormalizedHashtagsInTweet (tweet) {
    const normalizedTweet = tweet.toLowerCase()
    const cachedHashtagsForTweet = await this.redisClient.json.get(normalizedTweet, '$')
    if (cachedHashtagsForTweet) {
      return cachedHashtagsForTweet
    } else {
      const hashtagsForTweet = normalizedTweet.match(/#\w+/g)
      await this.redisClient.json.set(normalizedTweet, '$', hashtagsForTweet)
      return hashtagsForTweet
    }
  }

  /* Function for incrementing the score of hashtag frequencies in Redis */
  static async incrementHashtagFrequencies (hashtags) {
    hashtags.forEach(hashtag => {
      this.redisClient.zIncrBy(this.HASHTAG_FREQUENCIES_KEY, 1, hashtag)
    })
  }

  /* Function for getting the top hashtags from Redis in descending order */
  static async getTrendingHashtags () {
    return await this.redisClient.zRange(
      this.HASHTAG_FREQUENCIES_KEY,
      this.TRENDING_START_INDEX,
      this.TRENDING_END_INDEX - 1,
      { REV: true },
    )
  }
}
