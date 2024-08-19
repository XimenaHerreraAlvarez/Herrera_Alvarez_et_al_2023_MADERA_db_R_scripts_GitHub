#LOAD PACKAGES

library(TNRS)
library(dplyr)
library(readr)

### ADDITIONAL DATA ###

#"Amazonian timber submitted" data was imported from csv files using the drop down menu. This data set was the original "Amazonian timber", but using TNRS input requirements (ID and taxa columns)

#In cases of repeated species, the species with the information from the original sources were used.

#Adding the following information from TNRS: Accepted_family, Genus_matched, Accepted_name_author, Accepted_name_url

Amazonian_timber

names(Amazonian_timber)

Amazonian_timber_1138_TNRS_columns <- dplyr::select(Amazonian_timber, Name_submitted, Accepted_family, Genus_matched, Accepted_species, Accepted_name_author, Accepted_name_url)

Amazonian_timber_1138_TNRS_columns

names(Amazonian_timber_1138_TNRS_columns)

Amazonian_timber_1138_TNRS_countries <- Amazonian_timber_1138_TNRS_columns%>% dplyr::full_join(Amazonian_timber, by= "Accepted_species")

Amazonian_timber_1138_TNRS_countries

#ADDING LIFE FORMS FROM CARDOSO DATA SET

Cardoso_complete_v2 #Cardoso complete data

names(Cardoso_complete_v2)

species_select_cardoso <- dplyr::select(Cardoso_complete_v2, ID, Name_submitted)

species_select_cardoso_tnrs <- TNRS(taxonomic_names = species_select_cardoso, sources = c("wcvp", "wfo"))

species_select_cardoso_tnrs

names(species_select_cardoso_tnrs)

species_cardoso <- dplyr::select(species_select_cardoso_tnrs, Name_submitted, Accepted_species)

names(species_cardoso)

Cardoso_complete1 <- Cardoso_complete_v2
names(Cardoso_complete1)

names(Cardoso_complete1)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Final_Cardoso <- species_cardoso%>% dplyr::full_join(Cardoso_complete1, by= Name_submitted)

#Identifying duplicates in Cardoso

dplyr::anti_join(Cardoso_complete1, species_cardoso)

#row number 6726 corresponding to Piptadenia cuzcoënsis sp with "umlauts" was deleted

Final_Cardoso_output_1 <- Final_Cardoso[-6726, ]

Final_Cardoso_output_1

names(Final_Cardoso_output_1)

Final_Cardoso2 <- dplyr::select(Final_Cardoso_output_1, Accepted_species, life_form)

Final_Cardoso2

Amazonian_timber_final_Cardoso <- Amazonian_timber_1138_TNRS_countries%>% dplyr::inner_join(Final_Cardoso2, by= "Accepted_species")

#DELETE DUPLICATES AND DOUBLE CHECK THE FINAL DATA SET

Amazonian_timber_final_Cardoso1 <- Amazonian_timber_final_Cardoso %>% distinct(.keep_all = TRUE)

Amazonian_timber_final_Cardoso1

names(Amazonian_timber_final_Cardoso1)

write.csv(Amazonian_timber_final_Cardoso1, "Amazonian_timber_final_Cardoso1_2024.csv")

#These spp were identified twice according to Cardoso life forms, and were unified in one life form that compile these two life forms.

#Clusia columnaris shrub, tree
#Conceveiba guianensis shrub, tree
#Sapium glandulosum shrub, tree
#Iryanthera hostmannii shrub, tree
#Coccoloba mollis shrub, tree


VF_Amazonian_timber_final_Cardoso1_2024

#ADDING DATA FROM TER STEEGE ET AL (2020): number_individuals_ATDN_plots,	number_plots_ATDN_plots, estimated_ind_Amazon

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

ter_Steege_2020_submitted_2023

ter_Steege_2020_submitted_2023_TNRS <- TNRS(taxonomic_names = ter_Steege_2020_submitted_2023, sources = c("wcvp","wfo"))

ter_Steege_2020_submitted_2023_TNRS

