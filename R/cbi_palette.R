#' Predefined CBI colors combined into palettes
#'
#' A list of CBI colors combined into palettes that are used
#' for different charts.
#' @export
cbi_palettes <- list(
  `graph` = c(cbi_darkblue,
              cbi_base_alsodarkblue,
              cbi_medblue,
              cbi_weirdblue,
              cbi_transblue,
              cbi_base_anothertransblue,
              cbi_lightblue,
              cbi_interestingblue,
              cbi_yellow,
              cbi_base_gray),
  `sequential` = c(cbi_darkblue, cbi_medblue, cbi_lightblue),
  `diverging` = c(cbi_base_gray, cbi_yellow, cbi_base_medblue)
)

#' Palette order
#'
#' @export
palette_order <- list(
  `curr` =
    c(cbi_darkblue,
      cbi_base_alsodarkblue,
      cbi_medblue,
      cbi_weirdblue,
      cbi_transblue,
      cbi_base_anothertransblue,
      cbi_lightblue,
      cbi_interestingblue,
      cbi_yellow,
      cbi_base_gray
      ))

#' Interpolate CBI color palette
#'
#' Uses CBI color palette and generates more colors from it
#' so that amount of colors needed is always met.
#'
#' Interpolation set to "spline" (while default is "linear") to
#' reduce the number of redundant colors.
#'
#' Returns a function that takes a single value and turns it into many colors.
#'
#' @param palette (char; default = \code{"graph"}) given name of a CBI
#'   palette: \code{\link{cbi_palettes}}
#' @param reverse (bool; default = \code{FALSE}) flags if user wishes to reverse
#'   palette order
#' @param ... Additional arguments to pass to \code{colorRampPalette} see
#'   details here \code{\link[grDevices]{colorRamp}}
#'
#' @examples
#'
#' ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = hp, color = as.character(wt))) +
#'   ggplot2::geom_point() +
#'   ggplot2::scale_colour_manual(values = make_cbi_pal()(26))
#'
#' @export
make_cbi_pal <- function(palette = "sequential",
                         reverse = FALSE,
                         ...) {
  palette_options <- c("graph", "sequential", "diverging")
  tryCatch(
    {
      if(palette %in% palette_options) {
        pal <- cbi_palettes[[palette]]

        if (reverse) pal <- rev(pal)

        return(grDevices::colorRampPalette(
          pal,
          ...,
          interpolate = "spline"
        ))
      }
      error=function(e) {
        msg = "Palette isn't valid option: `graph`, `sequential` or `diverging`"
        return(msg)
      }
    }
  )
}

#' Create a CBI color palette
#'
#' Function takes CBI graph color palette and returns a vector of colors equal to n.
#' Used in \code{\link{scale_color_cbi}} and \code{\link{scale_fill_cbi}} to make the discrete
#' color scale
#'
#' @param n how many colors to return
#'
#' @export
#'
#'
make_cbi_pal_discrete <- function(n) {
  tryCatch(
    {
      if (n <= 10){
        pal <- cbi_palettes[["graph"]][1:n]

        order_name <- 'curr'

        order <- palette_order[[order_name]]

        ordered_pal <- order[order %in% pal]

        return(ordered_pal)
      }
      error=function(e) {
        msg = "Chart requires more than 10 colors. Consider a continuous palette using `make_cbi_pal(palette = 'graph')"
        return(msg)
      }
    }
  )

}
