
MADERA_v2_May_2024

#LOAD PACKAGES

library(TNRS)
library(dplyr)
library(readr)

#RESULTS_supplementary materials

#Load data "MADERA_v2.0_May_2024" from csv files using the drop down menu. 

names(MADERA_v2_May_2024)
table (MADERA_v2_May_2024$Accepted_family)

Familias_total_2024 <- as.data.frame (table((MADERA_v2_May_2024$Accepted_family)))

Familias_total_2024

write.csv(Familias_total_2024, "Familias_total_2024.csv")

table(MADERA_v2_May_2024$Genus_matched)

Genus_total_2024 <- as.data.frame(table((MADERA_v2_May_2024$Genus_matched)))

Genus_total_2024

write.csv(Genus_total_2024, "Genus_total_2024.csv")

names(MADERA_v2_May_2024)

table(MADERA_v2_May_2024$life_form_Cardoso_et_al_2017)

Life_form_timber_2024 <- as.data.frame (table(MADERA_v2_May_2024$life_form_Cardoso_et_al_2017))               

write.csv(Life_form_timber_2024, "Life_form_timber_2024.csv")

#Population 

names(MADERA_v2_May_2024)

MADERA_v2_May_2024%>%group_by(Accepted_family)%>%summarise(estimated_ind_Amazon = sum(estimated_ind_Amazon))

Abundance_est_Amazonia_2024 <- as.data.frame(MADERA_v2_May_2024%>% group_by(Accepted_family)%>%summarise(estimated_ind_Amazon = sum(estimated_ind_Amazon)))

Abundance_est_Amazonia_2024

write.csv(Abundance_est_Amazonia_2024, "Abundance_est_Amazonia_2024.csv")

Abundance_est_Amazonia_2024_final

#hyperdominant spp

names(MADERA_v2_May_2024)

table(MADERA_v2_May_2024$check_hyperdominant_spp)

table(MADERA_v2_May_2024$Subregions_IV.maxcls)

Forest_type_total_sub_regions_2024 <- as.data.frame (table((MADERA_v2_May_2024$Forest_type_IV_max_hyperdominant)))

write.csv(Forest_type_total_sub_regions_2024,"Forest_type_total_sub_regions_2024.csv")

Forest_type_total_sub_regions_2024

#check ITTO commercial spp_2023

names(MADERA_v2_May_2024)

dplyr::filter(MADERA_v2_May_2024,`check_ITTO_commercial_spp`== "1")

ITTO_commercial_spp_2024 <- filter(MADERA_v2_May_2024,`check_ITTO_commercial_spp`== "1")

table(ITTO_commercial_spp_2024$Accepted_family)

Family_ITTO_commercial_spp_2024 <- as.data.frame (table((ITTO_commercial_spp_2024$Accepted_family)))

write.csv(Family_ITTO_commercial_spp_2024, "Family_ITTO_commercial_spp_2024.csv")

#check ITTO LUS spp_2023

names(MADERA_v2_May_2024)

dplyr::filter(MADERA_v2_May_2024,`check_ITTO_LUS_spp`== "1")

ITTO_LUS_spp_2024 <- filter(MADERA_v2_May_2024,`check_ITTO_LUS_spp`== "1")

table(ITTO_LUS_spp_2024$Accepted_family)

Family_ITTO_LUS_spp_2024 <- as.data.frame (table((ITTO_LUS_spp_2024$Accepted_family)))

write.csv(Family_ITTO_LUS_spp_2024, "Family_ITTO_LUS_spp_2024.csv")

#IUCN Red List Categories_2023

MADERA_v2_May_2024

names(MADERA_v2_May_2024)

dplyr::filter(MADERA_v2_May_2024, redlistCategory_IUCN_2023== 'Critically Endangered'| redlistCategory_IUCN_2023== 'Data Deficient'| redlistCategory_IUCN_2023== 'Endangered'| redlistCategory_IUCN_2023== 'Least Concern'| redlistCategory_IUCN_2023== 'Lower Risk/conservation dependent'| redlistCategory_IUCN_2023 == 'Lower Risk/least concern'| redlistCategory_IUCN_2023 == 'Lower Risk/near threatened'| redlistCategory_IUCN_2023== 'Near Threatened'| redlistCategory_IUCN_2023== 'Vulnerable')

