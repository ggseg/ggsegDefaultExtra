library(hexSticker)
library(ggseg)
library(ggplot2)
devtools::load_all(".")

atlas <- dkextra
pkgname <- "ggsegDefaultExtra"

p <- ggseg(atlas = atlas,
           hemi = "left",
           show.legend = FALSE,
           colour = "grey30",
           size = .2,
           mapping = aes(fill =  region)) +
  scale_fill_brain2(palette = atlas$palette) +
  theme_void() +
  theme_transparent()

sticker(p,
        package = pkgname,
        filename="man/figures/logo.svg",
        s_y = 1.2,
        s_x = 1,
        s_width = 1.5,
        s_height = 1.5,
        p_family = "mono",
        p_size = 3,
        p_color = "grey30",
        p_y = .6,
        h_fill = "white",
        h_color = "grey30"
)

sticker(p,
        package = pkgname,
        filename="man/figures/logo.png",
        s_y = 1.2,
        s_x = 1,
        s_width = 1.5,
        s_height = 1.5,
        p_family = "mono",
        p_size = 3,
        p_color = "grey30",
        p_y = .6,
        h_fill = "white",
        h_color = "grey30"
)

pkgdown::build_favicons()
