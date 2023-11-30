#' Scale constructor for CBI colors
#'
#' Note: If plotting discrete data that requires > 10 colors,
#' then user should create own palette using
#' \code{\link{make_cbi_pal}}.
#'
#' @param palette Char name of palette in \code{cbi_palettes}
#' @param discrete Bool flagging whether color aesthetic is discrete or not
#' @param reverse Bool flagging whether the palette order should be reversed
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
