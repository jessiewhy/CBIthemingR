#' @title Format ggplot labels with short notation
#'
#' @description format_axis_labels_short() formats axis labels in short notation for use in ggplot.
#'
#' @details This function allows you to easily format the labels in an axis to print using short notation. The current maximum short notation allowed is (T)rillions. Also allows (B)illions, (M)illions, and thousands (k).
#'
#' @param x The number to format.
#' @param gap Optional character to place between the number and the short notation label. Defaults to space (" ").
#' @param sig_digits_small Number of decimals to show for numbers less than 1,000. Defaults to NULL, which means show all available.
#' @param prefix Optional character(s) to append to the front of the numbers (e.g., prefix = "$" to add a dollar sign)
#'
#' @return A character vector of the same size as the input.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ggplot(mapping = aes(x = x, y = y), data = data) + geom_line() +
#'   scale_y_continuous(labels = format_axis_labels_short)
#' }
#' format_axis_labels_short()
format_axis_labels_short <- function(x = c(0), gap = " ", sig_digits_small = NULL, prefix = "") {
  if(is.null(sig_digits_small)) {
    xn <- dplyr::case_when(abs(x) >= 1000000000000 ~ paste0(round(abs(x) / 1000000000000, 1), gap, "T"),
                           abs(x) >= 1000000000 ~ paste0(round(abs(x) / 1000000000, 1), gap, "B"),
                           abs(x) >= 1000000 & abs(x) < 1000000000 ~  paste0(round(abs(x) / 1000000, 1), gap, "M"),
                           abs(x) >= 1000 & abs(x) < 1000000 ~ paste0(round(abs(x) / 1000, 1), gap, "k"),
                           T ~ format(abs(x), scientific = F))
  } else {
    xn <- dplyr::case_when(abs(x) >= 1000000000000 ~ paste0(round(abs(x) / 1000000000000, 1), gap, "T"),
                           abs(x) >= 1000000000 ~ paste0(round(abs(x) / 1000000000, 1), gap, "B"),
                           abs(x) >= 1000000 & abs(x) < 1000000000 ~  paste0(round(abs(x) / 1000000, 1), gap, "M"),
                           abs(x) >= 1000 & abs(x) < 1000000 ~ paste0(round(abs(x) / 1000, 1), gap, "k"),
                           T ~ paste0(round(abs(x), sig_digits_small), ""))
  }
  xn_sign <- ifelse(sign(x) == -1, "-", "")
  xn <- paste0(xn_sign, prefix, xn)
  return(xn)
}

#' @title Format ggplot labels with dollar notation
#'
#' @description format_financial_data() formats axis labels in dollar notation for use in ggplot.
#'
#' @details This function allows you to easily format the labels in an axis to print using dollar notation.
#'
#' @param x The number to format.
#'
#' @return N/A
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ggplot(mapping = aes(x = x, y = y), data = data) + geom_line() +
#'   scale_y_continuous(labels = format_financial_data)
#' }
#' format_financial_data()
format_financial_data <- function(x = c(0)) sprintf("$%1.2f", x)
