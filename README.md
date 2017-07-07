# CE_JSM2017: The science and art of data


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
| Slot 1 | 8.30 a.m. - 10.15 a.m. | Introduction, setup, and overview |
| Slot 2 | 10.30 a.m. - 12.30 a.m. |  |
| Slot 3 | 2.00 p.m. - 3.15 p.m. | |
| Slot 4 | 3.30 p.m. - 5.00 p.m. | |


## Accompanying Electronic Book

http://scientistcafe.com/CE_JSM2017/

Chinese book: [need to ask publisher]

## Technical setup for the course

Please make sure that the current version of R is installed. If not, update from here: [https://cran.r-project.org/](https://cran.r-project.org/)

We will use RStudio in the course. You might want to use it, too: [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/)

We are going to need a couple of packages from CRAN: You can install them all by executing the following code chunk:

```r
p_needed <- c("plyr", "dplyr", "caret","e1071","gridExtra","lattice","imputeMissings",
              "RANN","corrplot","nnet","car","gpairs","reshape2","psych","tidyr",
              "ggplot2")
packages <- rownames(installed.packages())
p_to_install <- p_needed[!(p_needed %in% packages)]
if (length(p_to_install) > 0) {
  install.packages(p_to_install)
}

lapply(p_needed, require, character.only = TRUE)
```


## Live updates

