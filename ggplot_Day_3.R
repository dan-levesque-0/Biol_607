##
#
##
library(palmerpenguins)
library(ggplot2)
theme_set(theme_base()) # set a theme customization or base

pen_mass_depth <-
  ggplot(data = penguins,
         mapping = aes(x = body_mass_g,
                       y = bill_depth_mm,
                       color = species)) + 
  geom_point()

pen_mass_depth

##
# Adding labels
##
pen_mass_depth <- pen_mass_depth + 
  labs(x = "Body Mass (g)",
       y = "Bill Depth (mm)",
       color = "Species of\nPenguin",
       title = "Penguin Bill Depth versus Size",
       subtitle = "Data from Palmer LTER") # line break!

# look at it
pen_mass_depth + 
  theme_bw(base_size = 12,
           base_family ="Times")

pacman::p_load("ggthemes")
pacman::p_load_gh("Mikata-Project/ggthemr")

# favorite theme
pen_mass_depth + 
  theme_foundation()

## trying ggthemr
ggthemr("dust")
pen_mass_depth

ggthemr("light",
        darken_swatch(amount = 0.05))
pen_mass_depth

# trying themr
# ggthemr("grass")
# pen_mass_depth
# ggthemr_reset()

# using theme() for more
pen_mass_depth + 
  theme(legend.position = "bottom")

##
# Color
##

pen_mass_depth + 
  scale_color_manual(values = c("skyblue", "lightpink", "#778811"))

# built in palettes
pen_mass_depth + 
  scale_color_brewer(palette = "Dark2")

pen_mass_depth + 
  scale_color_viridis_d()

# color for continuous data
pen_mass_col <-
  ggplot(data = penguins,
         mapping = aes(x = bill_depth_mm,
                       y = bill_length_mm,
                       color = body_mass_g)) + 
  geom_point()

pen_mass_col

# viridis
pen_mass_col + 
  scale_color_viridis_c()

pen_mass_col + 
  scale_color_distiller(palette = "Dark2")

# binning
pen_mass_col + 
  scale_color_binned()

pen_mass_col + 
  scale_color_viridis_b()

##
# We also want to summarize information
## 

# Look at how species relates to flipper length
ggplot(data = penguins,
       mapping = aes(x = species,
                   y = flipper_length_mm,
                   color = sex)) + 
  stat_summary(position = position_dodge(width = 0.3))

# 2d summaries
pen_depth <- ggplot( data = penguins,
                     mapping = aes(x = body_mass_g,
                                   y = bill_depth_mm))

pen_depth +
  stat_bin2d() +
  scale_fill_viridis_c()


pen_depth +
  stat_density2d()

pen_depth + 
  stat_density_2d_filled()


# fit a line
pen_depth +
  geom_point() +
  stat_smooth(aes(group = species))