select_ter_Steege_2020_submitted_2023_TNRS <- dplyr::select(ter_Steege_2020_submitted_2023_TNRS, Name_submitted, Accepted_species)

select_ter_Steege_2020_submitted_2023_TNRS

#Including population data 

ter_Steege_2020_population_2023

names(ter_Steege_2020_population_2023)

names(ter_Steege_2020_population_2023)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Final_ter_Steege_2020_population_2023 <- select_ter_Steege_2020_submitted_2023_TNRS%>% dplyr::full_join(ter_Steege_2020_population_2023, by= Name_submitted)

Final_ter_Steege_2020_population_2023

write.csv(Final_ter_Steege_2020_population_2023, "Final_ter_Steege_2020_population_2023.csv")

Final_ter_Steege_2020_population_2023_v1

Population_ter_Steege_2020_timber_spp_2024_1 <- VF_Amazonian_timber_final_Cardoso1_2024%>% dplyr::left_join(Final_ter_Steege_2020_population_2023_v1, by= "Accepted_species")

Population_ter_Steege_2020_timber_spp_2024_1

write.csv(Population_ter_Steege_2020_timber_spp_2024_1, "Population_ter_Steege_2020_timber_spp_2024_2.csv")

#We deleted 2 species of shurbs: Varronia curassavica y Varronia schomburgkii

Population_ter_Steege_2020_timber_spp_2024_2

names(Population_ter_Steege_2020_timber_spp_2024_2)

length(unique(Population_ter_Steege_2020_timber_spp_2024_2$Accepted_species))

str(Population_ter_Steege_2020_timber_spp_2024_2)

Final_population_ter_Steege_timber_spp_2024 <- Population_ter_Steege_2020_timber_spp_2024_2  

#ADDING DATA FROM TER STEEGE ET AL (2013): check_hyperdominant_spp	Forest_type_IV_max_hyperdominant	IV.indcls_hyperdominant

##Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

Hyperdominant_spp_submitted

Hyperdominant_spp_submitted_TNRS <- TNRS(taxonomic_names = Hyperdominant_spp_submitted,  sources = c("wcvp", "wfo"))

Hyperdominant_spp_submitted_TNRS

Select_hyperdominant_TNRS <- dplyr::select(Hyperdominant_spp_submitted_TNRS, Name_submitted, Accepted_species)

Select_hyperdominant_TNRS

#Joining data sets 

Complete_hyperdominant_spp

names(Complete_hyperdominant_spp)

names(Complete_hyperdominant_spp)[1] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Final_hyperdominant_info <- Complete_hyperdominant_spp%>% dplyr::full_join(Select_hyperdominant_TNRS, by= Name_submitted)

Final_hyperdominant_info

write.csv(Final_hyperdominant_info, "Final_hyperdominant_info1.csv")

#Para la sp Protium ex-tetragastris panamensis se utilizó el nombre aceptado de Kew  Protium stevensonii

Final_hyperdominant_info1

Final_population_ter_Steege_timber_spp_2024

Hyperdominant_timber_spp1 <- Final_population_ter_Steege_timber_spp_2024%>%dplyr::left_join(Final_hyperdominant_info1, by= "Accepted_species")

write.csv(Hyperdominant_timber_spp1, "Hyperdominant_timber_spp_2024_1.csv")

Hyperdominant_timber_spp1

#ADDING DATA FROM ITTO (2014a)

##Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

ITTO_commercial_spp_submitted

names(ITTO_commercial_spp_submitted)

ITTO_commercial_spp_TNRS <- TNRS(taxonomic_names = ITTO_commercial_spp_submitted,  sources = c("wcvp", "wfo"))

ITTO_commercial_spp_TNRS

Select_ITTO_commercial_spp_TNRS <- dplyr::select(ITTO_commercial_spp_TNRS, Name_submitted, Accepted_species)

Select_ITTO_commercial_spp_TNRS

names(Select_ITTO_commercial_spp_TNRS)

Complete_ITTO_commercial_timber_spp

names(Complete_ITTO_commercial_timber_spp)

