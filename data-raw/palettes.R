library(dplyr)

# Make palette
k <- dplyr::slice(hcpa_3d, 1) %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!grepl("wall", region))

brain_pals = list(
  hcpa = setNames(k$colour, k$region)
)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)

# Fix name in dkextra after region rename of medial orbitofrontal
dkextra <- mutate(dkextra, region = gsub("medial orbito frontal", "medial orbitofrontal", region))
usethis::use_data(dkextra, internal = FALSE, overwrite = TRUE)

