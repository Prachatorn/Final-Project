# **Project Proposal**

## Project Description

###1. What is the dataset you'll be working with? Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.
We will be working with a refugee and asylee dataset from 2007-2016 made available by the Department of Homeland Security. Data was collected by Worldwide Refugee Admissions Processing System (WRAPS) of the Bureau of Population, Refugees, and Migration of the U.S. Department of State. It was accessed on the DHS website. 

###2. Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset.  You should hone in on one of these audiences.
Our target audience is the American people and anyone that is interested in immigration or refugee policy and advocacy. We hope to shed light on the reality of refugee statistics in the midst of harmful rhetoric. 

###3. What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.
- Given two presidential terms with Obama, how has immigration changed or stayed the same in that time?
- What was the refugee cap for a given year? Were all of the spots filled?
- From which countries were people granted asylum? 
- How many people were granted affirmative vs defensive asylum?
- Which countries are refugees coming from during a given year? How has that changed over time? Which regions?
- What were average age, sex, marital status for a given year?

##Technical Description

###How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)? 
We will be reading our data as a csv file.

###What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data? 
We have already reshaped our data to be more cohesive using dplyr. The original data was separated out by year. To use the same data but show how it changes over time, we joined our datasets.

###What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)
We will use `shiny, ggplot2, tidyr, maps, and leaflet.` 

###What major challenges do you anticipate? 
We anticipate challenges in making our functions to render plots with data selected by the user. For example, we’d like to make a chart that shows statistics of a given country and given year when the user selects them from a drop down menu. We will probably challenge.

