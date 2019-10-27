install.packages('ggplot2') #installs the package
library(ggplot2) #loads the package


gapminder <- read.csv('../r_lesson/gapminder.csv', stringsAsFactors = TRUE)

# ggplot wants the following inputs:
   # dataframe
   # variables from the dataframe for plotting
   # visualization

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y=lifeExp))+
  geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y=lifeExp, color = continent))+
  geom_point()


ggplot(data = gapminder, mapping = aes(x = year, y=lifeExp, color = continent))+
  geom_line()

ggplot(data = gapminder, mapping = aes(x = year, y=lifeExp, color = continent, by = country))+
  geom_line() + geom_point()
#right now, the above command is coloring the lines and points the same as each other (globally)
#the following command will color them differently
ggplot(data = gapminder, mapping = aes(x = year, y=lifeExp, by = country))+
  geom_line(mapping = aes(color=continent)) + geom_point()
#note that we're still giving ggplot the 3 things it wants: 
   #dataframe: data = gapminder
   #variables: x = year, y = lifeExp, by = country
   #visualization: geom_line(mapping = aes(color=continent)) + geom_point()

#you can save a graph as a variable...naming this variable "lifeExpYear"
lifeExpYear <- ggplot(data = gapminder, mapping = aes(x = year, y=lifeExp, by = country))+
  geom_line(mapping = aes(color=continent)) + geom_point()
#then save it as a file using ggsave
ggsave(filename='lifeexp_v_year.png', plot=lifeExpYear)



#FITTING MODELS
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))+
  geom_point() + scale_x_log10() + geom_smooth(method = 'lm')
#the 'lm' stands for linear model

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point() + scale_x_log10()



ggplot(data=gapminder, mapping = aes(x=gdpPercap, color=continent))+
  geom_density()

ggplot(data=gapminder, mapping = aes(x=gdpPercap, fill=continent))+
  geom_density()

ggplot(data=gapminder, mapping = aes(x=gdpPercap, color=continent))+
  geom_density() + scale_x_log10() + facet_wrap(~ continent)
#scale_x_log10 ...this command transforms the x-axis
#facet_wrap ~ continent ...this command makes a different graph for each continent



