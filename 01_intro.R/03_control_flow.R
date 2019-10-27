for(my_var in 1:10){
  print(my_var)
}
  
1:10


for(i in 1:3){
  for(j in letters[1:3]){
    print(paste(i, j))
  }
}
#this is the output for the above For Loop:
#[1] "1 a"
#[1] "1 b"
#[1] "1 c"
#[1] "2 a"
#[1] "2 b"
#[1] "2 c"
#[1] "3 a"
#[1] "3 b"
#[1] "3 c"


c <- c()
c
for(i in 1:5){
  c <- c(c, i^2)
  print(c)
}
#output for this For Loop:
#[1] 1
#[1] 1 4
#[1] 1 4 9
#[1]  1  4  9 16
#[1]  1  4  9 16 25


unique(gapminder$continent)

#making a For Loop that fills in the blanks of the following statement:
# "<X continent> has a life expectancy between ___ and ___"

for (cont in unique(gapminder$continent)){
  min_life <- min(gapminder[gapminder$continent == cont, 'lifeExp'])
  max_life <- min(gapminder[gapminder$continent == cont, 'lifeExp'])
  print(paste(cont, " has a life expectancy between ", min_life, "and", max_life))
}
#output for this For Loop:
#[1] "Asia  has a life expectancy between  28.801 and 28.801"
#[1] "Europe  has a life expectancy between  43.585 and 43.585"
#[1] "Africa  has a life expectancy between  23.599 and 23.599"
#[1] "Americas  has a life expectancy between  37.579 and 37.579"
#[1] "Oceania  has a life expectancy between  69.12 and 69.12"

?unique()


x <- 0
x <- 5
x <- -3

if(x > 0){
  print("positive integer")
} else if (x < 0){
  print("negative integer")
} 

#nesting
if(x > 0){
  print("positive integer")
  if (x == 3){
    print('three')
  }
} else if (x<0){
  print('negative integer')
}



for (i in c(-1, 3, 0, -7)){
  if (i>0){
    print("positive integer")
  } else if (i<0){
    print('negative integer')
  } else {
    print('zero')
  }
}



#gapminder with loops and conditional statements

mean_lifeExp_gapminder <- mean(gapminder$lifeExp)

#find which continents have a mean lifeExp above the mean of the whole dataset's mean lifeExp

summary(gapminder)
    #mean_lifeExp_wholedata = 59.47

for (cont in unique(gapminder$continent)){
  if (mean(gapminder[gapminder$continent == cont, 'lifeExp']) > mean_lifeExp_gapminder){
    print(paste(cont, 'has a mean life expectancy greater than the overall mean life expectancy.'))
  }
}