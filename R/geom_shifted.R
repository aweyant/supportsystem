#' Geometric Distribution Supported on Positive Integers
#'
#' @inheritParams stats::Geometric
#'
#' @name geom_shifted
NULL


### This hard-coding achieves my goal. However, my actual application is much
### more complicated, so this is not a good solution.
#' @rdname geom_shifted
#' @export
dgeom_shifted_manual <- function(x, prob, log = FALSE) {
  stats::dgeom(x = x-1, prob = prob, log = log)
}

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
### This is a rather realistic, but much simplified example of what I am trying
### to do.

#' #' @rdname geom_shifted
#' #'
#' #' @export
#' dgeom_shifted_programmatic <- shift_support(args = formals(dgeom),
#'                                             distribution_function = dgeom,
#'                                             shift_args = list("x = x -1"))


### A function can call util functions from another file, even if they are not
### present in namespace. Namespace is apparently not really a factor.
#' @rdname geom_shifted
util_caller2 <- function(b = 5) {
  other_util(a = b)
}

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
### This works in an interactive environment. Functions are objects, so surely
### we can define a function as the output of another function. However, this
### does not work for me, if the factory function util is from my package.
# util_caller3 <- util3()


### THIS WORKS
### We can set our own function directly equal to an existing function. Note -
### this is not setting it equal to a factory function which produces the same
### output.
stats_caller1 <- stats::dgeom

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
### Wrapping what we have done above in a wrapper/factory function results in
### the same type of error I get in my actual application.
# stats_util_caller1 <- stats_util(stats::dgeom)

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
### The issue persists, even if the util is in the very same file
# stats_util_caller2 <- stats_util_in_same_file(stats::dgeom)

### Interestingly, the function is found in this case.
uses_stats_util_caller2 <- function() {
  stats_util_in_same_file(stats::dgeom)
}

### UNCOMMENTING THIS AND RUNNING load_all() RESULTS IN ERROR: "...could not find function..."
### Can you use this to make an ugly solution? No, the can has just been kicked
### down the road
# uses_uses_stats_util_caller2 <- uses_stats_util_caller2()

stats_util_in_same_file <- function(distribution_function) {
  return(distribution_function)
}
