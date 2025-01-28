table1 <- plan.data %>%
  group_by(plan_type) %>%
  summarise(`2015` = n())  # Name the column "2015" for the year
library(knitr)
install.packages("kableExtra")
library(kableExtra)

table1 %>%
  kable(format = "html", col.names = c("Plan Type", "2015")) %>%
  kable_styling(full_width = FALSE, position = "center")
filtered_table1 <- plan.data %>%
  filter(snp != "Y", eghp != "Y", !str_starts(planid, "800")) %>%
  group_by(plan_type) %>%
  summarise(`2015` = n())  # Count plans by type
write_csv(table1, "data/output/plan_count_table1.csv")
filtered_data <- plan.data %>%
  filter(snp != "Y", eghp != "Y", !str_starts(planid, "800"))
updated_table1 <- filtered_data %>%
  group_by(plan_type) %>%
  summarise(`2015` = n()) %>%
  arrange(desc(`2015`))  # Optional: Sort by plan count

# Print the table
print(updated_table1)
updated_table1 %>%
  kable(format = "html", col.names = c("Plan Type", "2015")) %>%
  kable_styling(full_width = FALSE, position = "center")
average_enrollment_table <- plan.data %>%
  group_by(plan_type) %>%
  summarise(avg_enrollment = mean(enrollment, na.rm = TRUE)) %>%
  arrange(desc(avg_enrollment))
print(average_enrollment_table)

average_enrollment_table %>%
  kable(format = "html", col.names = c("Plan Type", "Average Enrollment")) %>%
  kable_styling(full_width = FALSE, position = "center")
