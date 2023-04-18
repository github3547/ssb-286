#***********************************************************************
#   Data Capture and Preparations - Lab week 11
#
#   Web Scraping
#
#   Dr Raul Fernandez Rojas
#***********************************************************************

#clean Console  as command (CTRL + L)
cat("\014") 

#clean all global variables
rm(list = ls())

#install.packages("rvest")

# load library
library(tidyverse)
library(rvest)



#************ Exercise 3 **************
# define strings
string = c("this is", "a string", "vector", "this")

# match "this" 
grep(pattern = "this", string)

# match "this"
grepl(pattern = "this", string)

# replaces all s for a "k" 
gsub(pattern = "s", replacement = "k", string)
     
# split the words in a sentence
strsplit(string, " ")

# define another string
dates <- c("1999-05-23", "2001-12-30", "2004-12-17")

# split string
strsplit(dates, "-")

# replaces all "-" for a " " 
gsub(pattern = "-", replacement = " ", dates)


#clean Console  as command (CTRL + L)
cat("\014") 

#clean all global variables
rm(list = ls())


#************ Exercise 4 **************

# 2. Store url address
url <- "http://www.ieeessci2020.org/index.html"

# 3. fetch content
content_page <- read_html(url)

# 4. Get <h1> elements
h1 <- content_page %>% 
  html_nodes("h1")

# check content
h1

# 5. Extract the content only
content_page %>%
  html_nodes ("h1") %>% 
  html_text () 

# 6. Get second level headings (h2)
h2 <- content_page %>% 
  html_nodes("h2") 

# check content
h2
# how many?
length(h2)

# 7. Extract the content only of the Coronavirus update h2 element
h2 <- h2 %>%
  html_text () 

# get the requiered h2
m <- grep(pattern="coronavirus", h2, ignore.case = TRUE)

# print the requiered paragraph
print(h2[m])

# 8. Get the paragraphs
p <- content_page %>%
  html_nodes ("p")

# 9. Extract and print the third paragraph of the 
# conference
p <- p %>%
  html_text () 

#Get the desired paragraph
n <- grep(pattern="feature keynote", p)
# print paragraph
p[n]

# 10. clean the data
p[n] <- gsub("\\n","", p[n])  
p[n] <- gsub("       ","", p[n])
p[n]


# 11. Get the tables
tbls <- content_page %>%
  html_nodes ("table")

# 12. Extract and print the table
tbls <- content_page %>%
  html_nodes ("table") %>%
  html_text ( ) 

tbls

# 13. clean data and print correctly
# remove \n next to parenthesis
tbls <- gsub("\\(\\n","(",tbls) 
tbls <- gsub("\\*\\n","\\*",tbls) 


#remove empty spaces
tbls <- gsub("\\h+", " ", tbls, perl=TRUE)  #\h is shorthand to match any horizontal whitespaces
tbls <- str_trim(tbls)
tbls

# split the single string into multiple strings using the new lines (\n)
my_table <- strsplit(tbls,"\\n")
my_table[1]


# convert string to a table
my_table <- matrix(unlist(my_table), ncol=2, byrow = TRUE)
View(my_table)