names(Complete_ITTO_commercial_timber_spp)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

#Joining data sets 

Final_complete_ITTO_commercial_spp <- Complete_ITTO_commercial_timber_spp%>% dplyr::full_join(Select_ITTO_commercial_spp_TNRS, by= Name_submitted)

Final_complete_ITTO_commercial_spp

write.csv(Final_complete_ITTO_commercial_spp, "Final_complete_ITTO_commercial_spp.csv")

Timber_spp_complete_ITTO_commercial <- Hyperdominant_timber_spp1%>%dplyr::left_join(Final_complete_ITTO_commercial_spp, by= "Accepted_species")

Timber_spp_complete_ITTO_commercial

write.csv(Timber_spp_complete_ITTO_commercial, "Timber_spp_complete_ITTO_commercial_2024_2.csv")

Timber_spp_complete_ITTO_commercial

#ADDING DATA FROM ITTO (2014b) LUS species

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

ITTO_LUS_spp_submitted

names(ITTO_LUS_spp_submitted)

ITTO_LUS_spp_TNRS <- TNRS(taxonomic_names = ITTO_LUS_spp_submitted,  sources = c("wcvp", "wfo"))

ITTO_LUS_spp_TNRS

Select_ITTO_LUS_spp_TNRS <- dplyr::select(ITTO_LUS_spp_TNRS, Name_submitted, Accepted_species)

Select_ITTO_LUS_spp_TNRS

#Joining data sets

Complete_ITTO_LUS_spp

names(Complete_ITTO_LUS_spp)

names(Complete_ITTO_LUS_spp)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Final_complete_ITTO_LUS_spp_2024 <- Complete_ITTO_LUS_spp%>% dplyr::full_join(Select_ITTO_LUS_spp_TNRS, by= Name_submitted)

Final_complete_ITTO_LUS_spp_2024

write.csv(Final_complete_ITTO_LUS_spp_2024, "Final_complete_ITTO_LUS_spp_2024.csv")


Timber_spp_complete_ITTO_commercial_LUS_2024 <- Timber_spp_complete_ITTO_commercial%>%dplyr::left_join(Final_complete_ITTO_LUS_spp_2024, by= "Accepted_species")

Timber_spp_complete_ITTO_commercial_LUS_2024

write.csv(Timber_spp_complete_ITTO_commercial_LUS_2024, "Timber_spp_complete_ITTO_commercial_LUS_2024_2.csv")

Final_timber_spp_complete_ITTO_commercial_LUS_2024_2

#ADDING IUCN DATA 2023 - 2024

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

IUCN2024_submitted

IUCN2024_TNRS <- TNRS(taxonomic_names = IUCN2024_submitted, sources = c("wcvp","wfo"))

IUCN2024_TNRS

Select_IUCN2024_TNRS <- dplyr::select(IUCN2024_TNRS, Name_submitted, Accepted_species)

Select_IUCN2024_TNRS

write.csv(Select_IUCN2024_TNRS, "Select_IUCN2024_TNRS,.csv")

#ADDING IUCN TRADE INFO 2023 - 2024

Assessment_IUCN2024_usetrade 

Select_IUCN_red_list2024 <- dplyr::select(Assessment_IUCN2024_usetrade, Name_submitted, redlistCategory, redlistCriteria, yearPublished, criteriaVersion)

IUCN_red_list_2024 <- Select_IUCN2024_TNRS%>% dplyr::full_join(Select_IUCN_red_list2024, by= Name_submitted)

IUCN_red_list_2024

#Joining data sets

Timber_spp_complete_ITTO_commercial_LUS_IUCN_2024_v5 <- Final_timber_spp_complete_ITTO_commercial_LUS_2024_2%>% dplyr::left_join(IUCN_red_list_2024, by= "Accepted_species")

Timber_spp_complete_ITTO_commercial_LUS_IUCN_2024_v5

write.csv(Timber_spp_complete_ITTO_commercial_LUS_IUCN_2024_v5, "Timber_spp_complete_v5.csv")

Final_timber_spp_complete_v5

