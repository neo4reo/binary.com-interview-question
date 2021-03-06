## ================== Declaration =====================================
suppressWarnings(require('shiny'))
suppressWarnings(require('formattable'))
suppressWarnings(require('DT'))
suppressWarnings(require('memoise'))
suppressWarnings(require('TFX'))

## ===================== UI ===========================================
# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel('Real Time Trading System (Testing Version)'),
  
  mainPanel(
    p('I created this app to test the real-time transaction matching... ', 
      'Once the bid/ask price match with forecasted price, a transaction ', 
      'will be done.'), 
    p('Kindly refer to ', 
      HTML("<a href='https://github.com/englianhu/binary.com-interview-question'>binary.com Interview Question</a>"), 
      'for project details.'), 
    tags$hr(),
    h4('Real Time Data'), 
    p('Real Time bid/ask price and placed orders.'), 
    p(strong(paste0('Current time (', zone, '):')), textOutput('currentTime', inline = TRUE)),
    #'@ actionButton('calculate', 'Start Calculate', 
    #'@              icon = icon('calculator'), class = 'btn-primary'), 
    formattableOutput('fxdata'), 
    tags$hr(), 
    h4('Closed Transaction'), 
    p('Transactions done.'), 
    actionButton('refresh', 'Refresh Data', 
                 icon = icon('refresh'), class = 'btn-primary'), 
    br(), 
    br(), 
    DT::dataTableOutput('transc')))
