library(ggplot2)
data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

drinks_data <- subset(data, Drinks. > 0 )
agg_drinks_data <- aggregate(
  drinks_data$Drinks.,
  by = list(drinks_data$weekday),
  FUN = length
)

pets_data <- subset(data, Pets. > 0 )
agg_pets_data <- aggregate(
  pets_data$Pets.,
  by = list(pets_data$weekday),
  FUN = length
)

myplot <- ggplot() +
geom_point( aes(x = agg_drinks_data$Group.1, y = agg_drinks_data$x)) +
  geom_smooth(aes(x = agg_drinks_data$Group.1, y = agg_drinks_data$x, color='Напитки'), method='lm') +
  geom_point(aes(x =agg_pets_data$ Group.1, y = agg_pets_data$x)) +
  geom_smooth(method='lm', aes(x =agg_pets_data$ Group.1, y = agg_pets_data$x, color="Товары для животных")) +
  scale_x_continuous(breaks = seq(1, 7)) +
  labs(
    title = "Регрессия количества заказов",
    y = "Количество заказов",
    x = "Дни"
  ) +
  scale_colour_manual(
    "", 
    breaks = c("Напитки", "Товары для животных"),
    values = c("blue", "red")
  )

print(myplot)