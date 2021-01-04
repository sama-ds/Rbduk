#' Tooltip that only applies a pop up tooltip to specific selections of a shiny radio button.
#'
#' @param id The ID of the radio button the tooltip should appear on.
#' @param choice The choice within the radio buttons that the tooltip should appear on.
#' @param title The tooltip message as a string.
#'@param placement Where the popover should appear relative to its target
#'(\code{top}, \code{bottom}, \code{left}, or \code{right}). Defaults to \code{"bottom"}.
#'@param trigger What action should cause the popover to appear? (\code{hover},
#'\code{focus}, \code{click}, or \code{manual}). Defaults to \code{"hover"}.
#'@param options A named list of additional options to be set on the popover.
#'
#'See README for example usage.


radioTooltip <- function(id, choice, title, placement = "bottom", trigger = "hover", options = NULL){

  options = shinyBS:::buildTooltipOrPopoverOptionsList(title, placement, trigger, options)
  options = paste0("{'", paste(names(options), options, sep = "': '", collapse = "', '"), "'}")
  bsTag <- shiny::tags$script(shiny::HTML(paste0("
    $(document).ready(function() {
      setTimeout(function() {
        $('input', $('#", id, "')).each(function(){
          if(this.getAttribute('value') == '", choice, "') {
            opts = $.extend(", options, ", {html: true});
            $(this.parentElement).tooltip('destroy');
            $(this.parentElement).tooltip(opts);
          }
        })
      }, 500)
    });
  ")))
  htmltools::attachDependencies(bsTag, shinyBS:::shinyBSDep)
}
