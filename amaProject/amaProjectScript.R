#opening ggplot2 library for ploting
library(ggplot2)

#opening patchwork library for creating a grid of plots 
library(patchwork)


#Importing dataset into RStudio for analysis
empData <- read.csv("EmploymentDataByYearUpdated.csv",
                    stringsAsFactors = FALSE)

#ploting the population growth trend from 1949 - 2019

#plot of years against civillians in labour force
p1 <- ggplot(empData, aes(x = Year, y = P_CLF)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Civillian in Labour Force") +
  ggsave("P_CLF.png", height = 6, width = 8)

#plot of years against civillians not in labour force
p2 <- ggplot(empData, aes(x = Year, y = P_NLF)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Civillian Not in Labour Force") +
  ggsave("P_NLF.png", height = 6, width = 8)

#plot of years against civillian Employed
p3 <- ggplot(empData, aes(x = Year, y = P_EMP)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Civillian Employed") +
  ggsave("P_EMP.png", height = 6, width = 8)

#plot of years against civillians unemployed
p4 <- ggplot(empData, aes(x = Year, y = P_UEMP)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Civillian Unemployed") +
  ggsave("P_UEMP.png", height = 6, width = 8)

#plot of years against civillians Employed in Agriculture
p5 <- ggplot(empData, aes(x = Year, y = P_EIA)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Civillian Employed in Agriculture") +
  ggsave("P_EIA.png", height = 6, width = 8)

#plot of years against civillians Not Employed in Agriculture
p6 <- ggplot(empData, aes(x = Year, y = P_ENIA)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Civillian Not Employed in Agriculture") +
  ggsave("P_ENIA.png", height = 6, width = 8)

#Creating 2x1 subgrids
r1 = p1 + p2
r2 = p3 + p4
r3 = p5 + p6

#creating 1x3 final grid 
r1 / r2 / r3
