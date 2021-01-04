#' Function to clear all groups from a leaflet object from within a shiny application.
#'
#' @param map a string containing the name of the map
#' @param ... a comma seperated set of strings that contain the group names to clear


clearGroups<-function(map,...){
  Groups<-c(...)
  for(Group in Groups){
    leaflet::leafletProxy(map)%>%leaflet::clearGroup(Group)
  }
}


