# CE_JSM2017: Preparing Statistician/Statistics Graduates to Be Data Scientist


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
| Slot 1 | 8.30 a.m. - 10.15 a.m. | [Introduction](http://scientistcafe.com/CE_JSM2017/slides/Introduction.html), [The art of data science](http://scientistcafe.com/CE_JSM2017/slides/TheArtOfDataScience.html), [Big Data Cloud Platform](https://github.com/happyrabbit/CE_JSM2017/blob/master/Slides/MLI-Big-Data-Cloud-Platform.pptx) |
| Slot 2 | 10.30 a.m. - 12.30 a.m. | [Big Data Cloud Platform](https://github.com/happyrabbit/CE_JSM2017/blob/master/Slides/MLI-Big-Data-Cloud-Platform.pptx), [Data Wrangling](http://scientistcafe.com/CE_JSM2017/slides/DataWrangling.html) |
| Slot 3 | 2.00 p.m. - 3.15 p.m. | [Data Pre-processing](http://scientistcafe.com/CE_JSM2017/slides/DataPreprocessing.html), [Markdown](http://scientistcafe.com/CE_JSM2017/slides/ReproducibleReport.html), [HTML5](http://scientistcafe.com/CE_JSM2017/slides/ReproducibleReport.html#(21))|
| Slot 4 | 3.30 p.m. - 5.00 p.m. | [Shiny Dashboard](http://scientistcafe.com/CE_JSM2017/slides/ReproducibleReport.html), [Soft Skills for Data Scientists](https://github.com/happyrabbit/CE_JSM2017/blob/master/Slides/MLI-Soft-Skill.pptx), Question and Evaluation|

**R Code**

- [00-course-setup.R](https://raw.githubusercontent.com/happyrabbit/CE_JSM2017/master/Rcode/00-course-setup.R)
- [01-intro.R](https://raw.githubusercontent.com/happyrabbit/CE_JSM2017/master/Rcode/01-intro.R)
- [02-DataWrangling.R](https://raw.githubusercontent.com/happyrabbit/CE_JSM2017/master/Rcode/02-DataWrangling.R)
- [03-preprocessing.R](https://raw.githubusercontent.com/happyrabbit/CE_JSM2017/master/Rcode/03-preprocessing.R)

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
### Apply Free Databricks Community Edition Account
There are many cloud computing environments such as Amazon’s AWS which provides a complete list of functions for heavy-duty enterprise applications. For beginners, Databricks provides an easy to use cloud system for learning purpose. Databricks is a company founded by the creators of Apache Spark and it provides a user-friendly web-based notebook environment that can create Hadoop/Spark/GPU cluster on the fly to run R/Python/Scala/SQL. We will use Databricks’ community edition to run demos for this training.
- Please go to <https://databricks.com/try-databricks> to create a free Community Edition acount
- You can watch this video for illustration: <https://youtu.be/vx-3-htFvrg>
- Get familar with the cloud enviroment using R notebook, watch this video for details: <https://youtu.be/0HFujX3t6TU>
- Create two tables by uploading csv files (sent by training contact), watch this video for detail: <https://youtu.be/H5LxjaJgpSk>

### Addtional Setup 
In case we cannot connect to Databricks during the training. We can also simulate Spark System and use Sparklyr in personal computer such as your own laptop and desktop. To use the simulated Spark system, we will need the following steps
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

# create a sparklyr connection, it will take a little while to run. 
# If there is no error message, the installation is sucessful.

sc <- spark_connect(master = "local")

```


## Live updates

