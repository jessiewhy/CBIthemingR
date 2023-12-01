
# CBIthemingR

<!-- badges: start -->
<!-- badges: end -->

Create ggplot2 charts that meet Constellation Brands, Inc. (CBI) theming standards. 

## Installation

You can install the development version of CBIthemingR from [GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("jessiewhy/CBIthemingR")
```
This vignette illustrates the process of applying `CBIthemingR` to stylize R charts created with the `ggplot` package, ensuring their visual alignment with the data science standards of Constellation Brands, Inc. (CBI). Those are that the outputted visuals to the business are readable, understandable, and representative of the company's branding. 

Let's begin by plotting simulated financial data with `ggplot`.

```{r simulated-data}
data <- data.frame(x = runif(100) * 1000000, y = runif(100), roi_type = sample(1:2, 100, replace = T))
```

```{r sample-plot1}
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  scale_y_continuous() +
  scale_x_continuous()
```
However, this initial chart is not readable by CBI standards. Normally, a data scientist at CBI would have to manually adjust '`theme`' elements to clean up the plot, such as cleaning up the axis numbers, removing the axis titles, and so on. By using the `CBIthemingR` package though, this process can be automated for all data scientists on the team during the development process. 

\newpage 
## Formatting theme elements with `cbi_base_theme()`

The function `cbi_base_theme()` removes the clutter of default `ggplot` charts, allowing data scientists and the business to focus only on the necessities in result data. Combined with `format_axis_labels_short` and `format_financial_data` axis data can be quickly formatted at the same time to further enhance readability.

```{r sample-plot2}
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  cbi_base_theme() +
  scale_y_continuous(labels = format_financial_data) +
  scale_x_continuous(labels = format_axis_labels_short)
```

## Using CBI colors

To align `ggplot` charts with CBI color branding, please see examples below.  

### Calling single colors:

```{r sample-plot3}
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  cbi_base_theme() +
  scale_y_continuous(labels = format_financial_data) +
  scale_x_continuous(labels = format_axis_labels_short) +
  scale_colour_gradient(low = cbi_darkblue, high = cbi_lightblue)
```


### Continuous Data:

```{r sample-plot4}
data %>%
  ggplot(aes(x = x, y = y)) + 
  geom_line(aes(color = roi_type)) +
  cbi_base_theme() +
  scale_y_continuous(labels = format_financial_data) +
  scale_x_continuous(labels = format_axis_labels_short) +
  scale_color_cbi(discrete = FALSE)
```

### Discrete Data:

```{r sample-plot5}
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
```

#### Discrete data that requires more than 10 colors:
```{r sample-plot6}
ggplot(mtcars, aes(x = mpg, y = hp, colour = as.character(wt))) +
  geom_point() +
  cbi_base_theme() +
  scale_colour_manual(values = make_cbi_pal()(29))
```
