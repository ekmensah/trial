#opening the dplyer package and the gapminder data package for use in this session
library(dplyr)
library(gapminder)
library(ggplot2)

#displays the first few lines in the gapminder dataset
head(gapminder)

#filters out data points with a year of 2007 and assigns it to the gap_07 object
gap_07 <- filter(gapminder, year == 2007)

#filter multiple data points
gap_countries <- filter(gapminder, country %in% c("France", "Ghana", "Turkey"))

#filter out data points wwith year as 2007 except for points from the continent of Oceania
filter(gapminder, year == 2007 & continent != "Oceania")
 
#function chain (filter, group_by, summarise)
gapminder %>%
  filter(year == 2007) %>%
  group_by(country) %>%
  summarise(medpop = median(pop))

#plot a scatterplot of gdpPercap againt lifeExp from gap_07 data object
ggplot(gap_07, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

#plot a histogram showing data distribution
ggplot(gap_07, aes(x = continent)) + 
  geom_bar()

#function chain (filter, group_by, summarise)
gap_07_med <- gap_07 %>%
  group_by(continent) %>%
  summarise(pop = median(pop))

head(gap_07_med)

ggplot(gap_07_med, aes(x = continent, y = pop)) + 
  geom_bar(stat = "identity")


##Checking to see how the GDP of ICELAND has changed over the years

gap_iceland = filter(gapminder, country == "Iceland")

p <- ggplot(gap_iceland, aes(x = year, y = gdpPercap))

p + geom_point()

p + geom_line()

p +
  geom_point() +
  geom_line() +
  ggsave("iceland_gdp.png", height = 6, width = 8)

p2 <- ggplot(gap_iceland, aes(x=year, y= gdpPercap)) +
  geom_point()

ggsave("iceland_gdp1.png", plot = p2, height = 6, width = 8)

View(gapminder)
