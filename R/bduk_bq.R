#' Runs a query in BigQuery and loads the data into R.
#'
#' This function loads a BigQuery into a data table.
#' This requires both a billing string and a json key to be installed.
#' The json key must be in the same directory/project as you are working within.
#'
#' @param sql SQL code to be queried
#' @param key The name of the BigQuery key used for billing
#' @param project The name of the bigquery project that the data is stored within. Unless otherwise specified, the key will be the name of this concatenated with "_bigquery.json".
#' @param keypath The path to the folder that contains the key. By default, this will be the current directory, and it is recommended the key is stored here.
#' @return A data table containing the query results.
#' @export
#' @examples
#' bduk_bq(
#'  sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 ",
#'  project="dcms-datalake-staging"
#')
#'bduk_bq(
#'  sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 ",
#'  project="dcms-datalake-staging",
#'  key="dcms-datalake-staging_bigquery.json",
#'  keypath="/home/dcms/keys"
#')

bduk_bq <-function(sql, project, key=NULL, keypath=NULL){
  options(scipen=999)
  if(is.null(key)){
    key<-paste0(project,"_bigquery.json")
  }
  if(!is.null(keypath)){
    path<-paste0(keypath,"/",key)
  } else {
    path<-key
  }
  if(file.exists(path)){
    bigrquery::bq_auth(path=path)
    Query<-bigrquery::bq_project_query(project,sql)
    Results<-bigrquery::bq_table_download(Query,bigint="integer64")
    return(Results)
  } else {
    message("There is no json key saved in this directory. Please copy the file 'dcms-datalake-staging_bigquery.json' into the project or directory you are working within. The file can likely be found in ~/home/keys. If you have not made this folder, please contact the BDUK data and modelling team for additional support.")
  }
}
