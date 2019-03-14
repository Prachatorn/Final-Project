# This tab refers to the overall overview of this project and what it tries to
# accomplish and questions to be answered with this project.

overview <- tabPanel(
  "Overview",
  h1("Interested in Learning the Real Facts About Refugee Statistics Under the
     Obama Administration?"),
  p("Welcome to our final project homepage. We wanted to study immigration in 
    the United States in order to bring awareness to real data during a time 
    in our country where harmful rhetoric is often tossed around without 
    prior fact checking. Our hope is that this site sheds light on how 
    immigration, in the form of refugee arrivals, changed over time during 
    the", strong("Obama administration.")),
  p(""),
  p(""),
  p("We gathered our data from the", strong("Department of Homeland Security"), 
    "and the", strong("Refugee Processing Center"), "websites. These sites 
    collected raw data from", em("Worldwide Refugee Admissions Processing System (WRAPS) of 
    the Bureau of Population, Refugees, and Migration of the U.S Department of State.")),
  p(""),
  p(""),
  h2("Questions we hope to answer include:"),
  p("    - Given two presidential terms with Obama, have refugee arrivals 
    changed or stayed the same in that time?"),
  p("    - What was the refugee cap for a given year? Were all of the spots 
    filled?"),
  p("    - From which countries were people granted asylum?"),
  p("    - How many people were granted affirmative vs defensive asylum?"),
  p("    - How many people from a given country arrived each year? "),
  p("    - Which regions did they arrive from? How has that changed over time?"),
  p("    - What were average age, sex, marital status for a given year?"),
  h2("Authors"),
  p("This project was created for the INFO 201 class at the University of 
    Washington. Our members include", strong("Prachatorn Joemjumroon, Marina Martinez, 
    Julianne Werner"), "and", strong("Hekma Yassin"), ". Thanks for checking 
    out our site and we hope you learn something new."),
  h2("Links"),
  p("Here are the datasets for", 
    a("Refugees and Ceilings", 
      href = "http://www.wrapsnet.org/admissions-and-arrivals/")),
  p("Here are the datasets for", 
    a("Refugees and Aslyumn Seekers", 
      href = "https://www.dhs.gov/immigration-statistics/refugees-asylees"))
  
)
