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
               5,4,99",na="99")
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

# Count by groups:
# counts by gender
dt[, .N, by= gender]  
# for those younger than 30, count by gender
dt[age < 30, .(count=.N), by= gender] 


# Order table:
# get records with the highest 5 online expense:
head(dt[order(-online_exp)],5) 
# Since data table keep some characters of data frame, they share some operations
dt[order(-online_exp)][1:5]
# order the table by more than one variable
dt[order(gender, -online_exp)][1:5]

# `apply()`, `lapply()` and `sapply()` in base R
## simulate a matrix
x <- cbind(x1 =1:8, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]
apply(x, 2, mean)
col.sums <- apply(x, 2, sum)
row.sums <- apply(x, 1, sum)

# apply other functions:
ma <- matrix(c(1:4, 1, 6:8), nrow = 2)
ma
apply(ma, 1, table)  #--> a list of length 2
apply(ma, 1, stats::quantile) # 5 x n matrix with rownames

# Tricky example
## Example with different lengths for each call
z <- array(1:24, dim = 2:4)
zseq <- apply(z, 1:2, function(x) seq_len(max(x)))
zseq         ## a 2 x 3 matrix
typeof(zseq) ## list
dim(zseq) ## 2 3
zseq[1,]
apply(z, 3, function(x) seq_len(max(x)))

# Read data
sim.dat<-read.csv("https://raw.githubusercontent.com/happyrabbit/DataScientistR/master/Data/SegData.csv")
# Get numerical variables
sdat<-sim.dat[,!lapply(sim.dat,class)=="factor"]
## Try the following code with apply() function
## apply(sim.dat,2,class)
## What is the problem?
apply(sdat, MARGIN=2,function(x) mean(na.omit(x)))
apply(sdat, MARGIN=2,function(x) sd(na.omit(x)))
lapply(sdat, function(x) sd(na.omit(x)))
sapply(sdat, function(x) sd(na.omit(x)))
sapply(sdat, function(x) sd(na.omit(x)), simplify = FALSE)

# dplyr - display

tbl_df(sim.dat)
glimpse(sim.dat)

# dplyr - subset
filter(sim.dat, income >300000) %>%
  tbl_df()

# Pipe operator

# piping with .
"Hello World" %>% substring(7, 11) %>% grepl("Wo", .)

# without pipe
ave_exp <- filter( 
  summarise(
    group_by( 
      filter(
        sim.dat, 
        !is.na(income)
      ), 
      segment
    ), 
    ave_online_exp = mean(online_exp), 
    n = n()
  ), 
  n > 200
) 

# with pipe
avg_exp <- sim.dat %>% 
  filter(!is.na(income)) %>% 
  group_by(segment) %>% 
  summarise( 
    ave_online_exp = mean(online_exp), 
    n = n() ) %>% 
  filter(n > 200)

# Subset - select rows
dplyr::distinct(sim.dat)

# random sample rows
dplyr::sample_frac(sim.dat, 0.5, replace = TRUE) 
dplyr::sample_n(sim.dat, 10, replace = TRUE) 

# select rows by position
# It is equivalent to `sim.dat[10:15,]`
dplyr::slice(sim.dat, 10:15) 

# select the order top n entries
dplyr::top_n(sim.dat,2,income)

# Subset - select columns

# select by column name
dplyr::select(sim.dat,income,age,store_exp)

# select columns whose name contains a character string
dplyr::select(sim.dat, contains("_"))

# select columns whose name ends with a character string
# similar there is "starts_with"
dplyr::select(sim.dat, ends_with("e"))

# select columns Q1,Q2,Q3,Q4 and Q5
select(sim.dat, num_range("Q", 1:5)) 

# select columns whose names are in a group of names
dplyr::select(sim.dat, one_of(c("age", "income")))

# select columns between age and online_exp
dplyr::select(sim.dat, age:online_exp)

# select all columns except for age
dplyr::select(sim.dat, -age)

# Summarize

dplyr::summarise(sim.dat, avg_online = mean(online_trans)) 
# apply function anyNA() to each column
# you can also assign a function vector such as: c("anyNA","is.factor")
dplyr::summarise_each(sim.dat, funs_(c("anyNA")))

sim.dat %>% group_by(segment) %>% summarise_each(funs_(c("anyNA")))

# Create new variable

# `mutate()`: compute and append one or more new columns:
dplyr::mutate(sim.dat, total_exp = store_exp + online_exp)

# min_rank=rank(ties.method = "min")
# mutate_each() means apply function to each column
dplyr::mutate_each(sim.dat, funs(min_rank)) 

# `transmute()`: delete the original columns and only keep the new ones
dplyr::transmute(sim.dat, total_exp = store_exp + online_exp) 

## Merge

(x<-data.frame(cbind(ID=c("A","B","C"),x1=c(1,2,3))))
(y<-data.frame(cbind(ID=c("B","C","D"),y1=c(T,T,F))))

# join to the left
# keep all rows in x
left_join(x,y,by="ID")
# get rows matched in both data sets
inner_join(x,y,by="ID")
# get rows in either data set
full_join(x,y,by="ID")
# filter out rows in x that can be matched in y 
# it doesn't bring in any values from y 
semi_join(x,y,by="ID")
# the opposite of  semi_join()
# it gets rows in x that cannot be matched in y
# it doesn't bring in any values from y
anti_join(x,y,by="ID")

## Tidy and Reshape Data 
# Take a baby subset of our exemplary clothes consumers data to illustrate:
(sdat<-sim.dat[1:5,1:6])

# `reshape2` example
(mdat <- melt(sdat, measure.vars=c("store_exp","online_exp"),
              variable.name = "Channel",
              value.name = "Expense"))

# compare the online and in store expense between male and female based on the house ownership
dcast(mdat, house + gender ~ Channel, sum)

## `tidyr` package

# practice functions we learnt before
sdat<-sim.dat[1:5,]%>%
  dplyr::select(age,gender,store_exp,store_trans)
sdat %>% tbl_df()

# `gather()`: Analogous to `melt()` in `reshape2`
msdat<-tidyr::gather(sdat,"variable","value",store_exp,store_trans)
msdat %>% tbl_df()

# pipe version
sdat%>%gather("variable","value",store_exp,store_trans)

# melt version
melt(sdat, measure.vars=c("store_exp","store_trans"),
     variable.name = "variable",
     value.name = "value")

# spread
msdat %>% spread(variable,value)

##  `separate()` and `unite()`

# You can use `sep=` 
# By default, it is "`_`"
sepdat<- msdat %>% 
  separate(variable,c("Source","Type"))
sepdat %>% tbl_df()

sepdat %>% 
  unite("variable",Source,Type,sep="_")

sepdat %>% 
  unite("variable",Source,Type,sep="_")

