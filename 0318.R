#1  直方圖
#2  plot(price ~ carat, data = diamonds)
#3  boxplot(diamonds$carat.main = "Box Histogram")

#4  
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
a = ggplot(data = diamonds)
b = geom_histogram(aes(x = carat))
a+b

#5  
g + geom_point(aes(color = clarity))

#6 
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)

#7  
ggplot(diamonds, aes(x = price)) + geom_histogram() + facet_wrap(~cut)

#8 X固定

#9 "Hello Jared"

#10 "Hello  "

#11 run.this(1:10, var)
#12 1
#13 goodbye
#14 ifelse(toTest == 1, toTest * 3, toTest+2) => [1]  3 NA  2  3  2  3
#15 for,while