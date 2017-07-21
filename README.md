# CE_JSM2017: The Science and Art of Data


## General information

**Learning Outcome**

- Understand data science is the process of defining the problem with business knowledge, gathering needed data from various sources, developing models, extracting insight and recommend actions.
- Get familiar with the cloud-based big data platform (Hadoop/ Hive/ Spark/ GPU etc.) that are widely used in the development and production setting for industry and know how to quickly transit from academia environment to enterprise environment.
- Get familiar with data extraction, transformation and load from various database systems such that participates can learn how to become self- sufficient to get needed data in enterprise environment.
- Understand how to leverage interactive dashboard to present insight and results and communicate efficient with business partners and customers.
- Understand what data scientists “in the wild” are doing to better prepared to be successfully data scientist in the future.
- Learn how to encode a real problem to a data science problem, search for the right data, preprocess data and deploy of analytical results through a case study.
- Get familiar with how to achieve high-performance computing for standard statistical procedures with big data infrastructure.

**Event**

Joint Statistical Meetings 2017, Continuing Education Course, Baltimore, Maryland

**Venue**

H-Holiday Ballroom 1

**Instructor** 

Hui Lin ([website](http://scientistcafe.com), [Github](https://github.com/happyrabbit), [Twitter](https://twitter.com/gossip_rabbit))

Ming Li 

**Requirements**

The prerequisite knowledge is MS level education in statistics and entry level of R-Studio.
Please bring a laptop with the latest version of R and Rstudio installed (see more below for the technical setup). 

**Time schedule**

|  | Time | Topic |
|--------|-------------------------|---------------------------------------------------------|
| Slot 1 | 8.30 a.m. - 10.15 a.m. | Introduction, The art of data science, Big Data Cloud Platform |
| Slot 2 | 10.30 a.m. - 12.30 a.m. | Big Data Cloud Platform, Data Wrangling |
| Slot 3 | 2.00 p.m. - 3.15 p.m. | Data Pre-processing, Markdown, HTML5 Slides|
| Slot 4 | 3.30 p.m. - 5.00 p.m. | Shiny Dashboard, Soft Skills for Data Scientists|


## Accompanying Book

- Online Book (still writing):  [The Science and Art of Data](http://scientistcafe.com/CE_JSM2017/) 

- 中文书: [机器学习：北美数据科学家的私房课](http://scientistcafe.com/book/) 
    - 电子工业出版社
    - 2017年8月出版

## Set up

### Obtaining R and RStudio

To run the code in this workshop, you will need to install both
R and the RStudio IDE. Both are open source, free, and easy to install.
They are already available on our lab computers, but you can install
manually on your own machine from the following sources:

- Download and install R, <https://www.r-project.org/>.
- Download and install RStudio, <http://www.rstudio.com/download>.

### Required packages

We are going to need a couple of packages from CRAN: You can install them all by executing the following code chunk in RStudio:


```r
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

```

### Addtional setup to run the optional local Spark demo in case we cannot connect to Databrics during the training
We can also simulate Spark System and use Sparklyr in personal computer such as your own laptop and desktop. To use the simulated Spark system, we will need the following steps
- Download and install Java, <https://www.java.com/en/download/help/windows_offline_download.xml> and version 7.0 and above of Java is needed to run this simulated Spark system. You can watch this youtube video: <https://youtu.be/RbDMvrSRXHM>
- Restart your computer once the Java installation finishes

- Open RStudio and run the following code:

```r
# Installing sparklyr takes a few minutes, 
# because it installs +10 dependencies.

if (!require("sparklyr")) {
  install.packages("sparklyr")  
}

# Load sparklyr package.
library(sparklyr)

## download and create a local Spark environment, it will take a little while to finish
spark_install(version = "1.6.2")

# create a sparklyr connection 
sc <- spark_connect(master = "local")

```


## Live updates

