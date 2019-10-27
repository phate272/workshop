4+3
(3
 +3)

#Data Type

#Number Type
3
2.4

class(3)

3L

class(3L)
as.integer(3)
class(as.integer(3))

#start typing a command then press <tab> ... it will show you the available command options to complete the command

class(3+1i)

#word type
'dog'
'plant'
class('dog')
TRUE
FALSE
true
'true'

300 > 200
3 == 3L
class(3) == class(3L)


#two equal signs is an EVALUATION ... one equals sign is an ASSIGNMENT

10 - 5 == sqrt(25)

#TRUE is equal to 1
#FALSE is equal to 0

TRUE > FALSE #this statement is TRUE

'a' > 'b'
'b' > 'a'

#varible
my_var = 'tucson'
dog <- 3

#both the equal (=) and the less than plus dash (<-) ASSIGN a variable...defaulting to the (<-) is best because sometimes the equal sign doesn't work

.day <- 1

#if you start a variable name with a period (.) it remains hidden from your Global Environment

#complex variable names
probl.lm #dot separated
probl_lm #underscore separated
problLm #Camel Case
#above are different ways to name variables...personal preference


#Data Structure
  #vector types: number, logical, character
1:10
num_vect <- 1:10
logic_vect <- c(TRUE, FALSE, TRUE)
# the letter "c" combines things
logic_vect

chac_vect <- c('Matt', 'Asher', 'Sarah')
chac_vect

class(num_vect)
class(logic_vect)
class(chac_vect)

mixed <- c(TRUE, 'A')
mixed
class(mixed)
#can only have one type of vector in a variable

#list
#"vector" that can hold multiple data types
my_list <- list(1, 'A', TRUE)
my_list

#Matrix
#'vector' with multiple dimensions
?matrix

m <- matrix(nrow=2, ncol=3)
m
m <- matrix(1:6, nrow=2, ncol=3)
m
m <- matrix(1:6, nrow=2, ncol=3, byrow = TRUE)
m
  #the 'n' in front of row and col stands for 'number'...the number of rows equals 2...number of columns equals 3

#DataFrame
df <- data.frame(id = letters[1:10], x=1:10, y=11:20)
  #this command builds a table with three columns named 'id', 'x', and 'y' and the 'id' column has the first ten letters in it, 'x' column has numbers 1-10, and 'y' column has numbers 11-20
df

class(df)
class(m)
ncol(df)
nrow(df)
dim(df)
str(df)
summary(df)

fact <- c(rep(1,4), rep(2,3),rep(3,5))
factor(fact)

cats <- data.frame(coat = c('calico', 'black', 'tabby'),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1,0,1))
  #automatically creates columns named 'coat', 'weight', and 'likes_string'
cats

getwd()

write.csv(x=cats, file = 'cats_data.csv', row.names = FALSE)

cats2 <- read.csv(file='cats_data.csv')
cats2
?read.csv()

cats$coat
cats$weight
cats$weight + 2


age <- c(3,4,5)
cbind(cats, age) #column bind ... adds a column named 'age' to file 'cats'
rbind() #row bind

#load gapminder data
gapminder <- read.csv(file = '../r_lesson/gapminder.csv')

str(gapminder) #structure
head(gapminder)
tail(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder) #dimensions
summary(gapminder)
colnames(gapminder)

getwd() # shows current working directory

min(gapminder$year)
mean(gapminder$lifeExp)
max(gapminder$pop)


#Subsetting the data
gapminder[1,1] #[row(s),column(s)]
gapminder[1:5, 6]
gapminder[20:22, 3:6]
gapminder[-3:-1704,] #put minus sign in front of something to drop those values out of the output

head(gapminder)
head(gapminder[, 'lifeExp'])
head(gapminder[, c('lifeExp','pop')])

gapminder[gapminder$year == 1997,]
gapminder[gapminder$country == 'Gabon', c(2,5)]
gapminder[gapminder$country == 'Gabon' & gapminder$year == 1997, ]
