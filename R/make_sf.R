#'#' Function providing a shorthand for converting a data frame with an X and Y column to a simple feature with a specified coordinate reference system. This will default to latitude and longitude if the X and Y columns are not specified, selecting the columns with "lon" and "lat" in any case for the x_colname and y_colname respectively, and setting the CRS to 4326. If multiple columns contain these strings, the column names but be specified.
#'
#' @param data a dataframe or tibble containing a geojson column
#' @param x_colname a string containing the column name of the x coordinate column
#' @param y_colname a string containing the column name of the y coordinate column
#' @param crs a string or numeric vector representing the coordinate reference system code
#' @return A simple feature data frame or tibble.
#' @export
#' @examples
#' make_sf(data=data.frame("Longitude"=c(1,2,3),"Latitude"=c(51,52,53)),x_colname="Longitude",y_colname="Latitude",crs=4326)
#' make_sf(data=data.frame("Longitude"=c(1,2,3),"Latitude"=c(51,52,53)))

make_sf<-function(data, x_colname=NULL, y_colname=NULL, crs=4326){
  if(any(grepl( "lat" , tolower(names( data )) )) & is.null(y_colname)){
    if(length(names(data[ grepl( "lat" , tolower(names( data )) ) ]))==1){
      y_colname<- names(data[ grepl( "lat" , tolower(names( data )) ) ])[[1]]
    } else {message("Error: Multiple columns contain 'lat', please specify the y_colname.")}
  }
  if(any(grepl( "lon" , tolower(names( data )) )) & is.null(x_colname)){
    if(length(names(data[ grepl( "lon" , tolower(names( data )) ) ]))==1){
      x_colname<- names(data[ grepl( "lon" , tolower(names( data )) ) ])[[1]]
    } else {message("Error: Multiple columns contain 'lon', please specify the x_colname.")}
  }
  if(is.null(y_colname) | is.null(x_colname)){
    return(data)
  } else if( all( !grepl(x_colname, names(data) ) ) ) {
    message("Error: '",x_colname,"' is not present in the data.")
    return(data)
  } else if( all( !grepl(y_colname, names(data) ) ) ) {
    message("Error: '",y_colname,"' is not present in the data.")
    return(data)
  } else {
    return(sf::st_as_sf(data,coords=c(x_colname,y_colname),crs=crs))
  }
}

