#' @title Remove defaults from ggplot charts
#'
#' @description cbi_base_theme() allows users to call a CBI standardized theme to ggplot charts.
#'
#' @details This function removes ggplot() default options that clutter chart space to enhance readability.
#'  Additionally, it calls upon cbi_geom_defaults() to set standard CBI colors to frequently used plot elements.
#'
#' @return A theme object catered toward CBI standards
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ggplot(mapping = aes(x = x, y = y), data = data) +
#'  geom_line() +
#'  cbi_base_theme()
#' }
#' cbi_base_theme()
cbi_base_theme <- function() {
  ret <- ggplot2::theme_bw() +
    ggplot2::theme(
      axis.title.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank()
    )
  cbi_geom_defaults()
  return(ret)
}
