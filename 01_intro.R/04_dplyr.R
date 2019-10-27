install.packages(dplyr)
library(dplyr)


glimpse(gapminder)


# select
   # by column

select(gapminder, year)
select(gapminder, year, lifeExp, country)
select(gapminder, -year) #shows all columns except 'year'


# filter
   # by row

filter(gapminder, continent == 'Asia')
filter(gapminder, continent != 'Oceania') #the exclamation point with the equals sign says "everything except for Oceania"
filter(gapminder, year > 2000)

two_countries <- c("Albania", "Dominican Republic")
filter(gapminder, country %in% two_countries)


# piping
   # instead of the | character, R's version of the pipe is %>% 
   # the shortcut keys for this are <ctrl + shift + m>

min(gapminder[,'lifeExp'])
gapminder %>% select(lifeExp) %>% min()


x1 <- 1:5
x2 <- 2:6
(x1-x2)^2 %>% sum() %>% sqrt()

gapminder %>% 
  select(-pop, -gdpPercap) %>% 
  filter(continent == "Asia", year == 2007) %>% 
  head()

gapminder %>% 
  select(-pop, -gdpPercap) %>% 
  filter(continent == "Asia" | continent == "Oceania") # the | character here stands for "or"
  


# mutate
   # create a new column and "mutate" some variable via mathematical formula

mean_lifeExp_gapminder
gapminder %>%  mutate(NewColumn = lifeExp - mean_lifeExp_gapminder) %>%  head()

gapminder <- gapminder %>%  mutate(NewColumn = lifeExp - mean_lifeExp_gapminder) #adds a column called "NewColumn"
    # CAREFUL!!!!!! with this command...it is rewriting the 'gapminder' file
glimpse(gapminder)
   # now say we want to remove that column
select (gapminder, -NewColumn) # this just views the data sans "NewColumn"
gapminder <- gapminder %>% select(-NewColumn) # this removes the column
glimpse(gapminder)

   # filter for Africa, select only lifeExp, country and year
gapminder %>% 
  filter(continent == "Africa") %>% 
  select(country, lifeExp, year) %>% 
  glimpse()


#group_by

gapminder %>% 
  group_by(continent)



# summarize

gapminder %>% 
  group_by(continent) %>% 
  summarize(MeanLife = mean(lifeExp))
   # this command gives you the mean life expectancy for each continent

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = mean(lifeExp))
   # gives you mean life expectancy for each continent by year

#calculating standard error (sd()/sqrt(n())
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = (mean(lifeExp)),
              SeLife = sd(lifeExp)/sqrt(n()))

#and now we add a graph to this with std error bars
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = (mean(lifeExp)),
            SeLife = sd(lifeExp)/sqrt(n())) %>%
  ggplot(mapping = aes(x = year,
                       y = MeanLife,
                       color = continent)) +
  geom_line() +
  geom_errorbar(mapping = aes(ymin = MeanLife - SeLife,
                              ymax = MeanLife + SeLife))

#those error bars are too wide/chunky, so we want to make them more narrow:
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = (mean(lifeExp)),
            SeLife = sd(lifeExp)/sqrt(n())) %>%
  ggplot(mapping = aes(x = year,
                       y = MeanLife,
                       color = continent)) +
  geom_line() +
  geom_errorbar(mapping = aes(ymin = MeanLife - SeLife,
                              ymax = MeanLife + SeLife,
                              width = 0.5))

# We want to see how many countries are in each continent 
gapminder %>% 
  select(country, continent) %>% 
  unique() %>%
  group_by(continent) %>% 
  summarize(count = n())

# What is the proportion of countries in each continent
gapminder %>% 
  select(country, continent) %>% 
  unique() %>%
  group_by(continent) %>%
  summarize(n = n()) %>% 
  mutate(count = sum(n),
         proportion = n / sum(n))
  summarize(count = n())

  
  
# create a new dataframe that contains the minimum (MinExp) and maximum (MaxExp) life
# expectancies for each country

#  Option 1
gapminder %>% 
    select(country, lifeExp) %>% 
    group_by(country) %>% 
    summarize(min_life = min(lifeExp),
              max_life = max(lifeExp))

#  Option 2
gapminder_minmax_life <- gapminder %>% group_by(country) %>% summarise(MinExp = min(lifeExp), MaxExp = max(lifeExp))
  
#  Option 3
df2 <- data.frame(gapminder %>% 
                  group_by(country) %>% 
                  summarise(MinLife = min(lifeExp), 
                            MaxLife = max(lifeExp)))
  
  
# Calculate the average life expectancy per country. Which has the longest average 
# life expectancy and which has the shortest average life expectancy?
  
gapminder %>% 
  group_by(country) %>% 
  summarise(MeanLife = mean(lifeExp)) %>% 
  filter(MeanLife == min(MeanLife) | MeanLife == max(MeanLife))


# Make a ggplot scatterplot of the lifeExp vs GDPperCap for the countries whose average
# life expectancy is lower than average for all years combined (mean_lifeExp_gapminder,
# or 59.47444). Color the graph by continent
#
# steps:
#   calculate mean_lifeExp_gapminder
#   group_by
#   summarize
#   filter
#   ggplot (?) + geom_point()

# The https://pad.carpentries.org/2019-10-26-Tucson website froze so I couldn't retrieve
# the solution for this