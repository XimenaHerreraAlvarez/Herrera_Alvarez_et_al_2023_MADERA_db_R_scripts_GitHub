
#LOAD PACKAGES

library(TNRS)
library(dplyr)
library(readr)

### ADDITIONAL DATA ###

#"Amazonian timber submitted" data was imported from csv files using the drop down menu. This data set was the original "Amazonian timber", but using TNRS input requirements (ID and taxa columns)

#Adding the following information from TNRS: Accepted_family, Genus_matched, Accepted_name_author, Accepted_name_url

Amazoniam_timber_submitted

Amazoniam_timber_submitted$taxa <- as.factor(Amazoniam_timber_submitted$taxa)

Amazonian_timber_submitted_TNRS <- TNRS(taxonomic_names = Amazoniam_timber_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))

Amazonian_timber_submitted_TNRS 

Amazonian_timber_TNRS_columns <- dplyr::select(Amazonian_timber_submitted_TNRS, Name_submitted, Accepted_family, Genus_matched, Accepted_name_author, Accepted_name_url)

Amazonian_timber_TNRS_countries <- Amazonian_timber_TNRS_columns%>% dplyr::full_join(Amazonian_timber, by= Accepted_species)

Amazonian_timber_TNRS_countries

#ADDING LIFE FORMS FROM CARDOSO DATA SET

Cardoso_complete #Cardoso complete data

names(Cardoso_complete)

species_select_cardoso <- dplyr::select(Cardoso_complete, ID, Accepted_species)

species_select_cardoso_tnrs <- TNRS(taxonomic_names = species_select_cardoso, sources = c("tropicos", "wcvp", "usda", "wfo"))

species_select_cardoso_tnrs

names(species_select_cardoso_tnrs)

species_cardoso <- dplyr::select(species_select_cardoso_tnrs,Name_submitted, Accepted_species)

names(species_cardoso)

Cardoso_complete1 <- Cardoso_complete
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

Amazonian_timber_final_Cardoso <- Amazonian_timber_TNRS_countries%>% dplyr::inner_join(Final_Cardoso2, by= "Accepted_species")

#DELETE DUPLICATES AND DOUBLE CHECK THE FINAL DATA SET

Amazonian_timber_final_Cardoso1 <- Amazonian_timber_final_Cardoso %>% distinct(.keep_all = TRUE)

Amazonian_timber_final_Cardoso2

names(Amazonian_timber_final_Cardoso2)

write.csv(Amazonian_timber_final_Cardoso2, "Amazonian_timber_final_Cardoso2_2023.csv")

#ADDING DATA FROM TER STEEGE ET AL (2020): number_individuals_ATDN_plots,	number_plots_ATDN_plots, estimated_ind_Amazon

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

ter_Steege_2020_submitted_2023

ter_Steege_2020_submitted_2023_TNRS <- TNRS(taxonomic_names = ter_Steege_2020_submitted_2023, sources = c("tropicos", "wcvp", "usda", "wfo"))

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

Final_ter_Steege_2020_population_2023_1

Population_ter_Steege_2020_timber_spp_2023_1 <- Amazonian_timber_final_Cardoso2%>% dplyr::left_join(Final_ter_Steege_2020_population_2023_1, by= "Accepted_species")

Population_ter_Steege_2020_timber_spp_2023_1

write.csv(Population_ter_Steege_2020_timber_spp_2023_1, "Population_ter_Steege_2020_timber_spp_2023_1.csv")

Population_ter_Steege_2020_timber_spp_2023_1                                        
names(Population_ter_Steege_2020_timber_spp_2023_1)

length(unique(Population_ter_Steege_2020_timber_spp_2023_1$Accepted_species))

str(Population_ter_Steege_2020_timber_spp_2023_1)

Final_population_ter_Steege_timber_spp_2023 <- Population_ter_Steege_2020_timber_spp_2023_1  

