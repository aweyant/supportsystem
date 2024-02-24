#' Function-building utilities
#'
#'
#' @name utils
NULL

#' @rdname utils
#'
#' @param args arguments passed by the user to the created function
#' @param distribution_function (...)
#' @param shift_args string describing transformations to inputs of the
#' distribution function, usually a 'rigid shift' indicating a different support
#' @param env environment in which to evaluate the new function
#'
#' @export
shift_support <- function(args, distribution_function, shift_args, env = parent.frame()) {
  body = substitute({
    arguments = c(as.list(environment()))
    temp_str = paste(shift_args, collapse = ";")
    transformed_args = within(data = arguments,
                              expr = {
                                eval(parse(text = temp_str))
                              })
    do.call(what = distribution_function,
            args = transformed_args)
  })
  args <- as.pairlist(args)
  eval(call("function", args, body), env)
}

#' @rdname utils
util2 <- function(a = 10) {
  a
}

#' @rdname utils
#' @export
util3 <- function(a = 10) {
  function() {
    print(a)
  }
}

#' @rdname utils
#' @export
stats_util <- function(distribution_function) {
  return(distribution_function)
}

# shift_support_janky <- function(distribution_function = dgeom, offset = list("x = x-1", "n = n + 1")) {
#   function(formals(distribution_function)) {
#     args <- list(...)
#     eval(text = paste0("args$", offset))
#
#     do.call(what = distribution_function,
#             args = args)
#   }
# }
# shift_support_slow <- function(distribution_function, offset, env = parent.frame()) {
#   body = quote(expr = {
#     args = list(...)
#     print(args)
#
#     #test_str = paste(offset, collapse = ",")
#     #args = eval(parse(text = temp_str))
#
#     with(data = args, expr = parse(text = paste(offset, collapse = ";")))
#     args = as.pairlist(list(args))[[1]][[1]]
#     print(args)
#
#     do.call(what = distribution_function, args = as.list(args))
#   })
#   as.function(c(args, body), env)
# }
# shift_support <- function(distribution_function, offset, env = parent.frame()) {
#   args <- list(formals(distribution_function))
#   with(data = args, expr = parse(text = paste(offset, collapse = ";")))
#   args = as.pairlist(list(args))[[1]]
#   print(args)
#   eval(call("function", args, distribution_function), env)
# }
# body = quote({
#   dgeom(x = x-1, prob = prob, log = log)
# })
# shifted_dgeom <- make_function1(formals(dgeom), body = body)
# shifted_dgeom <- make_function1(alist(x = 1, prob = 0.7), body = body)
# make_function1 <- function(args, body, env = parent.frame()) {
#   args <- as.pairlist(args)
#   eval(call("function", args, body), env)
# }
