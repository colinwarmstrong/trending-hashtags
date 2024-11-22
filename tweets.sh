#!/bin/bash
# Execute provided curl requests
echo "--------------------PROVIDED CURL REQUESTS--------------------"
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Today is the 30 year anniversary of UNLV winning the national championship. Vegas was still a small town back then and as a kid growing up there nothing was bigger than the Runnin'\'' Rebels. Still think this is the best college basketball team ever. #UNLV #Baskeball" }'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Vanessa Bryant on Kobe Bryant being inducted into the Basketball Hall of Fame today. We wish that he was here with us to celebrate but it'\''s definitely the peak of his NBA career. #basketball #kobe #mamba" }'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Vanessa Bryant on Kobe Bryant being inducted into the Basketball Hall of Fame today. We wish that he was here with us to celebrate but it'\''s definitely the peak of his NBA career. #basketball #kobe #mamba" }'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Vanessa Bryant on Kobe Bryant being inducted into the Basketball Hall of Fame today. We wish that he was here with us to celebrate but it'\''s definitely the peak of his NBA career. #basketball #kobe #mamba" }'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Kobe Bryant, Tim Duncan and Kevin Garnett are going to be inducted into the Naismith Basketball @Hoophall class of 2020, with the formal announcement coming Saturday, per @ShamsCharania #hoophall #basketball" }'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Greatness coming soonZipper-mouth faceDouble exclamation mark #unsigned #classof2021 #basketball" }'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Greatness coming soonZipper-mouth faceDouble exclamation mark #unsigned #classof2021 #basketball" }'; echo;
echo;

# Execute custom curl requests: establishes 30 hashtags ranging from a frequency of 10 down to a frequency of 1
echo "----------------------CUSTOM CURL REQUESTS----------------------";

# Top 5 hashtags, tweeted 10 times each
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "Top 5 hashtags! #cool #sweet #radical #cowabunga #nice "}'; echo;

# Hashtags 6-10, tweeted 8 times each
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "6-10 hashtags! #prettyGood #notBad #aboveAverage #nearTheTop #upperRange "}'; echo;

# Hashtags 11-15, tweeted 6 times each
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "11-15 hashtags! #stillClose #stillTrending #stillInIt #maybeTomorrow #keepTryin"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "11-15 hashtags! #stillClose #stillTrending #stillInIt #maybeTomorrow #keepTryin"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "11-15 hashtags! #stillClose #stillTrending #stillInIt #maybeTomorrow #keepTryin"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "11-15 hashtags! #stillClose #stillTrending #stillInIt #maybeTomorrow #keepTryin"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "11-15 hashtags! #stillClose #stillTrending #stillInIt #maybeTomorrow #keepTryin"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "11-15 hashtags! #stillClose #stillTrending #stillInIt #maybeTomorrow #keepTryin"}'; echo;

# Hashtags 16-20, tweeted 4 times each
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "16-20 hashtags! #gettinDownThere #betterBeCareful #barelyTrending #nervous #lookOut"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "16-20 hashtags! #gettinDownThere #betterBeCareful #barelyTrending #nervous #lookOut"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "16-20 hashtags! #gettinDownThere #betterBeCareful #barelyTrending #nervous #lookOut"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "16-20 hashtags! #gettinDownThere #betterBeCareful #barelyTrending #nervous #lookOut"}'; echo;

# Hashtags 21-25, tweeted 2 times each
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "21-25 hashtags! #trash #lame # #meh #bummer #sigh"}'; echo;
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "21-25 hashtags! #trash #lame # #meh #bummer #sigh"}'; echo;

# Hashtags 26-30, tweeted 1 time each
curl "localhost:8080/tweet" -X POST -H 'Content-Type: application/json' -d '{ "tweet": "26-30 hashtags! #notEvenTrending #sad #onlyTweetedOnce #underdog #maybeNextYear"}'; echo;
echo;

# Returns a JSON object with the top 25 hashtags in an array
# Should include custom hashtags 1-20 along with #basketball, #mamba, #kobe, #unsigned, and #trash
# Should not include any custom hashtags from the 26-30 range
echo "----------------------TOP 25 TRENDING HASHTAGS----------------------"
curl 'localhost:8080/trending-hashtags'; echo;
echo;
