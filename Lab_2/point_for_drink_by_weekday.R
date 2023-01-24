library(ggplot2)
data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

myplot <- ggplot(data, aes(x = weekday, y = Drinks.)) +
  geom_point() +
  scale_y_continuous(breaks = seq(0, 100, 5)) +
  labs(title = "Распределение заказов для Drinks",
       x = "Дни недели",
       y = "Процент от стоимости заказа")

print(myplot)