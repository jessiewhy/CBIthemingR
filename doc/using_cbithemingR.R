## ----echo = FALSE, message = FALSE--------------------------------------------
height <- 4
width <- 6

knitr::opts_chunk$set(collapse = T, comment = "#>", 
                      fig.align='center',
                      fig.height = height,
                      fig.retina = 2,
                      fig.width = width)
library(dplyr)
library(ggplot2)
library(CBIthemingR)

## ----simulated-data-----------------------------------------------------------
data <- data.frame(x = runif(100) * 1000000, y = runif(100), roi_type = sample(1:2, 100, replace = T))

## ----sample-plot1-------------------------------------------------------------
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  scale_y_continuous() +
  scale_x_continuous()

## ----sample-plot2-------------------------------------------------------------
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  cbi_base_theme() +
  scale_y_continuous(labels = format_financial_data) +
  scale_x_continuous(labels = format_axis_labels_short)

## ----sample-plot3-------------------------------------------------------------
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  cbi_base_theme() +
  scale_y_continuous(labels = format_financial_data) +
  scale_x_continuous(labels = format_axis_labels_short) +
  scale_colour_gradient(low = cbi_darkblue, high = cbi_lightblue)

## ----sample-plot4-------------------------------------------------------------
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  cbi_base_theme() +
  scale_y_continuous(labels = format_financial_data) +
  scale_x_continuous(labels = format_axis_labels_short) +
  scale_color_cbi(discrete = FALSE)

## ----sample-plot5-------------------------------------------------------------
plot <- ggplot(iris,
               aes(x = Sepal.Length,
                   y = Sepal.Width,
                   colour = Species)) +
        geom_point(size = 4) +
        labs(x = "Species",
             y = "",
             colour = "Species")
plot + 
  cbi_base_theme() +
  scale_color_cbi(discrete = TRUE)

## ----sample-plot6-------------------------------------------------------------
plot <- ggplot(iris,
               aes(Sepal.Length, fill=Species)) +
        geom_bar() +
        cbi_base_theme() +
        scale_fill_cbi(discrete = TRUE)
plot

## ----sample-plot7-------------------------------------------------------------
ggplot(mtcars, aes(x = mpg, y = hp, colour = as.character(wt))) +
  geom_point() +
  cbi_base_theme() +
  scale_colour_manual(values = make_cbi_pal()(29))

