data <- read.table(file = 'data/ulabox_orders_with_categories_partials_2017.csv', header = TRUE, sep = ",")

result <- c(
    sum(data$Food.), 
    sum(data$Fresh.), 
    sum(data$Drinks.),
    sum(data$Home.),
    sum(data$Beauty.),
    sum(data$Health.),
    sum(data$Baby.), 
    sum(data$Pets.)
)

lbls <- c("Food", "Fresh", "Drinks", "Home", "Beauty", "Health", "Baby", "Pets")
names(result) <- lbls

pct <- round(result/sum(result)*100)

lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")

pie(pct, labels = lbls, main="Популярность категорий товаров")
