data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

data <- subset(data, round(data$Home.) > 0)
result <- aggregate(data$order, by = list(round(data$Home.), data$weekday), FUN = length)
names(result) <- c("Home_pct", "Weekday", "Order_count")

plot(
    result$Home_pct, 
    result$Order_count,
    col = c("red", "green", "blue", "orange", "gray", "yellow", "purple")[result$Weekday],
    main = "Количество заказов по проценту от стомости заказа по категории Home", 
    xlab = "Процент от стоимости заказа", 
    ylab = "Количество заказов",
    )

legend(
    "top", 
    cex = 1, 
    pch = 1, 
    col = c("red", "green", "blue", "orange", "gray", "yellow", "purple"), 
    c("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье")
    )
