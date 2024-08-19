
library(dplyr)
library(readr)
library(tidyverse)
library(scales)
library(ggplot2)
library(wesanderson)
library(viridis)

MADERA_v2_0_May_2024
names(MADERA_v2_0_May_2024)


#FIGURES_May_2024

#Abundance_log10

Fig_familias_abundance_log10_2024

view(Fig_familias_abundance_log10_2024)
head(Fig_familias_abundance_log10_2024)


ggplot(data = Fig_familias_abundance_log10_2024) + geom_col(aes(x = log10_ind_Amazon, y = reorder(Accepted_family, log10_ind_Amazon), fill= log10_ind_Amazon)) + scale_fill_gradient(low= "#440154FF", high= "#FDE725FF", limits = c(9, 11)) + labs(y = "Family", x = "Number of individuals") + theme(axis.title = element_text(size = 30), axis.text.y = element_text(size = 20), legend.title = element_text(size = 20), legend.text = element_text (size = 15) + theme(axis.text = element_text(size= 20)))


#Richness

Fig_familias_species_2024

view(Fig_familias_species_2024)
head(Fig_familias_species_2024)

ggplot(data = Fig_familias_species_2024) + geom_col(aes(x = Number_species, y = reorder(Accepted_family, Number_species, sum), fill= Number_species)) + scale_fill_gradient(low= "#440154FF", high= "#FDE725FF") + labs(y = "Family", x = "Number of species") + theme(axis.title = element_text(size = 30), axis.text.y = element_text(size = 20), legend.title = element_text(size = 20), legend.text = element_text (size = 15))

#ITTO SPECIES

Fig_familias_ITTO_commercial_2024

view(Fig_familias_ITTO_commercial_2024)
head(Fig_familias_ITTO_commercial_2024)

ggplot(data = Fig_familias_ITTO_commercial_2024) + geom_col(aes(x = Number_species, y = reorder(Accepted_family, Number_species, sum), fill= Number_species)) + scale_fill_gradient(low= "#440154FF", high= "#FDE725FF", limits = c(1, 10)) + labs(y = "Family", x = "Number of species") +
  theme(axis.title = element_text(size = 30), axis.text.y = element_text(size = 20), legend.title = element_text(size = 20), legend.text = element_text (size = 15))


#ITTO SPECIES LUS

Fig_familias_ITTO_LUS_spp_2024

view(Fig_familias_ITTO_LUS_2024)
head(Fig_familias_ITTO_LUS_2024)

ggplot(data = Fig_familias_ITTO_LUS_spp_2024) + geom_col(aes(x = Number_species, y = reorder(Accepted_family, Number_species, sum), fill= Number_species)) + scale_fill_gradient(low= "#440154FF", high= "#FDE725FF") + labs(y = "Family", x = "Number of species") + theme(axis.title = element_text(size = 30), axis.text.y = element_text(size = 20),  legend.title = element_text(size = 20), legend.text = element_text (size = 15))


#IUCN SPECIES

Fig_familias_species_IUCN_2024

view(Fig_familias_species_IUCN_2024)
head(Fig_familias_species_IUCN_2024)

ggplot(data = Fig_familias_species_IUCN_2024) + geom_col(aes(x = Number_species, y = reorder(Accepted_family, Number_species, sum), fill= Number_species)) + scale_fill_gradient(low= "#440154FF", high= "#FDE725FF") + labs(y = "Family", x = "Number of species") + theme(axis.title = element_text(size = 30), axis.text.y = element_text(size = 20), legend.title = element_text(size = 20), legend.text = element_text (size = 15))

#Figuras Climate Change escenarios_Gomes 2019

Datos_climate_change_temperature_2024
View(Datos_climate_change_2024)

ggplot(data = Datos_climate_change_temperature_2024) + geom_bar(mapping = aes(x = Climate_change_scenarios, fill = Red_List_Category_IUCN), position = "dodge") + labs(x= "Climate change scenarios", y= "Number of threatened species") + theme(axis.title = element_text(size = 20), axis.text.y = element_text(size = 20),  legend.title = element_text(size = 20), legend.text = element_text (size = 20)) + scale_fill_viridis_d(option = "D") + theme(axis.text = element_text(size=20))

Datos_climate_change_2023$Climate_change_scenarios <- factor(Datos_climate_change_2023$Climate_change_scenarios, levels= c('2050_RCP_2.6','2050_RCP 8.5')) 

#Climate change BAU escenarios

Datos_climate_change_BAU_2024

View(Datos_climate_change_BAU_2024)

ggplot(data = Datos_climate_change_BAU_2024) + geom_bar(mapping = aes(x = Climate_change_scenarios, fill = Red_List_Category_IUCN), position = "dodge") + labs(x= "Climate change scenarios", y= "Number of threatened species") + theme(axis.title = element_text(size = 20), axis.text.y = element_text(size = 20), legend.title = element_text(size = 15), legend.text = element_text (size = 15)) + scale_fill_viridis_d(option = "D") + theme(axis.text = element_text(size=15))

#Climate change IGS escenarios

Datos_climate_change_IGS_2024

ggplot(data = Datos_climate_change_IGS_2024) + geom_bar(mapping = aes(x = Climate_change_scenarios, fill = Red_List_Category_IUCN), position = "dodge") + labs(x= "Climate change scenarios", y= "Number of threatened species") + theme(axis.title = element_text(size = 20), axis.text.y = element_text(size = 20), legend.title = element_text(size = 15), legend.text = element_text (size = 15)) + scale_fill_viridis_d(option = "D")  + theme(axis.text = element_text(size=15))

#TABLE IUCN_2023_2024

IUCN_Red_list_Categories_2023_2024

library(flextable)

flextable(IUCN_Red_list_Categories_2023_2024)

Tabla_IUCN_flex_2024 <- flextable(IUCN_Red_list_Categories_2023_2024)

Tabla_IUCN_flex_align_2024 <- align(Tabla_IUCN_flex_2024, j = 3, align = "center")

Table_bolds_vainilla_2024 <- theme_vanilla(Tabla_IUCN_flex_align_2024 )

Table_bolds_vainilla_2024

Table_bolds_vainilla_esp_2024 <- flextable::width(Table_bolds_vainilla_2024, j = c(1,2,3), width = c(2.7,2,2))

Table_bolds_vainilla_esp_2024





















      
            