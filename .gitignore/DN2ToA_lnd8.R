##############################################################
# The Program convert Digital Number (DN) to Top of Atmosphere (TOA) for 
# Landsat 8 image
##############################################################

library(landsat8)
library (sp)
library(raster)
library(maptools)
library(rgdal)
#library (tcltk)
#library (MODIStsp)
library(rgeos)
#Open Landsat 8 image from your stored location
fine_image <- brick(file.choose())

data(fine_image)
fine_fine.dn <- as(fine_image, 'SpatialGridDataFrame')
rm(fine_image)
#Conversion of Top of Atmosphere (ToA) from Digital Number (DN) Enter MultiPlicative Factor, Additive Factor and Sun Zenith Angle
fine_image.refl <- reflconvS(fine_fine.dn, 2.000E-05, -0.10000, 48.38)
rm(fine_fine.dn)
fine_image.refl
plot(raster(fine_image.refl))
gc()
#############################################################################





