#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
human <- function(
    gender = c("male", "female"),
    shown = "thyroid_gland",
    highlighted = "adrenal_gland",
    selected = c(),
    width = NULL,
    height = NULL,
    elementId = NULL) {
  gender <- match.arg(gender, choices = c("male", "female"), several.ok = FALSE)

  if (gender == "male") {
    svg_file <- system.file("svgs", "homo_sapiens_male.svg", package = "shinybody")
  } else {
    svg_file <- system.file("svgs", "homo_sapiens_female.svg", package = "shinybody")
  }
  svg_text <- paste(readLines(svg_file), collapse = "\n")

  x = list(
    svg_text = svg_text,
    shown = shown,
    highlighted  = highlighted,
    selected = selected
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'human',
    x,
    width = width,
    height = height,
    package = 'shinybody',
    elementId = elementId
  )
}

#' Shiny bindings for human
#'
#' Output and render functions for using human within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a human
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name human-shiny
#'
#' @export
humanOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'human', width, height, package = 'shinybody')
}

#' @rdname human-shiny
#' @export
renderHuman <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, humanOutput, env, quoted = TRUE)
}
