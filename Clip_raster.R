library(raster)
library(rgdal)

rast<-raster("D:\\TEMP\\raster_file.tif")
shp<-readOGR("D:\\TEMP\\shapefile.shp", stringsAsFactors = F)
output<-"D:\\TEMP\\out"

NAME<-"id" #Unique id of polygon 
for (i in 1:length(shp)){
  poly<-shp[i,]
  rast_clip<-crop(rast,poly)
  writeRaster(rast_clip,paste0(output,"\\Clipped_",poly@data[,NAME],".tif"))
}