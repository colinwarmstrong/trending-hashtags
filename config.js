const env = process.env;

const redisConnection = {
    url: env.REDIS_URL || "localhost:6379",
    password: env.REDIS_PASSWORD || ""
}

export const config = {
    express: {
        port: env.EXPRESS_PORT || 8080
    },

    redis: redisConnection,

    jobQueueConfig: {
        connection: redisConnection
    },

    workerConfig: {
        connection: redisConnection,
        concurrency: parseInt(env.WORKER_CONCURRENCY) || 50
    }
}
