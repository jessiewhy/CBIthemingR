#' Scale constructor for CBI colors
#'
#' If you get an error about not enough colors, try a different palette (such
#' as \code{graph}) or set \code{discrete = FALSE}. If you are plotting discrete colors
#' and need more than 10 colors, then you will have to make your own palette using
#' \code{\link{make_cbi_pal}}.
#'
#' @param palette Character name of palette in \code{cbi_palettes}
#' @param discrete Boolean indicating whether color aesthetic is discrete or
#'   not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to \code{\link{discrete_scale}} or
#'   \code{\link{scale_color_gradientn}}, used respectively when discrete is
#'   TRUE or FALSE
#'
#' @describeIn scale_color_cbi For color scales
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
    ggplot2::scale_color_gradientn(colors = pal(256L), ...)
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
