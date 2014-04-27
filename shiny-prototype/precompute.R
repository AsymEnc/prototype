library(tm)
library(wordcloud)
#library(combinat)

saveTermMatrix <- function(dates) {
    ## Careful not to let just any name slip in here; a
    ## malicious user could manipulate this value.

    text <- character(0)
    for (year in dates[1]:dates[2]) {
        text <- c(text, readLines(sprintf("./data/%s.txt", year),
                                  encoding="UTF-8"))
    }

    myCorpus = Corpus(VectorSource(text))
    myCorpus = tm_map(myCorpus, removePunctuation)
    myCorpus = tm_map(myCorpus, removeNumbers)
    myCorpus = tm_map(myCorpus, removeWords,
        c(stopwords("german"), "die", "der", "das"))
    
    myDTM = TermDocumentMatrix(myCorpus,
        control = list(minWordLength = 1))

    m = as.matrix(myDTM)
    sorted.matrix <- sort(rowSums(m), decreasing = TRUE)
    save(sorted.matrix, file = sprintf("precomputed/%s-%s.RData", dates[1], dates[2]))
}

precompute <- function() {
    combinations <- combn(1863:1884, 2)

    for (col in 1:ncol(combinations)) {
        cat('Computing: ', combinations[, col], '\n')
        saveTermMatrix(combinations[ , col])
    }
}
