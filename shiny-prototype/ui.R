library("shiny")

shinyUI(
  fluidPage(
      titlePanel("ASYMENC Prototype"),
      tabsetPanel(
          tabPanel('Word Network',
              sidebarLayout(
                  sidebarPanel(
                      sliderInput("dates", "Date range:",
                                  min = 1863, max = 1884,
                                  value = c(1863, 1884),
                                  animate = FALSE,
                                  format = "###0"),
                      hr(),

                      sliderInput("freq",
                                  "Minimum Frequency:",
                                  min = 1, max = 50, value = 15),
                      sliderInput("max",
                                  "Maximum Number of Words:",
                                  min = 1, max = 300, value = 100),
                      actionButton("update", "Change the cloud")
                      ),
                  mainPanel(
                      plotOutput("plot")
                      )
                  )
              ),
          tabPanel('Word Timeline',
              sidebarLayout(
                  sidebarPanel(),
                  mainPanel(
                      'Timeline: coming soon!'
                      )
                  )
              )
          )
      )
    )
