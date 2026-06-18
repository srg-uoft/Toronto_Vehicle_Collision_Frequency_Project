#### Preamble ####
# Purpose: A space for generating initial summary statistics and visuals for our INF2167 project, 
#           as a draft space before deciding which blocks of code to run in the ultimate proposal/report
# Author: Stella Gregorski, Yiying Qin
# Date: May-August 2026
# Contact: stella.gregorski@mail.utoronto.ca
# License: MIT
# Pre-requisites: please follow the instructions in the README of this repo to download the data ahead of time
#                 install the tidyverse package in your local instance of R, if not already installed

#### Import Required Libraries ####
library(tidyverse)
library(here)

#### Read In the Dataset ####
collisions <- read_csv(here("data/02 - analysis data", "working-data-2020-2026.csv"))

#### Establish Goals ####
# establish goals: looking for classes, values, distributions
# establish goals: looking for missing data, and also outliers
# establish goals: see what months, specific days, specific hours, or neighborhoods, have the most accidents
## also can facet that by mode of transportation to see what that might look like for different modes
# establish goals: in general, see how many accidents there are per mode of transportation

#### Viewing pieces of the data ####
# use unique() to see unique values of a column and use table() to get summary stats
# investigate the dates, as they often have issues and we want to make sure our temporal data is reliable

#### Space for Drafting Proposal Statistics/Tables ####



#### Space for Drafting Proposal Visuals ####




