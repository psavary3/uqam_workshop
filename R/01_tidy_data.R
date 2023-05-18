#### Tidying data - data wrangling
## 2023-05-18
## Workshop at UQAM by Elliot Gould

library(tidyverse)
library(usethis)

# If using underscores in the project name
usethis::use_description(check_name = FALSE)
usethis::use_mit_license()

# If you need to change name, first do that in your local folder first, then commit, then push

bat_dat <- read_csv("./data/bat_dat.csv")

# Quick overview of the dataset
glimpse(bat_dat)

bat_dat <- bat_dat %>%
  # Convert some variables to factor
  mutate(Site = as.factor(Site),
         Habitat = as.factor(Habitat),
         Season = as.factor(Season)) %>%
  # Remove the 'Avoca' site
  filter(Site != "Avoca")

# Check the changes
class(bat_dat)

