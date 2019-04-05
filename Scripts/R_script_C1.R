##############################################################
# 
# MOD_C1 
# R Training
# # Developed and manteined by Antonello Salis
# antonellosalis@gmail.com
# antonello.salis@fao.org
# Ver: 20190404
#
##############################################################
require("sf")
require("ggmap")
require("raster")
require("rgdal")
require("leaflet")
require("tmap")
require("maptools")
require("plyr")
require("mapproj")
require("GADMTools")
require("ggrepel")
#rm(list = ls())

register_google(key = " your key from Google here ", write = TRUE)
map <- get_map(location = "Uganda", zoom = 7)
map
plot(map)

UGA_districts<-readOGR(dsn = "Data_training/UGA_districts.shp")
UGA_wb<-readOGR(dsn = "Data_training/UGA_wb.shp")

st_crs(UGA_districts)
st_crs(UGA_wb)
plot(UGA_districts)

NFI_su <- st_as_sf(Data_admin, coords = c("X", "Y"), crs = st_crs(UGA_districts))

plot(UGA_districts, col="white",bg='grey')
plot(NFI_su,add=T, col="red", pch=3, size=4)

UGA_districts@data$id = as.numeric(rownames(UGA_districts@data))
UGA_dist_points = fortify(UGA_districts, region="id")
UGA_dist_df = join(UGA_dist_points, UGA_districts@data, by="id")

UGA_wb@data$id = as.numeric(rownames(UGA_wb@data))
UGA_wb_points = fortify(UGA_wb, region="id")
UGA_wb_df = join(UGA_wb_points, UGA_wb@data, by="id")

names(UGA_districts)
head(UGA_districts)

ggplot(UGA_wb_df) + 
  aes(long,lat,group=group) + 
  geom_polygon() +
  geom_path(color="white") +
  coord_equal()

head(NFI_su)

ggplot(UGA_wb_df, aes(map_id = id)) +
  geom_map(aes(long,lat,group=group,fill=Name, map_id=id), map = UGA_wb_df)

head(Data_admin)
str(Data_admin)

ggplot(UGA_wb_df)+
  geom_map(aes(long,lat,group=group,fill=Name, map_id=id), map = UGA_wb_df)+
  geom_point(data=Data_admin,aes(x=X, y=Y),size = 0.1, color = "steelblue")


ggplot(UGA_wb_df)+
  geom_map(aes(long,lat,group=group,fill=Name, map_id=id), map = UGA_wb_df[UGA_wb_df$Zname=="Albert",])+
  geom_point(data=Data_admin,aes(x=X, y=Y),size = 0.1, color = "steelblue")

ggplot(UGA_wb_df)+
  geom_map(aes(long,lat,group=group,fill=Name, map_id=id), map = UGA_wb_df[UGA_wb_df$Zname=="Albert" ,])+
  geom_point(data=Data_admin,aes(x=X, y=Y),size = 2, color = "steelblue")+
  geom_label_repel(data=Data_admin,aes(x=X, y=Y,label=Cluster))+
  scale_x_continuous(limits = c(min(Data_admin$X)-1000, max(Data_admin$X)+1000)) +
  scale_y_continuous(limits = c(min(Data_admin$Y-1000), max(Data_admin$Y+1000)))

ggplot(UGA_wb_df)+
  geom_map(aes(long,lat,group=group,fill=Name, map_id=id), map = UGA_wb_df[UGA_wb_df$Zname=="Albert" ,])+
  geom_sf(data = NFI_su)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map

# Exercise, plot the NFI point with leaflet

UGA_districts<-st_read("Data_training/UGA_districts.shp")

UGA_bond<-gadm_sf_loadCountries("UGA", level = 1, basefile='./')
str(UGA_bond)
UGA_districts_SP<-as(UGA_districts, "Spatial")
class(UGA_districts)
class(UGA_districts_SP)
str(UGA_districts_SP,max.level = 2)
class(NFI_su)
NFI_su_sp<-as(NFI_su, "Spatial")
class(NFI_su_sp)
str(NFI_su_sp, max.level = 2)

glimpse(UGA_districts_SP@data)
head(UGA_districts,3)
