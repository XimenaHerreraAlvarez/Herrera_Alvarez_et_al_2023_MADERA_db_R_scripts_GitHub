
#LOAD PACKAGES

library(TNRS)
library(dplyr)
library(readr)

#RESULTS_supplementaty materials

#Load data "Final_complete_timber_spp_list_all_2023" from csv files using the drop down menu. 

names(Final_complete_timber_spp_list_all_2023)
table (Final_complete_timber_spp_list_all_2023$Accepted_family)

Familias_total_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$Accepted_family)))

Familias_total_2023

write.csv(Familias_total_2023, "Familias_total_2023.csv")

table(Final_complete_timber_spp_list_all_2023$Genus_matched)

Genus_total_2023 <- as.data.frame(table((Final_complete_timber_spp_list_all_2023$Genus_matched)))

Genus_total_2023

write.csv(Genus_total_2023, "Genus_total_2023.csv")

table (Final_complete_timber_spp_list_all_2023$life_form)

Life_form_timber_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$life_form)))               

write.csv(Life_form_timber_2023, "Life_form_timber_2023.csv")

#Population 

Final_complete_timber_spp_list_all_2023

names(Final_complete_timber_spp_list_all_2023)

Final_complete_timber_spp_list_all_2023 %>% group_by(Accepted_family) %>% summarise (est_ind = sum(est_ind))

Abundance_est_Amazonia_2023 <- as.data.frame(Final_complete_timber_spp_list_all_2023 %>% group_by(Accepted_family) %>% summarise (est_ind = sum(est_ind)))

Abundance_est_Amazonia_2023

write.csv(Abundance_est_Amazonia_2023, "Abundance_est_Amazonia_2023.csv")

Abundance_est_Amazonia_2023_final

#hyperdominant spp

names(Final_complete_timber_spp_list_all_2023)

table(Final_complete_timber_spp_list_all_2023$check_hyperdominant)

table(Final_complete_timber_spp_list_all_2023$Subregions_IV.maxcls)

Forest_type_total_sub_regions_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$Subregions_IV.maxcls)))

write.csv(Forest_type_total_sub_regions_2023,"Forest_type_total_sub_regions_2023.csv")

Forest_type_total_sub_regions_2023

#check ITTO commercial spp_2023

names(Final_complete_timber_spp_list_all_2023)

dplyr::filter(Final_complete_timber_spp_list_all_2023,`check ITTO_commercial_spp`== "1")

ITTO_commercial_spp_2023 <- filter(Final_complete_timber_spp_list_all_2023,`check ITTO_commercial_spp`== "1")

table(ITTO_commercial_spp_2023$Accepted_family)

Family_ITTO_commercial_spp_2023 <- as.data.frame (table((ITTO_commercial_spp_2023$Accepted_family)))

write.csv(Family_ITTO_commercial_spp_2023, "Family_ITTO_commercial_spp_2023.csv")

#check ITTO LUS spp_2023

names(Final_complete_timber_spp_list_all_2023)

dplyr::filter(Final_complete_timber_spp_list_all_2023,`check ITTO_LUS_spp`== "1")

ITTO_LUS_spp_2023 <- filter(Final_complete_timber_spp_list_all_2023,`check ITTO_LUS_spp`== "1")

table(ITTO_LUS_spp_2023$Accepted_family)

Family_ITTO_LUS_spp_2023 <- as.data.frame (table((ITTO_LUS_spp_2023$Accepted_family)))

write.csv(Family_ITTO_LUS_spp_2023, "Family_ITTO_LUS_spp_2023.csv")                                        
#IUCN Red List Categories_2023

names(Final_complete_timber_spp_list_all_2023)

dplyr::filter(Final_complete_timber_spp_list_all_2023, redlistCategory== 'Critically Endangered'| redlistCategory== 'Data Deficient'| redlistCategory== 'Endangered'| redlistCategory== 'Least Concern'| redlistCategory== 'Lower Risk/conservation dependent'| redlistCategory== 'Lower Risk/least concern'| redlistCategory== 'Lower Risk/near threatened'| redlistCategory== 'Near Threatened'| redlistCategory== 'Vulnerable')


