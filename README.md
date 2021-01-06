
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rbduk

<!-- badges: start -->

<!-- badges: end -->

The goal of Rbduk is to provide BDUK analysts with a centralised set of
repeatable functions for BDUK-specific R work.

For full doccumentations of all functions in the package please read the
[vignette](https://source.cloud.google.com/dcms-datalake-staging/Rbduk/+/master:vignettes/Vignette.md)
or run `vignettes("Vignette",package="Rbduk")` to view it within R.

## Installation

Ordinarily, a package would be installed either from a communal file
store, or from a git repository. As our VM’s do not connect to the T://
drive that we share, and packages cannot be installed from a Google
Source Repository, we have to do this manually:

1)  Within your VM, go to the ‘Files’ pane (next to ‘Plots’,‘Packages’,
    etc) and navigate to to the home directory by clicking the house
    symbol.\!
2)  Within the same pane, click the upload button.
3)  Select “Choose File”, navigate to the T:// drive, and select the
    file **Rbduk.tar.gz**. If you do not have access to the T:// drive,
    visit it is also stored on the [Data and Modelling team’s google
    drive](https://drive.google.com/drive/folders/1N760JFNMWoFAmhH3ivhkyrrYx882t2E5).
    Download the file to your computer from here, and upload in the same
    fashion.
4)  Within the console pane, enter
    `install.packages("dplyr","stringr","grid","ggplot2","bigrquery","geojsonsf","sf","shinyBS")`
    to install the packages dependencies.
5)  Open the terminal tab (next to the console tab) within Rstudio.
6)  Type `cd /home/dcms` and press enter.
7)  Type `R CMD INSTALL Rbduk.tar.gz` and press enter.

The package should now be installed, and to load it use `library(Rbduk)`
as you would any other package.

For any additional support, to contribute, or to suggest things you
would like to see, please contact
[sam.atkin@dcms.gov.uk](sam.atkin@dcms.gov.uk).

**Do not push any code into the repository unless it has been quality
assured first.**