#ADDING DATA FROM TER STEEGE ET AL (2013): check_hyperdominant_spp	Forest_type_IV_max_hyperdominant	IV.indcls_hyperdominant

##Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

Hyperdominant_spp_submitted_TNRS <- TNRS(taxonomic_names = Hyperdominant_spp_submitted,  sources = c("tropicos", "wcvp", "usda", "wfo"))

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

Hyperdominant_timber_spp <- Final_population_ter_Steege_timber_spp_2023%>%dplyr::left_join(Final_hyperdominant_info, by= "Accepted_species")

write.csv(Hyperdominant_timber_spp, "Hyperdominant_timber_spp.csv")

Final_Hyperdominant_timber_spp_2023

#ADDING DATA FROM ITTO (2014a)

##Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

ITTO_commercial_spp_submitted

names(ITTO_commercial_spp_submitted)

ITTO_commercial_spp_TNRS <- TNRS(taxonomic_names = ITTO_commercial_spp_submitted,  sources = c("tropicos", "wcvp", "usda", "wfo"))

ITTO_commercial_spp_TNRS

Select_ITTO_commercial_spp_TNRS <- dplyr::select(ITTO_commercial_spp_TNRS, Name_submitted, Accepted_species)

Select_ITTO_commercial_spp_TNRS

names(Select_ITTO_commercial_spp_TNRS)

names(Complete_ITTO_commercial_timber_spp)

names(Complete_ITTO_commercial_timber_spp)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

#Joining data sets 

Final_complete_ITTO_commercial_spp <- Complete_ITTO_commercial_timber_spp%>% dplyr::full_join(Select_ITTO_commercial_spp_TNRS, by= Name_submitted)

Final_complete_ITTO_commercial_spp

Timber_spp_complete_ITTO_commercial <- Final_Hyperdominant_timber_spp_2023%>%dplyr::left_join(Final_complete_ITTO_commercial_spp, by= "Accepted_species")

write.csv(Timber_spp_complete_ITTO_commercial, "Timber_spp_complete_ITTO_commercial_2023.csv")

Final_timber_spp_complete_ITTO_commercial_2023

#ADDING DATA FROM ITTO (2014b) LUS species

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

ITTO_LUS_spp_submitted

names(ITTO_LUS_spp_submitted)

ITTO_LUS_spp_TNRS <- TNRS(taxonomic_names = ITTO_LUS_spp_submitted,  sources = c("tropicos", "wcvp", "usda", "wfo"))

ITTO_LUS_spp_TNRS

Select_ITTO_LUS_spp_TNRS <- dplyr::select(ITTO_LUS_spp_TNRS, Name_submitted, Accepted_species)

Select_ITTO_LUS_spp_TNRS

#Joining data sets

Complete_ITTO_LUS_spp

names(Complete_ITTO_LUS_spp)

names(Complete_ITTO_LUS_spp)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Final_complete_ITTO_LUS_spp_2023 <- Complete_ITTO_LUS_spp%>% dplyr::full_join(Select_ITTO_LUS_spp_TNRS, by= Name_submitted)

Final_complete_ITTO_LUS_spp_2023

Timber_spp_complete_ITTO_commercial_LUS_2023 <- Final_timber_spp_complete_ITTO_commercial_2023%>%dplyr::left_join(Final_complete_ITTO_LUS_spp_2023, by= "Accepted_species")

write.csv(Timber_spp_complete_ITTO_commercial_LUS_2023, "Timber_spp_complete_ITTO_commercial_LUS_2023.csv")

Final_Timber_spp_complete_ITTO_commercial_LUS_2023

#ADDING IUCN DATA 

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

IUCN_2022_submitted

names(IUCN_2022_submitted)

IUCN_2022_TNRS <- TNRS(taxonomic_names = IUCN_2022_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))

IUCN_2022_TNRS

View(IUCN_2022_TNRS)

