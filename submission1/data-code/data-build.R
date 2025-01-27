#########################################################################
## Read in enrollment data for january of each year
#########################################################################

for (y in 2007:2015) {
  ## Basic contract/plan information
  ma.path=paste0("data/input/monthly-ma-and-pdp-enrollment-by-cpsc/CPSC_Contract_Info_2015_01.csv")


  contract.info=read_csv(ma.path,
                         skip=1,
                         col_names = c("contractid","planid","org_type","plan_type",
                                       "partd","snp","eghp","org_name","org_marketing_name",
                                       "plan_name","parent_org","contract_date"),
                         col_types = cols(
                           contractid = col_character(),
                           planid = col_double(),
                           org_type = col_character(),
                           plan_type = col_character(),
                           partd = col_character(),
                           snp = col_character(),
                           eghp = col_character(),
                           org_name = col_character(),
                           org_marketing_name = col_character(),
                           plan_name = col_character(),
                           parent_org = col_character(),
                           contract_date = col_character()
                         ))

  contract.info = contract.info %>%
    group_by(contractid, planid) %>%
    mutate(id_count=row_number())
    
  contract.info = contract.info %>%
    filter(id_count==1) %>%
    select(-id_count)
    