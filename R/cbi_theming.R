#' @title base default
#'
#' @description clean up default clutter in ggplots
#'
#' @details TBD
#'
#' @param TBD
#'
#' @return TBD
#'
#' @export
#'
#' @examples
#' \dontrun{
#' ggplot(mapping = aes(x = x, y = y), data = data) + geom_line() +
#'  base_theme() +
#'  scale_y_continuous(labels = format_axis_labels_short)
#' }
#' base_theme()
base_theme <- function() {
  theme_bw() +
    theme(axis.title.y = element_blank(),
          axis.title.x = element_blank(),
          axis.ticks.y = element_blank(),
          panel.grid = element_blank())

}
