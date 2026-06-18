################################### Preamble ###################################
# Purpose: A space for generating initial summary statistics and visuals for our  
#           INF2167 project, as a draft space before deciding which blocks of
#           code to run in the ultimate proposal/report
# Author: Stella Gregorski, Yiying Qin
# Date: May-August 2026
# Contact: stella.gregorski@mail.utoronto.ca
# License: MIT
# Pre-requisites: please install the Tidyverse and Here packages on your local 
#                 machine ahead of time, as well as load the project GitHub repository 
#                 so the relative filepaths will function as intended.

########################### Import Required Libraries ##########################
library(tidyverse)
library(here)

########################### Read In the Dataset ################################
collisions <- read_csv(here("data/02 - analysis data", "working-data-2020-2026.csv"))

############################### Establish Goals ################################
# establish goals: see what months, specific days, specific hours, or neighborhoods, have the most accidents
## also can facet that by mode of transportation to see what that might look like for different modes
# establish goals: in general, see how many accidents there are per mode of transportation

######################### Viewing pieces of the data ###########################
## classes
glimpse(collisions)
# looks like all columns are either numeric doubles or strings of characters
# doubles include the year, hour, and number of fatalities
# character strings include month name, day of the week, and many different "yes/no" variables
# modes of transportation being separate columns might be tricky, will have to pivot to use mode of transportation as a facet variable

## values
unique(collisions$OCC_MONTH)
unique(collisions$OCC_DOW)
# unique values of months and days of the week seem to make sense

unique(collisions$OCC_HOUR)
# collisions have occurred in every possible hour of the day

table(collisions$FATALITIES)
# a vast majority of collisions had no fatalities
# 2 fatalities or above could be considered outliers, total of 7 collisions of that caliber in 370000

################ Space for Drafting Proposal Statistics/Tables #################
## collisions by neighborhood, descending order
collisions |>
  group_by(NEIGHBOURHOOD_158) |>
  count() |>
  arrange(desc(n)) |>
  ungroup() |>
  mutate(percentage = round(n / sum(n) * 100, 2)) |>
  head(10)
# looks like there are many entries where the location was not recorded
# around 17% of entries do not have a location recorded, will need to decide what to do with this
# otherwise, given that the next 

## collisions by month, descending order
collisions |>
  group_by(OCC_MONTH) |>
  count() |>
  arrange(desc(n)) |>
  ungroup() |>
  mutate(percentage = round(n / sum(n) * 100, 2)) |>
  head(6)
# the first three months of the year and the last three months of the year make up the 6 months with the most collisions
# winter weather perhaps?
# all percentages are fairly close, there isn't one clear runaway month

## collisions by hour, descending order
collisions |>
  group_by(OCC_HOUR) |>
  count() |>
  arrange(desc(n)) |>
  ungroup() |>
  mutate(percentage = round(n / sum(n) * 100, 2)) |>
  head(6)
# a standard time that has 1-12 + AM/PM, rather than 24-hour time, might be a good addition here
# looks like most accidents occur in the afternoon/evening, not overnight or in the morning

## are there specific dates that have the most accidents
## collisions by month, descending order
collisions |>
  group_by(OCC_DATE) |>
  count() |>
  arrange(desc(n)) |>
  ungroup() |>
  mutate(percentage = round(n / sum(n) * 100, 2)) |>
  head(10)
# percentages are all small but there were nearly twice the number of accidents on day #1 as on day #10 so that's something?

## make a long version of the data to pivot mode of transportation
collisions_long <- collisions |>
  pivot_longer(
    cols = c(AUTOMOBILE, MOTORCYCLE, PASSENGER, BICYCLE, PEDESTRIAN), 
    names_to = "Vehicle_Type", 
    values_to = "Involved"
)

## use the long data to group accidents by vehicle involved
collisions_long |>
  group_by(Vehicle_Type) |>
  count(Involved) |>
  filter(Involved == "YES") |>
  arrange(desc(n))
# far more cars involved in accidents than any other type of vehicle, to be expected
# motorcycles in not that many accidents (surprising)

#################### Space for Drafting Proposal Visuals #######################





