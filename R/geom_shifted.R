#' Geometric Distribution Supported on Positive Integers
#'
#' @inheritParams stats::Geometric
#'
#' @name geom_shifted
NULL

#' @rdname geom_shifted
#' @export
dgeom_shifted_manual <- function(x, prob, log = FALSE) {
  stats::dgeom(x = x-1, prob = prob, log = log)
}

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
#' #' @rdname geom_shifted
#' #'
#' #' @export
#' dgeom_shifted_programmatic <- shift_support(args = formals(dgeom),
#'                                             distribution_function = dgeom,
#'                                             shift_args = list("x = x -1"))

#' @rdname geom_shifted
util_caller2 <- function(b = 5) {
  other_util(a = b)
}

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
# util_caller3 <- util3()


### THIS WORKS
stats_caller1 <- stats::dgeom

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
# stats_util_caller1 <- stats_util(stats::dgeom)
