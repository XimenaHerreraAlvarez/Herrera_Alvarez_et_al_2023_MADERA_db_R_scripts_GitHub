
#LOAD PACKAGES

library(TNRS)
library(dplyr)
library(readr)

#LOAD DATA BY COUNTRY AND REFERENCES

#Original data was imported from csv files using the drop down menu. Data sets had 2 columns: ID and taxa in order to match TNRS input requirements.

Bolivia_submitted
Brazil_submitted
Colombia_submitted
Ecuador_submitted
French_Guiana_submitted1
Guyana_submitted
Herrero_Jauregui_submitted
Peru_submitted
Piponiot_submitted
Suriname_submitted
Venezuela_submitted


#all data from all sources is submitted to TNRS package and the output data set was added a new column with the name of the source (e.g.: country and reference) and another columns with number "1" to indicate presence.

Bolivia_tnrs <- TNRS(taxonomic_names = Bolivia_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))
Bolivia_tnrs
Bolivia <- rep(1, nrow(Bolivia_tnrs))
Bolivia_tnrs1 <- cbind(Bolivia_tnrs, Bolivia)
table(Bolivia_tnrs1$Taxonomic_status)

Brazil_tnrs <- TNRS(taxonomic_names = Brazil_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))
Brazil_tnrs    
Brazil <- rep(1, nrow(Brazil_tnrs))
Brazil_tnrs1 <- cbind(Brazil_tnrs, Brazil)
table(Brazil_tnrs1$Taxonomic_status)

