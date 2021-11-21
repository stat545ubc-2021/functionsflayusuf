#' Side-By-Side Box plots Function
#'
#' This function produces box plots for a numeric column
#' across levels of a text/factor column, from a tibble or data frame.
#'
#' @param data The tibble or data frame which contains the numeric
#' and text/factor columns.
#' @param cat The text or factor column name.
#' @param num The numeric column name.
#'
#' @return Box plots of the numeric column for each level of the
#' text/factor column. Throws an error if `cat` and `num` are not the proper class.
#'
#' @examples
#' boxplots(datateachr::apt_buildings, air_conditioning, year_built)
#' boxplots(gapminder::gapminder, continent, lifeExp)
#'
#' @export

boxplots = function(data, cat, num) {
  if(!is.factor(pull(data, {{cat}})) && !is.character(pull(data, {{cat}}))) {
    stop('I am sorry, `cat` column must be of class character or factor.',
         'You have provided an object of class:', class(pull(data, {{cat}}))[1])
  }
  if(!is.numeric(pull(data,{{num}}))) {
    stop('I am sorry, `num` column must be numeric class.',
         'You have provided an object of class:', class(pull(data, {{num}}))[1])
  }
  data %>%
    drop_na({{cat}}, {{num}}) %>%
    ggplot(aes(x = {{cat}}, y = {{num}}, fill = {{cat}})) +
    geom_boxplot() +
    theme_minimal()
}
