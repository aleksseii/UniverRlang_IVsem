# part 7.1 -----------------------------------------------------------
if ("ggplot2" %in% rownames(installed.packages()) == FALSE) {
    install.packages("ggplot2")
}
library(ggplot2)

# task 1
path <- "https://raw.githubusercontent.com/allatambov/R-programming-3/master/seminars/sem8-09-02/demography.csv"
demograthy <- read.csv(path, encoding = "UTF-8")
head(demograthy)

# task 2
demograthy$young_share <- (demograthy$young_total / demograthy$popul_total * 100)
demograthy$trud_share <- (demograthy$wa_total / demograthy$popul_total * 100)
demograthy$old_share <- (demograthy$ret_total / demograthy$popul_total * 100)
head(demograthy)

# task 3
ggplot(data = demograthy, mapping = aes(trud_share)) +
    geom_histogram(bins = 15, color = "black", fill = "lightblue") +
    geom_rug() +
    geom_vline(xintercept = median(demograthy$trud_share),
               color = "darkblue",
               lty = 2) +
    labs(title = "Гистограмма распределения доли трудоспособного населения", x = "Доля трудоспособных") +
    scale_x_continuous(n.breaks = 10) +
    scale_y_continuous(n.breaks = 10) +
    theme_bw()

# task 4
ggplot(data = demograthy, aes(x = trud_share, group = region, fill = region)) + geom_density(alpha = 0.5)

ggplot(data = demograthy, aes(x = region, y = trud_share, fill = region)) + geom_violin()

ggplot(data = demograthy, aes(x = region, y = trud_share, fill = region))

# task 5
ggplot(data = demograthy) +
    geom_point(aes(x = old_share, y = young_share),
               color = 'blue',
               size = 5,
               shape = 1) +
    labs(title = "Диаграмма рассеяния",
         subtitle = "для доли людей моложе и старше трудоспособного возраста",
         x = "старше",
         y = "моложе") +
    scale_x_continuous(n.breaks = 15) +
    scale_y_continuous(n.breaks = 15) +
    theme_bw()

# task 6
demograthy$male_share <- ((demograthy$wa_male +
    demograthy$ret_male +
    demograthy$young_male) /
    demograthy$popul_total * 100)

demograthy$male <- ifelse(demograthy$male_share >= 50, 1, 0)
head(demograthy)

# task 7
demograthy$male <- as.factor(demograthy$male)
ggplot(data = demograthy,
       aes(x = young_share, y = old_share, size = male_share, color = male)) +
    geom_point(alpha = 0.7) +
    scale_color_manual(values = c("pink", "lightblue"))
theme_bw()

ggplot(data = demograthy) +
    geom_bar(mapping = aes(region, color = region, fill = region)) +
    theme_bw()


# part 7.2 -----------------------------------------------------------

# task 1
head(mtcars)

ggplot(data = mtcars,
       aes(x = hp, y = wt)) +
    geom_point(aes(size = cyl, color = as.factor(am))) +
    labs(title = "Характеристики автомобилей",
         x = "Число лошадиных сил",
         y = "Вес",
         color = "Коробка передач",
         size = "Число цилиндров") +
    scale_color_manual(values = c("green", "red"),
                       labels = c("Автомат", "Механика"))

# task 2
ggplot(data = mtcars, aes(x = hp)) +
    geom_histogram(fill = "brown",
                   color = "black",
                   bins = 6) +
    labs(title = "Gross horsepower",
         x = "Horsepower",
         y = "count") +
    theme_bw() +
    facet_grid(~am,
               labeller = labeller(am = c("0" = "Automatic", "1" = "Mechanic")))

# task 3
head(sleep)
ggplot(sleep, aes(y = extra, group = group, fill = group)) +
    geom_boxplot() +
    labs(title = "Распределение переменной extra",
         x = ":)",
         y = "extra") +
    scale_fill_manual(values = c("pink", "azure")) +
    theme_bw()

