# Rule
# target : prerequisite1 prerequisite2 prerequisite3
#	(tab)recipe

.PHONY: all clean
################################################################################
# 
# Part 3: Figure and table generation
# 
# Run scripts to generate figures
# 
################################################################################

figures/chap04_map.png:\
code/chap04_plot_map.R
	Rscript code/chap04_plot_map.R
