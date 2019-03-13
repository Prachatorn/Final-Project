source("gather_asylums.R")

asylum_tab <- tabPanel(
  "Asylum Info",
  titlePanel("Affirmative and Defensive"),
  sidebarLayout(
    sidebarPanel(
      #1st chart and widget combination choosing country
      selectInput(
        "country", 
        label = h3("Affirmative Asylum - Select Country"),
        choices = gather_affirm$Country,
        selected = 1
      ),
      #2nd chart and widget combination choosing country
      selectInput(
        "select_country", 
        label = h3("Defensive Asylum - Select Country"),
        choices = gather_defens$Country,
        selected = 1)
    ),
    #specify main panel
    mainPanel(
      p("Asylum is legal protection provided by the United States. 
        Affirmative asylum may be granted to individuals who can prove they have a 
        well-founded fear of persecution based on their race, nationality, religion, political views, or, belonging to a social group. 
        Affirmative asylum cases are yet to begin the deportation process in the courts. 
        Defensive asylum cases begin after affirmative asylum cases are denied, and take place in an immigration court. 
        The data below shows affirmative and defensive asylum cases from 2008 - 2016."),
      plotOutput("plot"),
      plotOutput("defensive"),
      p("When comparing affirmative and defensive asylum data from we noticed a pattern for many countries, 
        following a surge of affirmative asylum cases, defensive asylum cases will rise, usually in the year following the affirmative asylum rise. 
        This data also reflects major events in history, for example, the earthquake in Haiti back in 2010, 
        the data shows a rise in affirmative cases and no rise in defensive asylum cases during this time. 
        The data gives insight into what countries may be experiencing, 
        as well as which countries people the US is willing to grant asylum to in any given year.")
      )
    )
  )
