library(tm)
library(wordcloud)
library(memoise)


## Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(years) {
    ## Careful not to let just any name slip in here; a
    ## malicious user could manipulate this value.
    
    text <- readLines(sprintf("../data/%s.txt", 'data'),
                      encoding="UTF-8")
    
    myCorpus = Corpus(VectorSource(text))
    myCorpus = tm_map(myCorpus, tolower)
    myCorpus = tm_map(myCorpus, removePunctuation)
    myCorpus = tm_map(myCorpus, removeNumbers)
    myCorpus = tm_map(myCorpus, removeWords,
        c(stopwords("SMART"), "die", "der", "das"))
    
    myDTM = TermDocumentMatrix(myCorpus,
        control = list(minWordLength = 1))
    m = as.matrix(myDTM)
    sort(rowSums(m), decreasing = TRUE)
})
