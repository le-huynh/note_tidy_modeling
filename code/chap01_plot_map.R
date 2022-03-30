#---
# chap01_plot_map.R
#
# This Rscript:
# * generate map of neighborhood in chap01
# * save figure as .png
#
# Dependencies...
# data: ames
#
# Produces...
# figures/chap01_map.png
#---
library(tidyverse)
library(tidymodels)
library(ggmap)
library(rgdal)

data(ames)

map_bb <- c(left = min(ames$Longitude) - 0.005,
	  bottom = min(ames$Latitude) - 0.005,
	  right = max(ames$Longitude) + 0.005,
	  top = max(ames$Latitude) + 0.005)

# get stamen map
site_stamen <- ggmap::get_stamenmap(bbox = map_bb,
			      maptype = "watercolor",
			      zoom = 15)

fig = ggmap(site_stamen) +
	# Add the sample sites to the main plot as points.
	geom_point(data = ames,
		 mapping = aes(x = Longitude,
		 	     y = Latitude,
		 	     color = Neighborhood)) +
	labs(title = "Neighborhoods in Ames, IA",
	     caption = "\nVisualization by Le-Huynh -- Data by De Cock, D.\n") +
	theme(legend.position = "bottom",
	      legend.title = element_blank(),
	      legend.text = element_text(size = 9.5),
	      axis.text = element_blank(),
	      axis.title = element_blank(),
	      axis.ticks = element_blank())

ggsave("figures/chap01_map.png",
       fig,
       units = "mm",
       height = 240,
       width = 240)

