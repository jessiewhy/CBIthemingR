#' @importFrom ggplot2 update_geom_defaults .pt

cbi_geom_defaults <- function() {
  # Setting consistent defaults for individual geoms

  # TODO: update_geom_defaults() could be deprecated in a
  # future ggplot2
  # release (see https://github.com/tidyverse/ggplot2/pull/2749)
  # when this happens, code below will have to be replaced
  update_geom_defaults('point',
                       list(colour = CBIthemingR::cbi_base_lightblue,
                            size = 6 / .pt))
  update_geom_defaults('line',
                       list(colour = CBIthemingR::cbi_base_lightblue,
                            size = 3 / .pt))
  update_geom_defaults('text',
                       list(colour = CBIthemingR::cbi_base_black,
                            size = 18 / .pt))
  update_geom_defaults('label',
                       list(size = 18 / .pt,
                            fill = CBIthemingR::cbi_base_white,
                            colour = CBIthemingR::cbi_base_lightblue))
}
