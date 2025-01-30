# Preliminaries -----------------------------------------------------------
install.packages("pacman")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, stringr, readxl, data.table, gdata, scales)


# Read data and set workspace for knitr -------------------------------
full.ma.data <- readRDS('data/output/full_ma_data_2015.rds')
contract.service.area <- readRDS('data/output/MA_Cnty_SA_2015_01.csv')

# Create objects for markdown ---------------------------------------------

plan.type.table <- full.ma.data %>% group_by(plan_type) %>% count() %>% arrange(-n)
tot.obs <- as.numeric(count(full.ma.data %>% ungroup()))
plan.type.year1 <- full.ma.data %>% group_by(plan_type) %>% count() %>% arrange(-n) %>% filter(plan_type!="NA")

final.plans <- full.ma.data %>%
  filter(snp == "No" & eghp == "No" &
           (planid < 800 | planid >= 900))

        glimpse(final.plans)
        glimpse(full.ma.data)
plan.type.year2 <- final.plans %>% group_by(plan_type) %>% count() %>% arrange(-n)
final.plans <- final.plans %>%
  rename(enrollment=avg_enrollment)
plan.type.enroll <- final.plans %>% group_by(plan_type) %>% summarize(n=n(), enrollment=mean(enrollment, na.rm=TRUE)) %>% arrange(-n)

final.plans <- final.plans %>%
  mutate(year = as.double(year))

final.data <- final.plans %>%
  inner_join(contract.service.area %>% 
               select(contractid, fips, year), 
             by=c("contractid", "fips", "year")) %>%
  filter(!is.na(enrollment))

rm(list=c("full.ma.data", "contract.service.area","final.data"))
save.image("submission2/results/Hwk1_workspace.Rdata")