#Adding_uses categories according to Herrero Jauregui et al 2013

MADERA_version_2_0_Herrera_Alvarez_et_al_May_2024
uses_trade_IUCN1

MADERAv2.0_uses_IUCN_final <- MADERA_version_2_0_Herrera_Alvarez_et_al_May_2024%>%dplyr::left_join(uses_trade_IUCN1, by= "Accepted_species")

MADERAv2.0_uses_IUCN_final

write.csv(MADERAv2.0_uses_IUCN_final, "MADERAv2.0_uses_IUCN_final.csv")

#Duplicated species deleted

#Few species were reported as duplicated on the IUCN Red List, we used the original data to select the current IUCN red list Category

#ADDING DATA FROM Gomes et al. (2019)

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

Gomes_2019_submitted_v2

names(Gomes_2019_submitted_v2)

Gomes_2019_TNRS_v2 <- TNRS(taxonomic_names = Gomes_2019_submitted_v2, sources = c("wcvp", "wfo"))

Gomes_2019_TNRS_v2

Select_Gomes_2019_TNRS_v2 <- dplyr::select(Gomes_2019_TNRS_v2, Name_submitted, Accepted_species)

Select_Gomes_2019_TNRS_v2

write.csv(Select_Gomes_2019_TNRS_v2, "Select_Gomes_2019_TNRS_v2.csv")

#Joining data sets

Complete_Gomes_2019

names(Complete_Gomes_2019)
names(Complete_Gomes_2019)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Complete_Gomes_2019

Final_complete_Gomes_2019_v2 <- Complete_Gomes_2019%>% dplyr::full_join(Final_select_Gomes_2019_TNRS_v2, by= Name_submitted)

Final_complete_Gomes_2019_v2

write.csv(Final_complete_Gomes_2019_v2, "Final_complete_Gomes_2019_v2_march24.csv")

#The duplicated species were kept with a greater number of individuals, for example: Calatola costaricensis, Coccoloba excelsa, Monteverdia floribunda, Miconia glandulifera, among others.

Final_v2_complete_Gomes_2019_v2_march24

Timber_spp_complete_LUS_IUCN_2024_Gomes <- Final_timber_spp_complete_v5%>%dplyr::left_join(Final_v2_complete_Gomes_2019_v2_march24, by= "Accepted_species")

Timber_spp_complete_LUS_IUCN_2024_Gomes

write.csv(Timber_spp_complete_LUS_IUCN_2024_Gomes, "Timber_spp_complete_all_Gomes_march24.csv")

#We kept the species with a higher number of collections: Virola calophylla (415), Calatola costaricensis (464). This allowed us to have more updated estimates in the different climate change and deforestation scenarios. In version 1.0 of MADERA, C. costaricensis was incorporated with fewer collections (10).

Final_Timber_spp_complete_all_Gomes_march24


#ADDING DATA FROM CITES (UNEP – WCMC, 2021)

#Data was imported from csv files using the drop down menu

db1_CITES
db2_CITES
db3_CITES
db4_CITES
db5_CITES
db6_CITES
db7_CITES
db8_CITES
db9_CITES
db10_CITES
db11_CITES
db12_CITES
db13_CITES
db14_CITES
db15_CITES
db16_CITES
db17_CITES
db18_CITES
db19_CITES
db20_CITES
db21_CITES
db22_CITES
db23_CITES
db24_CITES
db25_CITES
db26_CITES
db27_CITES
db28_CITES
db29_CITES
db30_CITES
db31_CITES
db32_CITES
db33_CITES
db34_CITES
db35_CITES
db36_CITES
db37_CITES
db38_CITES
db39_CITES
db40_CITES
db41_CITES
db42_CITES
db43_CITES
db44_CITES
db45_CITES
db46_CITES

#Join data

