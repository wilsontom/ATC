#' Retrieve Classification Details for a Anatomical Therapeutic Chemical (ATC) Code
#'
#' Retrieve the hierarchical classification details for a Anatomical Therapeutic Chemical (ATC) code
#' from the World Health Organisation (WHO) Collaborating Centre for Drug Statistics Methodology website (https://www.whocc.no)
#'
#' @param ATC_CODE a character string of a valid ATC code
#' @return a `data.frame`
#' @export
#' @examples
#' search_atc_code('A10BA02')

search_atc_code <- function(ATC_CODE)
{
  base_url_a <- 'https://www.whocc.no/atc_ddd_index/?code='
  base_url_b <- '&showdescription=no'


  search_url <- paste0(base_url_a, ATC_CODE, base_url_b)

  http_req <- httr::GET(search_url)
  http_content <- httr::content(http_req, 'parsed')


  xml_parse <- xml2::xml_text(http_content)

  xml_split <- strsplit(xml_parse, '\n')[[1]]


  res_a <- xml_split[167]

  find_upper <- gregexpr("[A-Z]", res_a)[[1]]

  find_upper_diff <- NULL
  for (i in seq_along(find_upper)) {
    find_upper_diff[[i]] <- find_upper[i] - find_upper[i + 1]
  }

  res_a_full <-
    substr(res_a, start = find_upper[which(find_upper_diff > -5)[1]], stop = nchar(res_a))


  res_b <- xml_split[168]

  res_c <- xml_split[169]

  res_d <- xml_split[170]

  res_d_full <-
    substr(res_d,
           start = 1,
           stop = stringr::str_locate(res_d, 'ATC')[1] - 1)

  res_e <- stringr::str_locate(res_d, ATC_CODE)[2]


  whitespace <- stringr::str_locate_all(res_d, '\\s+')[[1]]

  word_end <- whitespace[which(whitespace[, 1] == res_e + 1) + 1, ][[1]]

  chemical_name <-
    substr(res_d, start = res_e + 2, stop = word_end - 1)

  atc_levels <-
    c(
      'Anatomical Main Group',
      'Therapeutic Sub-Group',
      'Pharmacological Sub-Group',
      'Chemical Sub-Group',
      'Chemcial Substance',
      'ATC'
    )

  atc_classification <-
    data.frame(
      Level = atc_levels,
      Value = c(res_a_full, res_b, res_c, res_d_full, chemical_name, ATC_CODE)
    )


  return(atc_classification)
}
