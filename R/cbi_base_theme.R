#' @title Remove defaults from ggplots
#'
#' @description cbi_base_theme() removes ggplot() default that result in confused clutter over readability
#' @details This is TBD
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