Familias_evaluadas_IUCN_total_2024 <- dplyr::filter(MADERA_v2_May_2024, redlistCategory_IUCN_2023== 'Critically Endangered'| redlistCategory_IUCN_2023== 'Data Deficient'| redlistCategory_IUCN_2023== 'Endangered'| redlistCategory_IUCN_2023== 'Least Concern'| redlistCategory_IUCN_2023== 'Lower Risk/conservation dependent'| redlistCategory_IUCN_2023 == 'Lower Risk/least concern'| redlistCategory_IUCN_2023 == 'Lower Risk/near threatened'| redlistCategory_IUCN_2023== 'Near Threatened'| redlistCategory_IUCN_2023== 'Vulnerable')

table(Familias_evaluadas_IUCN_total_2024$Accepted_family)

Familias_evaluadas_IUCN_spp_2024 <- as.data.frame (table((Familias_evaluadas_IUCN_total_2024$Accepted_family)))

write.csv(Familias_evaluadas_IUCN_spp_2024,"Familias_evaluadas_IUCN_spp_2024.csv")

#IUCN Red list Categories

table(MADERA_v2_May_2024$redlistCategory_IUCN_2023)

IUCN_2023_total_2024 <- as.data.frame (table((MADERA_v2_May_2024$redlistCategory_IUCN_2023)))

write.csv(IUCN_2023_total_2024,"IUCN_Red_list_Categories_2023_2024.csv")

#scenarios_IUCN_2023

names(MADERA_v2_May_2024)

table(MADERA_v2_May_2024$`Original_AOO_2050_IGS`)

Escenario_Original_AOO_2050_IGS_total_2024 <- as.data.frame (table((MADERA_v2_May_2024$`Original_AOO_2050_IGS`)))

table(MADERA_v2_May_2024$`Original_AOO_2050_BAU`)

Escenario_Original_AOO_2050_BAU_total_2023 <- as.data.frame (table((MADERA_v2_May_2024$`Original_AOO_2050_BAU`)))

table(MADERA_v2_May_2024$`2050_RCP_2.6`)

Escenario_2.6_RCP_2050_2023 <- as.data.frame (table((MADERA_v2_May_2024$`2050_RCP_2.6`)))

table(MADERA_v2_May_2024$`2050_RCP_8.5`)

Escenario_8.5_RCP_2050_2023 <- as.data.frame(table((MADERA_v2_May_2024$`2050_RCP_8.5`)))

table(MADERA_v2_May_2024$`2050_RCP_2.6_2050_IGS`)

Escenario_2.6_RCP_2050_IGS_2023 <- as.data.frame (table((MADERA_v2_May_2024$`2050_RCP_2.6_2050_IGS`)))

table(MADERA_v2_May_2024$`2050_RCP_2.6_2050_BAU`)

Escenario_2.6_RCP_2050_BAU_2023 <- as.data.frame (table((MADERA_v2_May_2024$`2050_RCP_2.6_2050_BAU`)))

table(MADERA_v2_May_2024$`2050_RCP_8.5_2050_IGS`)

Escenario_8.5_RCP_2050_IGS_2023 <- as.data.frame (table((MADERA_v2_May_2024$`2050_RCP_8.5_2050_IGS`)))
                                                        
table(MADERA_v2_May_2024$`2050_RCP_8.5_2050_BAU`)
                                                        
Escenario_8.5_RCP_2050_BAU_2023 <- as.data.frame (table((MADERA_v2_May_2024$`2050_RCP_8.5_2050_BAU`)))
                                                        
names(MADERA_v2_May_2024)
                                                        
table(MADERA_v2_May_2024$`Sub_region_AOO`)
                                                        
Sub_region_major_spp_AOO <- as.data.frame (table((MADERA_v2_May_2024$`Sub_region_AOO`)))

#CITES
                                                        
table(MADERA_v2_May_2024$check_CITES)
                                                        
check_CITES <- as.data.frame (table((MADERA_v2_May_2024$check_CITES)))
                                                        
table(MADERA_v2_May_2024$appendix_CITES)
                                                        
appendix_CITES_2024 <- as.data.frame (table((MADERA_v2_May_2024$appendix_CITES_2023)))

write.csv(appendix_CITES_2024,"appendix_CITES_2024.csv")
                                                        
dplyr::filter(MADERA_v2_May_2024, appendix_CITES_2023 == "II")
                                                        
CITES_II_spp_2023 <- filter(MADERA_v2_May_2024, appendix_CITES_2023 == "II")

dplyr::filter(MADERA_v2_May_2024, appendix_CITES_2023 == "III")





