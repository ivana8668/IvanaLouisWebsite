library(shiny)
library(ggplot2)
library(lubridate)
library(tidyverse)
library(zoo)
library(forecast)
library(rio)
library(shinyWidgets)


covid_cases = rio::import("https://hub.mph.in.gov/dataset/6b57a4f2-b754-4f79-a46b-cff93e37d851/resource/46b310b9-2f29-4a51-90dc-3886d9cf4ac1/download/covid_report.xlsx")
covid_death = rio::import("https://hub.mph.in.gov/dataset/6bcfb11c-6b9e-44b2-be7f-a2910d28949a/resource/7661f008-81b5-4ff2-8e46-f59ad5aad456/download/covid_report_death_date_agegrp.xlsx")
covid_bedvent = rio::import("https://hub.mph.in.gov/dataset/4d31808a-85da-4a48-9a76-a273e0beadb3/resource/0c00f7b6-05b0-4ebe-8722-ccf33e1a314f/download/covid_report_bedvent_date.xlsx")

colnames(covid_death)[1] <- "DATE"

# change week to lubridate format
#Count # of cases
#Change to weekly (Group by week)
covid_cases <- covid_cases %>% mutate(week = (year(DATE)-year(min(DATE))) * 52 
                                      + week(DATE)-week(min(DATE)), 
                                      week2 = (as.numeric(DATE)) %/% 7 - (as.numeric(min(DATE)) %/% 7)) %>%
  arrange(DATE)

covid_death <- covid_death %>% mutate(week = (year(DATE)-year(min(DATE))) * 52 
                                      + week(DATE)-week(min(DATE)), 
                                      week2 = (as.numeric(DATE)) %/% 7 - (as.numeric(min(DATE)) %/% 7)) %>%
  arrange(DATE)

covid_bedvent <- covid_bedvent %>% mutate(week = (year(DATE)-year(min(DATE))) * 52 
                                          + week(DATE)-week(min(DATE)), 
                                          week2 = (as.numeric(DATE)) %/% 7 - (as.numeric(min(DATE)) %/% 7)) %>%
  arrange(DATE)

#Group data by week/ include total counts per week
cc_agg = covid_cases %>%
  group_by(week) %>%
  summarize(N = sum(COVID_COUNT))

cd_agg = covid_death %>%
  group_by(week) %>%
  summarize(N = sum(covid_deaths))

beds_agg = covid_bedvent %>%
  group_by(week) %>%
  summarize(N = max(BEDS_ICU_OCCUPIED_COVID_19))

vents_agg = covid_bedvent %>%
  group_by(week) %>%
  summarize(N = max(VENTS_ALL_USE_COVID_19))



# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Indiana Covid Dashboard"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      sliderInput("integer", "How many weeks would you like to forecast?",
                  min = 0, max = 52,
                  value = 16),
      
      # Input: Slider for the number of bins ----
      #selectInput(inputId = "dist",
                  #label = "Covid Categories",
                  #choices = c("Covid Cases"="cc", "Covid Deaths"="cd", "Number of Beds"="beds", "Number of Vents"="vents"),
                  #selected = "Covid Cases"),
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Covid Cases", plotOutput("plot1"), h4("One Week Forecast"), verbatimTextOutput("summary1"), h4("Future Forecast"), plotOutput("ffplot1")),
                  tabPanel("Covid Deaths", plotOutput("plot2"),h4("One Week Forecast"), verbatimTextOutput("summary2"), h4("Future Forecast"),plotOutput("ffplot2")),
                  tabPanel("Max No. Beds", plotOutput("plot3"), h4("One Week Forecast"), verbatimTextOutput("summary3"), h4("Future Forecast"),plotOutput("ffplot3")),
                  tabPanel("Max No. Vents", plotOutput("plot4"),h4("One Week Forecast"), verbatimTextOutput("summary4"), h4("Future Forecast"),plotOutput("ffplot4"))
      )
                 
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  #sliderValues <- reactive({
    
    #data.frame(
      #Name = "Integer",
      #Value = as.character(input$integer),
      #stringsAsFactors = FALSE)
    
  #})
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  
  output$plot1 <- renderPlot({
      ggplot(cc_agg)+geom_path(aes(x=week,y=N))
  })
  output$summary1 <- renderPrint({
    cc_agg=zoo(cc_agg$N[1:36])
    fit_cc_auto <- auto.arima(cc_agg)
    fore_cc <- forecast(fit_cc_auto, h = 1,level=.99)
    print(fore_cc)
  })
  output$ffplot1 <- renderPlot({
    cc_agg=zoo(cc_agg$N[1:36])
    fit_cc_auto <- auto.arima(cc_agg)
    fore_cc <- forecast(fit_cc_auto, h = input$integer,level=.99)
    plot(fore_cc)
  })
  output$plot2 <- renderPlot({
      ggplot(cd_agg)+geom_path(aes(x=week,y=N))
  })
  output$summary2 <- renderPrint({
    cd_agg=zoo(cd_agg$N[1:35])
    fit_cd_auto <- auto.arima(cd_agg)
    fore_cd <- forecast(fit_cd_auto, h = 1,level=.99)
    print(fore_cd)
  })
  output$ffplot2 <- renderPlot({
    cd_agg=zoo(cd_agg$N[1:35])
    fit_cd_auto <- auto.arima(cd_agg)
    fore_cd <- forecast(fit_cd_auto, h = input$integer,level=.99)
    plot(fore_cd)
  })
  output$plot3 <- renderPlot({
    ggplot(beds_agg)+geom_path(aes(x=week,y=N))
  })  
  
  output$summary3 <- renderPrint({
    beds_agg=zoo(beds_agg$N[1:37])
    fit_beds_auto <- auto.arima(beds_agg)
    fore_beds <- forecast(fit_beds_auto, h = 1,level=.99)
    print(fore_beds)
  })
  output$ffplot3 <- renderPlot({
    beds_agg=zoo(beds_agg$N[1:37])
    fit_beds_auto <- auto.arima(beds_agg)
    fore_beds <- forecast(fit_beds_auto, h = input$integer,level=.99)
    plot(fore_beds)
  })
  output$plot4 <- renderPlot({
    ggplot(vents_agg)+geom_path(aes(x=week,y=N))
  })
  output$summary4 <- renderPrint({
    vents_agg=zoo(vents_agg$N[1:37])
    fit_vents_auto <- auto.arima(vents_agg)
    fore_vents <- forecast(fit_vents_auto, h = 1,level=.99)
    print(fore_vents)
  })  
  output$ffplot4 <- renderPlot({
    vents_agg=zoo(vents_agg$N[1:37])
    fit_vents_auto <- auto.arima(vents_agg)
    fore_vents <- forecast(fit_vents_auto, h = input$integer,level=.99)
    plot(fore_vents)
  })     
 
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)