library(ggplot2)
data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

weekdays <- c(
  `1` = "Понедельник", 
  `2` = "Вторник", 
  `3` = "Среда", 
  `4` = "Четверг", 
  `5` = "Пятница", 
  `6` = "Суббота",
  `7` ="Воскресенье")

myplot <- ggplot(data, aes(x = hour, y = Pets.)) +
  geom_point() +
  scale_y_continuous(breaks = seq(0, 100, 20)) +
  scale_x_continuous(breaks = seq(0, 24)) +
  labs(title = "Распределение заказов для Pets",
       x = "Часы",
       y = "Процент от стоимости заказа") +
  facet_grid(rows = data$weekday, labeller = as_labeller(weekdays))

print(myplot)