library(dplyr)
library(phyloseq)

src <- "http://files.figshare.com/1843184/homes_mapping_file.txt"
lcl <- "data-raw/sampledata.txt"

src2 <- "http://files.figshare.com/1843212/otu_tables_wTax.zip"
lcl2 <- "data-raw/16S_otu_table_wTax.biom"

src3 <- "http://files.figshare.com/2019924/fungi_patho.zip"
lcl3 <- "data-raw/fungi_patho/fungi_patho.txt"


if (!file.exists(lcl)) { download.file(src, lcl)}
if (!file.exists(lcl2)) { 
    download.file(src2, "data-raw/temp.zip")
    unzip("data-raw/temp.zip", exdir="data-raw")
    rm('data-raw/temp.zip')
}

if (!file.exists(lcl3)) { 
    dir.create("data-raw/fungi_patho/")
    download.file(src3, "data-raw/fungi_patho/temp.zip")
    unzip("data-raw/fungi_patho/temp.zip", exdir="data-raw/fungi_patho")
    rm('data-raw/fungi_patho/temp.zip')
}

#process the sample data 
###################################################################################################
###################################################################################################
###################################################################################################
sampledata <- read.delim("/home/zcharlop/Documents/git/Software/dustmicrobiome/data-raw/sampledata.txt")

#get indoor andoutdoor samples and make a unique code ID with an I or O suffix
sampleindoor <- sampledata %>%
    mutate(SampleCode = paste0(ID,".I"), indoors=TRUE)
sampleoutdoors <- sampledata %>%
    mutate(SampleCode = paste0(ID,".O"), indoors=FALSE)

#combine the indoor and outdoor datasets and elimante the few samples that are duplicates
sampledata2 <- rbind(sampleindoor,sampleoutdoors) %>%
    group_by(SampleCode) %>%
    slice(1:1)

# load phyloseq objects and add smaple data to them
###################################################################################################
###################################################################################################
###################################################################################################

phy16S = import_biom("data-raw/16S_otu_table_wTax.biom")
sample_data(phy16S) <- as.data.frame(sampledata2)
save(phy16S, file="data/phy16S.rda", compress = "xz")

fungi = import_biom("data-raw/ITS_otu_table_wTax.biom")
#from R CMD Check
#* checking data for non-ASCII characters ... WARNING
#Warning: found non-ASCII strings
#'g__Epichlo<fd>' in object 'fungi'
#'s__Epichlo<fd> glyceriae' in object 'fungi'
# locations are levels(tax$Rank7)[2050] and levels(tax$Rank6)[493]
tax <- data.frame(tax_table(fungi))
levels(tax$Rank6)[493] <- "g__Epichlo"
levels(tax$Rank7)[2050] <- "s__Epichlo glyceriae"
tax_table(fungi) <- tax_table(as.matrix(tax))

sample_data(fungi) <- as.data.frame(sampledata2)
save(fungi, file="data/fungi.rda", compress = "xz")


# load the fungal map
###################################################################################################
###################################################################################################
###################################################################################################
fungal_patho = read.delim("data-raw/fungi_patho/fungi_patho.txt")

# load the fungal map
###################################################################################################
###################################################################################################
###################################################################################################


