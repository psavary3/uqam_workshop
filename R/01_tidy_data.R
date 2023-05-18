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

bat_dat %>% 
  filter(Chgouldii > 100) %>%
  arrange(-Chgouldii) %>%
  select(Site, Chgouldii) %>% View()


bat_dat %>% 
  top_n(10, Chgouldii)

colnames(bat_dat)

bat_dat %>%
  select(contains("Nyc"))

bat_dat %>%
  select(starts_with("Dist", ignore.case = FALSE))

bat_dat %>%
  select(ends_with("land"))

# Combine bat species mistakenly named with two names although they are the same
bat_dat <- bat_dat %>% 
  mutate(Taust_Vdarl = Taustralis + Vdarlingtoni) %>%
  select(-Taustralis, -Vdarlingtoni)


