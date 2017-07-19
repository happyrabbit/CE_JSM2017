### -----------------------------
### Hui Lin
### @gossip_rabbit
### 
### http://scientistcafe.com
### -----------------------------

## Data Wrangling
## -----------------------------
# Should have loaded it 
# library(readr)

## Read and write data: readr package

read_csv("2015,2016,2017
         1,2,3
         4,5,6")

sim.dat <- read_csv("https://raw.githubusercontent.com/happyrabbit/DataScientistR/master/Data/SegData.csv ")
head(sim.dat)

dat=read_csv("2015,2016,2017
100,200,300
canola,soybean,corn")

print(dat)

## Baby example 2

dat=read_csv("# I will never let you know that
          # my favorite food is carrot
             Date,Food,Mood
             Monday,carrot,happy
             Tuesday,carrot,happy
             Wednesday,carrot,happy
             Thursday,carrot,happy
             Friday,carrot,happy
             Saturday,carrot,extremely happy
             Sunday,carrot,extremely happy", skip = 2)
print(dat)

## Baby example 3

dat=read_csv("Saturday,carrot,extremely happy
          Sunday,carrot,extremely happy", col_names=FALSE)
print(dat)

## `read_csv2()`

# Read semicolon separated files
dat=read_csv2("Saturday; carrot; extremely happy \n Sunday; carrot; extremely happy", col_names=FALSE)
print(dat)

# Read tab delimited files
dat=read_tsv("every\tman\tis\ta\tpoet\twhen\the\tis\tin\tlove\n", col_names = FALSE)
print(dat)

# Assign separating character
dat=read_delim("THE|UNBEARABLE|RANDOMNESS|OF|LIFE\n", delim = "|", col_names = FALSE)
print(dat)

# Substitute for missing value

dat=read_csv("Q1,Q2,Q3
               5, 4,99",na="99")
print(dat)

## data.table

# library(data.table)
# covert the existing data frame to data table
dt <- data.table(sim.dat)
class(dt)

# Calculate mean for counts of online transactions:
dt[, mean(online_trans)]

# Calculate mean by group:
dt[ , mean(online_trans), by = gender]

# group by more than one variables:
dt[ , mean(online_trans), by = .(gender, house)]

# Assign column names for aggregated variables:
dt[ , .(avg = mean(online_trans)), by = .(gender, house)]

# select row
# select rows with age<20 and income > 80000
dt[age < 20 & income > 80000]
# select the first two rows
dt[1:2]

# select column
# select column “age” but return it as a vector
# the argument for row is empty so the result will return all observations
ans <- dt[, age]
head(ans)
# To return `data.table` object, put column names in `list()`
# Select age and online_exp columns and return as a data.table instead
ans <- dt[, list(age, online_exp)]
head(ans)
# you can also put column names in `.()`
ans <- dt[, .(age, online_exp)]
# head(ans)
# To select all columns from “age” to “income”
ans <- dt[, age:income, with = FALSE]
head(ans,2)
# Delete columns using `-` or `!`
# delete columns from  age to online_exp
ans <- dt[, -(age:online_exp), with = FALSE]
ans <- dt[, !(age:online_exp), with = FALSE]

# tabulation
# row count
dt[, .N]