CITES_list1 <- db1_CITES%>% dplyr::full_join(db2_CITES, by= "Taxon")%>% dplyr::full_join(db3_CITES, by= "Taxon")%>% dplyr::full_join(db4_CITES, by= "Taxon")%>% dplyr::full_join(db5_CITES, by= "Taxon")%>% dplyr::full_join(db6_CITES, by= "Taxon")%>% dplyr::full_join(db7_CITES, by= "Taxon")%>% dplyr::full_join(db8_CITES, by= "Taxon")%>% dplyr::full_join(db9_CITES, by= "Taxon")%>% dplyr::full_join(db10_CITES, by= "Taxon")%>% dplyr::full_join(db11_CITES, by= "Taxon")%>% dplyr::full_join(db12_CITES, by= "Taxon")%>% dplyr::full_join(db13_CITES, by= "Taxon")%>% dplyr::full_join(db14_CITES, by= "Taxon")%>% dplyr::full_join(db15_CITES, by= "Taxon")%>% dplyr::full_join(db16_CITES, by= "Taxon")%>% dplyr::full_join(db17_CITES, by= "Taxon")%>% dplyr::full_join(db18_CITES, by= "Taxon")%>% dplyr::full_join(db19_CITES, by= "Taxon")%>% dplyr::full_join(db20_CITES, by= "Taxon")%>% dplyr::full_join(db21_CITES, by= "Taxon")%>% dplyr::full_join(db22_CITES, by= "Taxon")%>% dplyr::full_join(db23_CITES, by= "Taxon")%>% dplyr::full_join(db24_CITES, by= "Taxon")%>% dplyr::full_join(db25_CITES, by= "Taxon")%>% dplyr::full_join(db26_CITES, by= "Taxon")%>% dplyr::full_join(db27_CITES, by= "Taxon")%>% dplyr::full_join(db28_CITES, by= "Taxon")%>% dplyr::full_join(db29_CITES, by= "Taxon")%>% dplyr::full_join(db30_CITES, by= "Taxon")%>% dplyr::full_join(db31_CITES, by= "Taxon")%>% dplyr::full_join(db32_CITES, by= "Taxon")%>% dplyr::full_join(db33_CITES, by= "Taxon")%>% dplyr::full_join(db34_CITES, by= "Taxon")%>% dplyr::full_join(db35_CITES, by= "Taxon")%>% dplyr::full_join(db36_CITES, by= "Taxon")%>% dplyr::full_join(db37_CITES, by= "Taxon")%>% dplyr::full_join(db38_CITES, by= "Taxon")%>% dplyr::full_join(db39_CITES, by= "Taxon")%>% dplyr::full_join(db40_CITES, by= "Taxon")%>% dplyr::full_join(db41_CITES, by= "Taxon")%>% dplyr::full_join(db42_CITES, by= "Taxon")%>% dplyr::full_join(db43_CITES, by= "Taxon")%>% dplyr::full_join(db44_CITES, by= "Taxon")%>% dplyr::full_join(db45_CITES, by= "Taxon")%>% dplyr::full_join(db46_CITES, by= "Taxon")

CITES_list1

write.csv(CITES_list1, "CITES_list1.csv") 

#check data and load again the CITES data using drop down menu in TNRS template (ID and taxa)

CITES_list2

CITES_list2_TNRS <- TNRS(taxonomic_names = CITES_list2, sources = c("wcvp", "wfo"))

CITES_list2_TNRS

Select_CITES_list2_TNRS_2024 <- dplyr::select(CITES_list2_TNRS, Name_submitted, Accepted_species)

Select_CITES_list2_TNRS_2024

write.csv(Select_CITES_list2_TNRS_2024, "Select_CITES_list2_TNRS_2024.csv") 


#Join data

Complete_timber_spp_list_all_2024_v4<- Final_Timber_spp_complete_all_Gomes_march24 %>%dplyr::left_join(Select_CITES_list2_TNRS_2024, by= "Accepted_species")

Complete_timber_spp_list_all_2024_v4

write.csv(Complete_timber_spp_list_all_2024_v4, "Complete_timber_spp_list_all_2024_v4.csv")

#The CITES website was used to verify and include the CITES appendices updated to 2023 - 2024 (https://checklist.cites.org/#/en) 

#double check and load again the data using drop down menu

#A total of 1136 species with additional information were obtained. 










