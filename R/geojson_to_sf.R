#' Takes a dataframe or tibble that contains a geojson column and outputs this as a dataframe or tibble with simple features geometry.
#'
#' @param data a dataframe or tibble containing a geojson column
#' @param geojson_colname a string representing the geojson column name
#' @return A simple feature data frame or tibble.
#' @export
#' @examples
#' geojson_to_sf(
#' data=bduk_bq(
#' sql="SELECT * FROM dcms-datalake-staging.GEO_ONS.shp_LA LIMIT 1",
#' project="dcms-datalake-staging",
#' keypath="/home/dcms/keys"),
#' geojson_colname = "geom"
#' )

geojson_to_sf<-function(data, geojson_colname){
  return(
    sf::st_as_sf(
      dplyr::mutate(
        data,
        geom = geojsonsf::geojson_sfc(get(geojson_colname)))
    )
  )
}


