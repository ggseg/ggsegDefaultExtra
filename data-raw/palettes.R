library(dplyr)
devtools::load_all(".")

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
dkextra <- dplyr::mutate(dkextra,
                  region = gsub("medial orbito frontal", "medial orbitofrontal", region),
                  region = gsub("pre central", "precentral", region),
                  region = gsub("post central", "postcentral", region),
                  region = gsub("para central", "paracentral", region),
                  region = gsub("banks superior temporal", "bankssts", region)
                  )
dkextra <- dplyr::mutate(dkextra, ggseg = purrr::map(ggseg, ~dplyr::mutate(.x, .subid = 1)))
usethis::use_data(dkextra, internal = FALSE, overwrite = TRUE)

devtools::load_all("../../ggsegExtra/")
hcpa_3d <- restruct_old_3datlas(hcpa_3d)
hcpa_3d <- as_ggseg3d_atlas(hcpa_3d)
usethis::use_data(hcpa_3d, internal = FALSE, overwrite = TRUE)
