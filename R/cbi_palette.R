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
#' takes a CBI color palette and generates more colors from it,
#' so that amount of colors needed is always met
#'
#' The interpolation method is set to "spline" (while default is "linear") to
#' reduce the number of redundant colors.
#'
#' Returns a function that takes a single value and makes that many colors.
#'
#' @param palette (character; default = \code{"graph"}) given name of a CBI
#'   palette: \code{\link{cbi_palettes}}
#' @param reverse (boolean; default = \code{FALSE}) flags if palette should
#'   be reverse
#' @param ... Additional arguments to pass to \code{colorRampPalette} see
#'   details here \code{\link[grDevices]{colorRamp}}
#'
#' @seealso \code{\link{cbi_palettes}}
#'
#' @examples
#'
#' ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = hp, color = as.character(wt))) +
#'   ggplot2::geom_point() +
#'   ggplot2::scale_color_manual(values = make_cbi_pal()(29))
#'
#' @export
make_cbi_pal <- function(palette = "sequential",
                             reverse = FALSE,
                             ...) {

  assertthat::assert_that(palette %in% c("graph", "sequential", "diverging"),
                          msg = "Palette isn't one of `graph`, `sequential` or `diverging`")

  pal <- cbi_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(
    pal,
    ...,
    interpolate = "spline"
  )
}

#' Create a CBI color palette
#'
#' Function takes a the CBI graph color palette and returns a vector of colors equal to n.
#' It is used in \code{\link{scale_color_cbi}} and \code{\link{scale_fill_cbi}} to make the discrete
#' color scale
#'
#'
#' @param n how many colors to return
#'
#' @seealso \code{\link{cbi_palettes}}
#'
#' @export
make_cbi_pal_discrete <- function(n) {
  assertthat::assert_that(n <= 10,
                          msg = "Chart requires more than 10 colors. Consider a continuous palette or make a palette with more colors own using `make_cbi_pal(palette = 'graph')` e.g. `scale_color_manual(values = make_cbi_pal(palette = 'graph')(29))")
  pal <- cbi_palettes[["graph"]][1:n]

  order_name <- 'curr'

  order <- palette_order[[order_name]]

  ordered_pal <- order[order %in% pal]

  return(ordered_pal)
}