Familias_evaluadas_IUCN_total_2023 <- filter(Final_complete_timber_spp_list_all_2023, redlistCategory== 'Critically Endangered'| redlistCategory== 'Data Deficient'| redlistCategory== 'Endangered'| redlistCategory== 'Least Concern'| redlistCategory== 'Lower Risk/conservation dependent'| redlistCategory== 'Lower Risk/least concern'| redlistCategory== 'Lower Risk/near threatened'| redlistCategory== 'Near Threatened'| redlistCategory== 'Vulnerable')

table(Familias_evaluadas_IUCN_total_2023$Accepted_family)

Familias_evaluadas_IUCN_spp_2023 <- as.data.frame (table((Familias_evaluadas_IUCN_total_2023$Accepted_family)))

write.csv(Familias_evaluadas_IUCN_spp_2023,"Familias_evaluadas_IUCN_spp_2023.csv")

#IUCN Red list Categories

table(Final_complete_timber_spp_list_all_2023$redlistCategory)

IUCN_2022_total_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$redlistCategory)))

write.csv(IUCN_2022_total_2023,"IUCN_Red_list_Categories_2022_2023.csv")

#scenarios_IUCN_2023

names(Final_complete_timber_spp_list_all_2023)

table(Final_complete_timber_spp_list_all_2023$`Original AOO and 2050 IGS`)

Escenario_Original_AOO_2050_IGS_total_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$`Original AOO and 2050 IGS`)))

table(Final_complete_timber_spp_list_all_2023$`Original AOO and 2050 BAU`)

Escenario_Original_AOO_2050_BAU_total_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$`Original AOO and 2050 BAU`)))

table(Final_complete_timber_spp_list_all_2023$`2050 RCP 2.6`)

Escenario_2.6_RCP_2050_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$`2050 RCP 2.6`)))

table(Final_complete_timber_spp_list_all_2023$`2050 RCP 8.5`)

Escenario_8.5_RCP_2050_2023 <- as.data.frame(table((Final_complete_timber_spp_list_all_2023$`2050 RCP 8.5`)))

table(Final_complete_timber_spp_list_all_2023$`2050 RCP 2.6 and 2050 IGS`)

Escenario_2.6_RCP_2050_IGS_2023 <- as.data.frame (table((Complete_timber_spp_list_all_2023$`2050 RCP 2.6 and 2050 IGS`)))

table(Final_complete_timber_spp_list_all_2023$`2050 RCP 2.6 and 2050 BAU`)

Escenario_2.6_RCP_2050_BAU_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$`2050 RCP 2.6 and 2050 BAU`)))

table(Final_complete_timber_spp_list_all_2023$`2050 RCP 8.5 and 2050 IGS`)

Escenario_8.5_RCP_2050_IGS_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$`2050 RCP 8.5 and 2050 IGS`)
                                                        
table(Final_complete_timber_spp_list_all_2023$`2050 RCP 8.5 and 2050 BAU`)
                                                        
Escenario_8.5_RCP_2050_BAU_2023 <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$`2050 RCP 8.5 and 2050 BAU`)))
                                                        
names(Final_complete_timber_spp_list_all_2023)
                                                        
table(Final_complete_timber_spp_list_all_2023$`Sub-region`)
                                                        
Sub_region_major_spp_AOO <- as.data.frame (table((Complete_timber_spp_list_v1_13_07_2022$`Sub-region`)))
                                                        
table(Final_complete_timber_spp_list_all_2023$check_CITES)
                                                        
check_CITES <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$check_CITES)))
                                                        
table(Final_complete_timber_spp_list_all_2023$appendix_CITES)
                                                        
appendix_CITES <- as.data.frame (table((Final_complete_timber_spp_list_all_2023$appendix_CITES)))
                                                        
dplyr::filter(Final_complete_timber_spp_list_all_2023, appendix_CITES == "II")
                                                        
CITES_II_spp <- filter(Final_complete_timber_spp_list_all_2023, appendix_CITES == "II")
                                                        
dplyr::filter(Final_complete_timber_spp_list_all_2023, appendix_CITES == "III")
                                                        
CITES_III_spp <- filter(Final_complete_timber_spp_list_all_2023, appendix_CITES == "III")
                                                        




















































































