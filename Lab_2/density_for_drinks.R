library(ggplot2)
data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

myplot <- ggplot(data, aes( x = Drinks.)) +
  geom_density() +
  scale_x_continuous(breaks = seq(0, 100, 5)) +
  labs(title = "Плотность процентов от общей суммы заказа для Drinks",
       x = "Процент от стоимости заказа",
       y = "Плотность")

print(myplot)