# Get the R script: FelixAnalytix.com

# Install R packages if not installed -------------------------------------

if (!require(shiny)) install.packages("shiny")
if (!require(bs4Dash)) install.packages("bs4Dash")

# Empty skeleton ----------------------------------------------------------

library(shiny)
library(bs4Dash)

# ui <- dashboardPage(
#   title = "Ashan Book Reading",
#   header = dashboardHeader(),
#   sidebar = dashboardSidebar(),
#   controlbar = dashboardControlbar(),
#   footer = dashboardFooter(),
#   body = dashboardBody()
# )

# server <- function(input, output) {}
# 
# shinyApp(ui = ui, server = server)

# Full example ------------------------------------------------------------

ui <- dashboardPage(
  title = "My Book Reading",
  header = dashboardHeader(
    title = dashboardBrand(
      title = "My Books",
      color = "primary",
      # href = "https://felixanalytix.com",
      # image = "https://felixanalytix.com/about/image-profile.jpg",
    ),
    skin = "light",
    status = "white"
  ),
  sidebar = dashboardSidebar(
    skin = "light",
    status = "primary",
    elevation = 3,
    sidebarUserPanel(
      image = NULL,
      name = "Welcome !!!"
    ),
    sidebarMenu(
      # sidebarHeader("Ashan"),
      menuItem(
        "Statistics",
        tabName = "RStat"#,
        # icon = icon("sliders")
      ),
      menuItem(
        "Bought List",
        tabName = "BoughtList"#,
        # icon = icon("chart-simple")
      ),
      menuItem(
        "Reading List",
        tabName = "ReadingList"
      )
    )
  ),
  footer = dashboardFooter(
    left = "Ashan Ja"),
  body = dashboardBody(
    tabItems(
      tabItem(
        tabName = "ReadingList",
        h1("Reading List")
      ),
      tabItem(
        tabName = "BoughtList",
      ),
      tabItem(
        tabName = "RStat",
        h1("Reading Statistics"),
        fluidRow(
          valueBox(25,"No of Books bought",icon=icon("Book")),
          valueBox(25,"No of Sinhhala Books"),
          valueBox(25,"No of English Books"),
          valueBox(10 * 2, "Money", icon = icon("credit-card")),
          valueBoxOutput("progressBox")
        )
      )
    )
  )
)

server <- function(input, output) {
  output$progressBox <- renderValueBox({
    valueBox(
      paste0(25, "%"), "Progress", icon = icon("list"),
      color = "purple"
    )
  })
}
shinyApp(ui = ui, server = server)
