library(tm)
library(wordcloud)
library(memoise)


## Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(dates) {
    load(sprintf("./precomputed/%s-%s.RData", dates[1], dates[2]))

    sorted.matrix
})