Select_IUCN_2022_TNRS <- dplyr::select(IUCN_2022_TNRS, Name_submitted, Accepted_species)

Select_IUCN_2022_TNRS

#Joining data sets

Complete_IUCN_2022
names(Complete_IUCN_2022)
names(Complete_IUCN_2022)[2] <- "Name_submitted"
Complete_IUCN_2022
Name_submitted <- "Name_submitted"
Final_complete_IUCN_2022 <- Complete_IUCN_2022%>% dplyr::full_join(Select_IUCN_2022_TNRS, by= Name_submitted)

Final_complete_IUCN_2022

Timber_spp_complete_ITTO_commercial_LUS_IUCN_2023 <- Final_Timber_spp_complete_ITTO_commercial_LUS_2023%>% dplyr::left_join(Final_complete_IUCN_2022, by= "Accepted_species")

Timber_spp_complete_ITTO_commercial_LUS_IUCN_2023

write.csv(Timber_spp_complete_ITTO_commercial_LUS_IUCN_2023, "Timber_spp_complete_ITTO_commercial_LUS_IUCN_2023.csv")
Final_Timber_spp_complete_ITTO_commercial_LUS_IUCN_2023

#ADDING DATA FROM Gomes et al. (2019)

#Data was imported from csv files using the drop down menu and in TNRS template (ID and taxa columns)

Gomes_2019_submitted

names(Gomes_2019_submitted)

Gomes_2019_TNRS <- TNRS(taxonomic_names = Gomes_2019_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))

Gomes_2019_TNRS

Select_Gomes_2019_TNRS <- dplyr::select(Gomes_2019_TNRS, Name_submitted, Accepted_species)

Select_Gomes_2019_TNRS

write.csv(Select_Gomes_2019_TNRS, "Select_Gomes_2019_TNRS.csv")

#Joining data sets

names(Complete_Gomes_2019)
names(Complete_Gomes_2019)[2] <- "Name_submitted"

Name_submitted <- "Name_submitted"

Complete_Gomes_2019

Final_complete_Gomes_2019 <- Complete_Gomes_2019%>% dplyr::full_join(Select_Gomes_2019_TNRS, by= Name_submitted)

Final_complete_Gomes_2019
Timber_spp_complete_ITTO_commercial_LUS_IUCN_2022_Gomes_2019_2023 <- Timber_spp_complete_ITTO_commercial_LUS_IUCN_2023 %>%dplyr::left_join(Final_complete_Gomes_2019, by= "Accepted_species")

write.csv(Timber_spp_complete_ITTO_commercial_LUS_IUCN_2022_Gomes_2019_2023, "Timber_spp_complete_ITTO_commercial_LUS_IUCN_2022_Gomes_2019_2023.csv")

#10 duplicate spp were removed according to the most recent assessment year in IUCN

Final_Timber_spp_complete_ITTO_commercial_LUS_IUCN_2022_Gomes_2019_2023

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

CITES_list2_TNRS <- TNRS(taxonomic_names = CITES_list2, sources = c("tropicos", "wcvp", "usda", "wfo"))

CITES_list2_TNRS

Select_CITES_list2_TNRS_2023 <- dplyr::select(CITES_list2_TNRS, Name_submitted, Accepted_species)

Select_CITES_list2_TNRS_2023

write.csv(Select_CITES_list2_TNRS_2023, "Select_CITES_list2_TNRS_2023.csv") 

Final_CITES_list2_TNRS_2023

#Join data

Complete_timber_spp_list_all_2023 <- Final_Timber_spp_complete_ITTO_commercial_LUS_IUCN_2022_Gomes_2019_2023 %>%dplyr::left_join(CITES_final, by= "Accepted_species")

write.csv(Complete_timber_spp_list_all_2023, "Complete_timber_spp_list_all_2023.csv")

#double check and load again the data using drop down menu

Final_complete_timber_spp_list_all_2023





































































