# Twitter Trending Hashtags

## Programming Assignment

### Introduction

This task involves you developing a very simple application which generates a list of the most popular trending
hashtags.

The application should have two REST endpoints that you need to develop. The first endpoint will receive a series of
tweet-like requests. The second endpoint will return a list of the top 25 hashtags in descending order.

Both endpoints should return as quickly as possible. It's ok and probably a good idea to process data in the background.

Feel free to use any framework Node.js (our preference) or Python/Java framework you want.

### API Specs

* Create Tweet

**POST /tweet**

```json
{
    "tweet": "<tweet>"
}
```

* Trending Hashtags

**GET /trending-hashtags**

```json
{
  "hashtags": [
    "<hashtag1>",
    "<hashtag2>",
    "...",
    "<hashtag25>"
  ]
}
```

### Technical Details

- [x] You can assume that the load of the requests is about 1/sec. Bonus points would be if your design can
  support loads that are several orders of magnitudes larger than that.

- [x] The list of URLs will be provided through a set of `curl` calls. Please use the attached `tweets.sh` script to
  simulate those requests while you develop. Feel free to test with other similar requests, `tweets.sh` is just a start.

- [x] Tweets might repeat themselves, and as any good engineering system, we would like to avoid processing the same
  tweet over and over again. The algorithm doesn't need to be exact, and it can happen in memory.

- [x] Bonus points if the system is durable, restarting the service would still keep the data loaded up to that point.

- [x] Bonus points also if the system supported a very large cardinality of the hashtags, where the naive
  calculation of all the top hashtags at request-time would not be quick enough.

- [x] The deliverable should contain very simple instructions on how to run the application. Instructions on how to run a
  test to verify the results is also acceptable.

### Assignment Review Details

This assignment is a test of your systems engineering skills as well as your coding skills. So while we would like to
see clean and organized code, it is also important that the system is built with the right components, and you will be
able to explain every design decision that you have made building this system. We are interested in knowing how we can
take this demo and become an enterprise-grade production-ready application.

# FAQ

* Should the hashtag score used for sorting be precise or approximate?

Approximate is acceptable.
