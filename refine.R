# Will Pauls Springboard project
# Project: Data Wrangling Exercise 1: Basic Data Manipulation

# Read in Data set refine_original
library(readr)
refine <- read_csv("refine_original.csv")
View(refine)

# load libraries being used
library(dplyr)
library(tidyr)

# 1. Clean up brand names

# replace all misspellings of brand names
refine$company[1:6] <- "phillips"
refine$company[7:13] <- "akzo"
refine$company[14:16] <- "phillips"
refine$company[17:21] <- "van houten"
refine$company[22:25] <- "unilever"

# 2. seperate product code and number

# seperated into 2 seperate columns product_code and product_number
refine <- separate(refine, col = 2, into = c("product_code" , "product_number"), sep = "-")

# 3. Add product categories

# added new column product_category
refine$product_category <- NA

# filled in product_category based off product_code
refine$product_category[refine$product_code=="p"] <- "Smartphone"
refine$product_category[refine$product_code=="v"] <- "TV"
refine$product_category[refine$product_code=="x"] <- "Laptop"
refine$product_category[refine$product_code=="q"] <- "Tablet"

# 4. Add full address for geocoding

# created new column full_address which concatenates the three address fields
refine <- unite(refine, col = "full_address", 4:6, sep = ", ")

# 5. create dummy variables for company and product category

#define company dummy variables
refine$company_phillips <- 0
refine$company_akzo <- 0
refine$company_van_houten <- 0
refine$company_unilever <- 0

#
refine$company_phillips[refine$company=="phillips"] <- 1
refine$company_akzo[refine$company=="akzo"] <- 1
refine$company_van_houten[refine$company=="van houten"] <- 1
refine$company_unilever[refine$company=="unilever"] <- 1

#define product dummy variables
refine$product_smartphone <- 0
refine$product_tv <- 0
refine$product_laptop <- 0
refine$product_tablet <- 0

refine$product_smartphone[refine$product_category=="Smartphone"] <- 1
refine$product_tv[refine$product_category=="Tv"] <- 1
refine$product_laptop[refine$product_category=="Laptop"] <- 1
refine$product_tablet[refine$product_category=="Tablet"] <- 1

# saved clean data set to csv file
write.csv(refine,'refine_clean.csv')
 


