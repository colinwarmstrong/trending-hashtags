# Colin Armstrong Charter Programming Assignment

An application for processing and serving trending hashtag data using Express, Redis, and BullMQ

[GitHub Repo](https://github.com/colinwarmstrong/trending-hashtags)

## Getting Started

These instructions should have the application up and running on your local machine in about 5 minutes. If you encounter
any unexpected errors, feel free to reach out to the recruiter or myself at colinwarmstrong@gmail.com and I can look
into it!

### Prerequisites

- Access to a terminal with git installed
- Docker up and running on your local machine

### How to Run the Application

1. Open a terminal session 
2. Run `git clone https://github.com/colinwarmstrong/trending-hashtags.git` to download the project to your local machine
3. Run `cd trending-hashtags` to change into the project directory
4. Run `docker compose up -d` from the project directory to spin up two Docker containers in the background:
    - A Redis data store at `localhost:6379`
    - An Express web server at `localhost:8080`
5. Wait for `docker compose up -d` to complete (this took roughly 30 seconds on my machine) 
and you're good to go!
6. Handy one-liner if you're so inclined:
```shell
   git clone https://github.com/colinwarmstrong/trending-hashtags.git &&
   cd trending-hashtags &&
   docker compose up -d
```

### How to Test the Application
- Quick tip: the comments in the `tweets.sh` shell script should provide some clarity on what the script is doing
- Run the following command to execute a series of roughly 40 predefined API calls from the `tweets.sh` script and see their output:
```shell
  bash ./tweets.sh
```


- Send a curl request to the `POST /tweet` endpoint:
```shell
  curl 'localhost:8080/tweet' -i -H 'Content-Type: application/json' -d '{"tweet" : "This is a tweet! #cool #sweet #radical"}'
```

- Send a curl request to the `GET /trending-hashtags` endpoint:
```shell
  curl -i 'localhost:8080/trending-hashtags'
```

### How to Stop the Application
Once you're done, run `docker compose down` from the project directory to stop both Docker containers

## Architecture Overview

The overall architecture for this application involves three components running in two Docker containers:
- An Express web server with two endpoints for receiving tweets and serving trending hashtag data via JSON
- A Redis data store for storing, sorting, and persisting hashtag data as we receive it
- A BullMQ job queue for creating and running background jobs as we receive tweets

The Express server is pretty straightforward in its implementation. It serves two endpoints: one for receiving tweet
data and one for returning trending hashtag data. Both endpoints are designed to return as quickly as possible. They 
offload the heavy lifting of data processing to BullMQ and Redis.

In Redis, I'm leveraging the sorted set data type to maintain a continuously updated ranking of hashtags by
frequency. As tweets are posted, we extract their hashtags and increment the "score" for each hashtag in the sorted
set. Redis maintains the sorting of these hashtags based on their scores. We can then quickly and easily return
a range of the top hashtags from Redis without needing to perform any heavy-duty sorting or processing on the server
side of things.

BullMQ is leveraged for its job queue and background processing capabilities. It utilizes a job queue where jobs are
added as tweets come in along with a worker to process these jobs in a concurrent fashion. This setup allows the 
Express endpoints to return as quickly as possible while the data processing is offloaded and handled in the background.

Express and Redis run in two separate Docker containers. BullMQ runs in the Express container but leverages Redis for
job processing and tracking. Redis automatically persists data to a volume every 10 seconds which ensures 
data durability even if the container is shutdown and restarted.

## Overall Thoughts on Design and Implementation

I think this particular implementation and design is a solid start in having an application that could 
be scaled up to handle quite a large volume of requests in a performant manner. Here are some of my thoughts on
the specifics:

### Scaling
The different components of the application can all be scaled up both vertically and horizontally quite easily.
New Express instances can be spun up or made larger, read-replicas and other advanced database techniques can be used to 
scale-up Redis, and BullMQ provides built in concurrency that can be scaled up as needed. The use of Docker containers 
also allows us to quickly scale out any of these components horizontally using tools like Kubernetes.

### Performance
This application should remain performant even with high levels of traffic assuming we're able to scale up properly. The 
Express endpoints themselves are doing very little actual work so should continue to return quickly. Redis is a very 
fast data store and the use of its sorted set data type provides a very efficient way to maintain a ranking of our
trending hashtags. We're also caching unique tweets and their associated hashtags to avoid processing duplicate tweets.
BullMQ allows us to offload data processing to background jobs so the rest of the application can remain responsive.

### Areas for Improvement
- Add an automated test suite
- Implement sensible data eviction policies in Redis
- Fine tune the Redis persistence strategy
- Fine tune BullMQ configuration and concurrency
- Implement better error handling
- Potentially implement a more durable data store on the backend (MongoDB or something) that can sync with
Redis and offload data for longer term storage
- Look into a more efficient way to store tweets and their associated hashtags (feel like there might be
a more efficient way than using the Redis JSON type)
- Split code out into smaller files/modules for better organization and readability

## Technology Overview

Brief summary of the technologies and versions used in this application:

### Node.js Packages
- Express v5.0.1
- Redis client v4.7.0
- BullMQ v5.28.1

### Other
- Docker v27.3.1
- node:22.11.0-alpine (Docker image)
- redis-stack:latest (Docker image)

## Developer Contact Info

- Colin Armstrong
- colinwarmstrong@gmail.com
- 815-685-2473
-  [LinkedIn](https://www.linkedin.com/in/colinwarmstrong/)

## Thanks!
