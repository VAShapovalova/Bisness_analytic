data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")
print(head(data))

result <- aggregate(data$Food., by = list(data$weekday, data$hour), FUN = mean)
names(result) <- c("Weekday", "Hour", "Average_order_percent")

rown <- c("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье")
coln <- c(0:23)
matrix <- matrix(result$Average_order_percent, nrow = 7, dimnames = list(rown, coln))

heatmap(matrix,
        Rowv = NA,
        Colv = NA,
        scale = "none")