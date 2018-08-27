setwd("C:/Users/wrpauls21/Desktop/Springboard")
library(readr)
refine_original <- read_csv("C:/Users/wrpauls21/Desktop/Springboard/refine_original.csv")
library(dplyr)
refine_original$company[1:6] <- "phillips"
refine_original$company[7:13] <- "akzo"
refine_original$company[14:16] <- "phillips"
refine_original$company[17:21] <- "van houten"
refine_original$company[22:25] <- "unilever"
library(tidyr)
refine_original <- separate(refine_original, col = 2, into = c("product_code" , "product_number"), sep = "-")
refine_original$product_category <- NA
refine_original <- unite(refine_original, col = "full_address", 4:6, sep = ", ")
filter(refine_original, product_code == "p") 
filter(refine_original, product_code == "v") 
filter(refine_original, product_code == "x") 
filter(refine_original, product_code == "q") 

if(refine_original$product_code == "p") {
  refine_original$product_category <- "Smartphone"
} else if(refine_original$product_code == "v"){
  refine_original$product_category <- "TV"
}else if(refine_original$product_code == "x"){
  refine_original$product_category <- "Laptop"
}else if(refine_original$product_code == "q"){
  refine_original$product_category <- "Tablet"
}