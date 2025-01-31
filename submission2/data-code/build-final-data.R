
# Meta --------------------------------------------------------------------
# Author:        Genevieve DeBell
# Date Edited:   1/30/2025
# Notes:         R file to build Medicare Advantage dataset for Econ/HLTH 470 Hwk 1



# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, stringr, readxl, data.table, gdata)


# Call individual scripts -------------------------------------------------

source("/Users/genevievedebell/Documents/GitHub/hwk1/submission2/data-code/1_Plan_Data.R")
source("/Users/genevievedebell/Documents/GitHub/hwk1/submission2/data-code/2_Service_Areas.R")
