### -----------------------------
### workshop setup
### Hui Lin
### @gossip_rabbit
### 
### http://scientistcafe.com
### -----------------------------


# install packages from CRAN
p_needed <- c("plyr", "dplyr", "caret","e1071","gridExtra","lattice","imputeMissings",
              "RANN","corrplot","nnet","car","gpairs","reshape2","psych","tidyr",
              "ggplot2","sparklyr","readr","mvtnorm","MASS","data.table","magrittr",
              "shiny","metricsgraphics","DT","leaflet","dygraphs","xts","lubridate",
              "highcharter","rbokeh","networkD3","threejs","knitr","formatR")
packages <- rownames(installed.packages())
p_to_install <- p_needed[!(p_needed %in% packages)]
if (length(p_to_install) > 0) {
  install.packages(p_to_install)
}

lapply(p_needed, require, character.only = TRUE)