Colombia_tnrs <- TNRS(taxonomic_names = Colombia_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Colombia_tnrs
Colombia <- rep(1, nrow(Colombia_tnrs))
Colombia_tnrs1 <- cbind(Colombia_tnrs, Colombia)
table(Colombia_tnrs1$Taxonomic_status)

Ecuador_tnrs <- TNRS(taxonomic_names = Ecuador_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Ecuador_tnrs
Ecuador <- rep(1, nrow(Ecuador_tnrs))
Ecuador_tnrs1 <- cbind(Ecuador_tnrs, Ecuador)
table(Ecuador_tnrs1$Taxonomic_status)

French_Guiana_tnrs <- TNRS(taxonomic_names = French_Guiana_submitted1, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
French_Guiana_tnrs
French_Guiana <- rep(1, nrow(French_Guiana_tnrs))
French_Guiana_tnrs1 <- cbind(French_Guiana_tnrs,French_Guiana)
table(French_Guiana_tnrs1$Taxonomic_status)

Guyana_tnrs <- TNRS(taxonomic_names = Guyana_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Guyana_tnrs
Guyana <- rep(1, nrow(Guyana_tnrs))
Guyana_tnrs1 <- cbind(Guyana_tnrs, Guyana)
table(Guyana_tnrs1$Taxonomic_status)

Herrero_Jauregui_tnrs <- TNRS(taxonomic_names = Herrero_Jauregui_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Herrero_Jauregui_tnrs
Herrero_Jauregui <- rep(1, nrow(Herrero_Jauregui_tnrs))
Herrero_Jauregui_tnrs1 <- cbind(Herrero_Jauregui_tnrs,Herrero_Jauregui)
table(Herrero_Jauregui_tnrs1$Taxonomic_status)

Peru_tnrs <- TNRS(taxonomic_names = Peru_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Peru_tnrs
Peru <- rep(1, nrow(Peru_tnrs))
Peru_tnrs1 <- cbind(Peru_tnrs, Peru)
table(Peru_tnrs1$Taxonomic_status)

Piponiot_tnrs <- TNRS(taxonomic_names = Piponiot_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Piponiot_tnrs
Piponiot <- rep(1, nrow(Piponiot_tnrs))
Piponiot_tnrs1 <- cbind(Piponiot_tnrs, Piponiot)
table(Piponiot_tnrs1$Taxonomic_status)

Suriname_tnrs <- TNRS(taxonomic_names = Suriname_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Suriname_tnrs
Suriname <- rep(1, nrow(Suriname_tnrs))
Suriname_tnrs1 <- cbind(Suriname_tnrs, Suriname)
table(Suriname_tnrs1$Taxonomic_status)

Venezuela_tnrs <- TNRS(taxonomic_names = Venezuela_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))                    
Venezuela_tnrs
Venezuela <- rep(1, nrow(Venezuela_tnrs))
Venezuela_tnrs1 <- cbind(Venezuela_tnrs, Venezuela)
table(Venezuela_tnrs1$Taxonomic_status)

#Cardoso is not a source to add data but is a source to filter the Amazonian species. However, we also need to standardize the taxonomic names in TNRS.

Cardoso_Amazonian_trees_submitted
Cardoso_tnrs <- TNRS(taxonomic_names = Cardoso_Amazonian_trees_submitted, sources = c("tropicos", "wcvp", "usda", "wfo"))
Cardoso_tnrs
table(Cardoso_tnrs$Taxonomic_status)

#JOIN ALL DATA BY NAME SUBMITTED TO KNOW THE STARTING TOTAL NUMBER OF TAXA (including genera and species)

Amazonian_countries <- Bolivia_tnrs1%>% dplyr::full_join(Brazil_tnrs1, by= Name_submitted) %>% dplyr::full_join(Colombia_tnrs1, by= Name_submitted)%>% dplyr::full_join(Ecuador_tnrs1, by= Name_submitted)%>% dplyr::full_join(French_Guiana_tnrs1, by= Name_submitted)%>% dplyr::full_join(Guyana_tnrs1, by= Name_submitted)%>% dplyr::full_join(Herrero_Jauregui_tnrs1, by= Name_submitted)%>% dplyr::full_join(Peru_tnrs1, by= Name_submitted)%>% dplyr::full_join(Piponiot_tnrs1, by= Name_submitted)%>% dplyr::full_join(Suriname_tnrs1, by= Name_submitted)%>% dplyr::full_join(Venezuela_tnrs1, by= Name_submitted)

Amazonian_countries

#DELETE DUPLICATES AND BLANK ROWS 

Amazonian_countries_unique <- unique(Amazonian_countries $ Name_submitted)
Amazonian_countries_unique <- as.data.frame(Amazonian_countries_unique)

#THE STARTING TOTAL NUMBER OF TAXA IS 1714 (including genera and species)

write.csv(Amazonian_countries,"Amazonian_countries_original_1714.csv")

#We added a new column with the name of the source (e.g.: country and reference) and another columns with number "1" to indicate presence.

Bolivia_final <- unique(Bolivia_tnrs $ Accepted_species)
Bolivia <- rep(1, length(Bolivia_final))
Bolivia_final1 <- cbind(Bolivia_final, Bolivia)
Bolivia_final1 <- as.data.frame(Bolivia_final1)
Bolivia_final1$Bolivia_final <- as.factor (Bolivia_final1$Bolivia_final)
names(Bolivia_final1)[1] <- "Accepted_species"

Brazil_final <- unique(Brazil_tnrs $ Accepted_species)
Brazil <- rep(1, length(Brazil_final))
Brazil_final1 <- cbind(Brazil_final, Brazil)
Brazil_final1 <- as.data.frame(Brazil_final1)
Brazil_final1$Brazil_final <- as.factor (Brazil_final1$Brazil_final)
names(Brazil_final1)[1] <- "Accepted_species"

Colombia_final <- unique(Colombia_tnrs $ Accepted_species)
Colombia <- rep(1, length(Colombia_final))
Colombia_final1 <- cbind(Colombia_final, Colombia)
Colombia_final1 <- as.data.frame(Colombia_final1)
Colombia_final1$Colombia_final <- as.factor (Colombia_final1$Colombia_final)
names(Colombia_final1)[1] <- "Accepted_species"

Ecuador_final <- unique(Ecuador_tnrs $ Accepted_species)
Ecuador <- rep(1, length(Ecuador_final))
Ecuador_final1 <- cbind(Ecuador_final, Ecuador)
Ecuador_final1 <- as.data.frame(Ecuador_final1)
Ecuador_final1$Ecuador_final <- as.factor (Ecuador_final1$Ecuador_final)
names(Ecuador_final1)[1] <- "Accepted_species"

French_Guiana_final <- unique(French_Guiana_tnrs $ Accepted_species)
French_Guiana <- rep(1, length(French_Guiana_final))
French_Guiana_final1 <- cbind(French_Guiana_final,French_Guiana)
French_Guiana_final1 <- as.data.frame(French_Guiana_final1)
French_Guiana_final1$French_Guiana_final <- as.factor (French_Guiana_final1$French_Guiana_final)
names(French_Guiana_final1)[1] <- "Accepted_species"

Guyana_final <- unique(Guyana_tnrs $ Accepted_species)
Guyana <- rep(1, length(Guyana_final))
Guyana_final1 <- cbind(Guyana_final,Guyana)
Guyana_final1 <- as.data.frame(Guyana_final1)
Guyana_final1$Guyana_final <- as.factor (Guyana_final1$Guyana_final)
names(Guyana_final1)[1] <- "Accepted_species"

Herrero_Jauregui_final <- unique(Herrero_Jauregui_tnrs $ Accepted_species)
Herrero_Jauregui <- rep(1, length(Herrero_Jauregui_final))
Herrero_Jauregui_final1 <- cbind(Herrero_Jauregui_final,Herrero_Jauregui)
Herrero_Jauregui_final1 <- as.data.frame(Herrero_Jauregui_final1)
Herrero_Jauregui_final1$Herrero_Jauregui_final <- as.factor (Herrero_Jauregui_final1$Herrero_Jauregui_final)
names(Herrero_Jauregui_final1)[1] <- "Accepted_species"

Peru_final <- unique(Peru_tnrs $ Accepted_species)
Peru <- rep(1, length(Peru_final))
Peru_final1 <- cbind(Peru_final,Peru)
Peru_final1 <- as.data.frame(Peru_final1)
Peru_final1$Peru_final <- as.factor (Peru_final1$Peru_final)
names(Peru_final1)[1] <- "Accepted_species"

Piponiot_final <- unique(Piponiot_tnrs $ Accepted_species)
Piponiot <- rep(1, length(Piponiot_final))
Piponiot_final1 <- cbind(Piponiot_final,Piponiot)
Piponiot_final1 <- as.data.frame(Piponiot_final1)
Piponiot_final1$Piponiot_final <- as.factor (Piponiot_final1$Piponiot_final)
names(Piponiot_final1)[1] <- "Accepted_species"

Suriname_final <- unique(Suriname_tnrs $ Accepted_species)
Suriname <- rep(1, length(Suriname_final))
Suriname_final1 <- cbind(Suriname_final,Suriname)
Suriname_final1 <- as.data.frame(Suriname_final1)
Suriname_final1$Suriname_final <- as.factor (Suriname_final1$Suriname_final)
names(Suriname_final1)[1] <- "Accepted_species"

Venezuela_final <- unique(Venezuela_tnrs $ Accepted_species)
Venezuela <- rep(1, length(Venezuela_final))
Venezuela_final1 <- cbind(Venezuela_final,Venezuela)
Venezuela_final1 <- as.data.frame(Venezuela_final1)
Venezuela_final1$Venezuela_final <- as.factor (Venezuela_final1$Venezuela_final)
names(Venezuela_final1)[1] <- "Accepted_species"

#JOIN ALL DATA BY ACCEPTED SPECIES (TNRS)

Amazonian_countries_final <- Bolivia_final1%>% dplyr::full_join(Brazil_final1, by= Accepted_species)%>% dplyr::full_join(Colombia_final1, by= Accepted_species)%>% dplyr::full_join(Ecuador_final1, by= Accepted_species)%>% dplyr::full_join(French_Guiana_final1, by= Accepted_species)%>% dplyr::full_join(Guyana_final1, by= Accepted_species)%>% dplyr::full_join(Herrero_Jauregui_final1, by= Accepted_species)%>% dplyr::full_join(Peru_final1, by= Accepted_species)%>% dplyr::full_join(Piponiot_final1, by= Accepted_species)%>% dplyr::full_join(Suriname_final1, by= Accepted_species)%>% dplyr::full_join(Venezuela_final1, by= Accepted_species)

Amazonian_countries_final

#DELETE DUPLICATES AND BLANK ROWS 

Amazonian_countries_final <- Amazonian_countries_final[!(Amazonian_countries_final$Accepted_species == ""), ]

#THE TOTAL NUMBER OF ACCEPTED SPECIES IS 1478 (doest not include genera)

write.csv(Amazonian_countries_final,"Amazonian_countries_final_1478.csv")

#We added a new column with the number "1" for Cardoso species to indicate presence.

Cardoso_final <- unique(Cardoso_tnrs $ Accepted_species)
Cardoso <- rep(1, length(Cardoso_final))
Cardoso_final_data_frame <- as.data.frame(Cardoso_final)
Cardoso_data_frame
Cardoso_final1 <- cbind(Cardoso_final, Cardoso)
Cardoso_final1 <- as.data.frame(Cardoso_final1)
Cardoso_final1$Cardoso_final <- as.factor (Cardoso_final1$Cardoso_final)
names(Cardoso_final1)[1] <- "Accepted_species"

#JOIN DATA FROM AL SOURCES (timber species) AND CARDOSO (as amazonian species) TO OBTAIN THE AMAZONIAN TIMBER SPECIES

Amazonian_timber <- dplyr::inner_join(Cardoso_final1, Amazonian_countries_final, by= 'Accepted_species')

#DELETE DUPLICATES AND BLANK ROWS

Amazonian_timber <- Amazonian_timber[!(Amazonian_timber$Accepted_species == ""), ]

#THE TOTAL NUMBER OF AMAZONIAN TIMBER ACCEPTED SPECIES IS 1112 (doest not include genera)

Amazonian_timber

#END 


















