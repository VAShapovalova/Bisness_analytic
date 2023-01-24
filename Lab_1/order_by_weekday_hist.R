data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

agg = aggregate(data$order, by = list(data$weekday), FUN = length)

max_value_y = max(agg$x) + 300

lbls <- c("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье")

plot(
    agg$Group.1, 
    agg$x, 
    main="Распределение количества заказов дням недели", 
    col = c("blue"), 
    type="h", 
    lwd=5,
    xlab = "День недели",
    ylab = "Количество заказов",
    ylim = c(0, max_value_y),
    axes = FALSE
)

axis(1, agg$Group.1, lbls)

axis(2, at = seq(0, max_value_y, 300))


