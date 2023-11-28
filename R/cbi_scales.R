#' Scale constructor for CBI colors
#'
#' If plotting discrete data that needs more than 10 colors,
#' then you will have to create your own palette using
#' \code{\link{make_cbi_pal}}.
#'
#' @param palette Char name of palette in \code{cbi_palettes}
#' @param discrete Bool flagging whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Further arguments passed to \code{\link{discrete_scale}} or
#'   \code{\link{scale_colour_gradientn}}
#'
#'
#' @export
scale_color_cbi <- function(
    palette = NULL,
    discrete = FALSE,
    reverse = FALSE,
    ...
) {
  if (is.null(palette) && discrete) {
    palette <- "graph"
  }

  if (is.null(palette) && !discrete) {
    palette <- "sequential"
  }

  pal <- make_cbi_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("color", paste0("cbi_", palette), palette = make_cbi_pal_discrete, ...)
  } else {
    ggplot2::scale_colour_gradientn(colors = pal(256L), ...)
  }
}


#' @describeIn scale_color_cbi For fill scales
#'
#' @export
#'
scale_fill_cbi <- function(
    palette = NULL,
    discrete = FALSE,
    reverse = FALSE,
    ...
) {
  if (is.null(palette) && discrete) {
    palette <- "graph"
  }

  if (is.null(palette) && !discrete) {
    palette <- "sequential"
  }

  pal <- make_cbi_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("cbi_", palette), palette =  make_cbi_pal_discrete, ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = pal(256L), ...)
  }
}
