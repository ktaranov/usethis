#' Add files to \code{.Rbuildignore}
#'
#' \code{.Rbuildignore} has a regular expression on each line, but it's
#' usually easier to work with specific file names. By default,
#' \code{use_build_ignore} will (crudely) turn a filename into a regular
#' expression that will only match that path. Repeated entries will be
#' silently removed.
#'
#' @param files Character vector of path names.
#' @param escape If \code{TRUE}, the default, will escape \code{.} to
#'   \code{\\.} and surround with \code{^} and \code{$}.
#' @inheritParams use_template
#' @export
use_build_ignore <- function(files, escape = TRUE, base_path = ".") {
  if (escape) {
    files <- escape_path(files)
  }

  write_union(base_path, ".Rbuildignore", files)
}

escape_path <- function(x) {
  x <- gsub("\\.", "\\\\.", x)
  x <- gsub("/$", "", x)
  paste0("^", x, "$")
}
