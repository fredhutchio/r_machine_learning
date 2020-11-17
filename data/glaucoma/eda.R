library(tidyverse)

# read in
glaucoma_whole <- read_csv("./data/glaucoma/ds_whole.csv")
glaucoma_test <- read_csv("./data/glaucoma/ds_test.csv")
glaucoma_train <- read_csv("./data/glaucoma/ds_train.csv")

# view
glimpse(glaucoma_whole)

# means

summary <- glaucoma_whole %>%
  group_by(glaucoma) %>%
  summarise(mean_age = mean(age),
            mean_ocular_pressure = mean(ocular_pressure),
            mean_md = mean(MD),
            mean_psd = mean(PSD),
            mean_ght = mean(GHT),
            mean_cornea_thickness = mean(cornea_thickness),
            mean_RNFL4 = mean(RNFL4.mean))

glaucoma_whole %>%
  gather()
