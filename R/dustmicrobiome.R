#' Dust Microbiome Data.
#'
#' This package is the OTU data from the paper "Continental-scale distributions 
#' of dust-associated bacteria and fungi" from Noah Fierer's group. The data has
#' been made available on \url{http://figshare.com/articles/1000homes/1270900}{figshare}.
#' This package proveds that data as a set of ready-to-analyze.
#' 
#' @source http://figshare.com/articles/1000homes/1270900
#' 
#' @name dustmicrobiome
#' @author Zach Charlop-Powers \email{zcharlop@@rockefeller.edu}
#' @references \href{http://intl.pnas.org/content/112/18/5756.abstract}{Continental-scale 
#'                   distributions of dust-associated bacteria and fungi}
#' @docType package
#' @keywords package
NULL

#' Dust Microbiome OTU and Sample Data for ITS (fungal) amplicons.
#'
#' Phyloseq object containing OTU frequencies of ITS amplicon data..
#'
#' @source http://figshare.com/articles/1000homes/1270900
#' @format a phyloseq object with three slots
#' \describe{
#' \item{\code{sample_data}}{A dataframe with Sample information}
#' \item{\code{otu_table}}{A matrix with  OTU information. Rows are OTUs, 
#'                         columns are samples, the value is the observer 
#'                         OTU-per-column count}
#' \item{\code{tax_table}}{A matrix containing taxonomy information. 
#'                         Rows are OTUs, columns are units of taxonomy.}
#' }
#'
#' @seealso
#' \code{\link[phyloseq]{phyloseq}}
#' \code{\link[phyloseq]{sample_data}}
#' \code{\link[phyloseq]{otu_table}}
#' \code{\link[phyloseq]{tax_table}}
#'    
"fungi"

#' Dust Microbiome OTU and Sample Data for 16S (bacterial) amplicons.
#'
#' Phyloseq object containing OTU frequencies of 16S amplicon data..
#'
#' @source http://figshare.com/articles/1000homes/1270900
#' @format a phyloseq object with three slots
#' \describe{
#' \item{\code{sample_data}}{A dataframe with Sample information}
#' \item{\code{otu_table}}{A matrix with  OTU information. Rows are OTUs, 
#'                         columns are samples, the value is the observer 
#'                         OTU-per-column count}
#' \item{\code{tax_table}}{A matrix containing taxonomy information. 
#'                         Rows are OTUs, columns are units of taxonomy.}
#' }
#' 
#' @seealso
#' \code{\link[phyloseq]{phyloseq}}
#' \code{\link[phyloseq]{sample_data}}
#' \code{\link[phyloseq]{otu_table}}
#' \code{\link[phyloseq]{tax_table}}
"phy16S"