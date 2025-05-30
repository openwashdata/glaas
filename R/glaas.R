#' glaas: UN-Water Global Analysis and Assessment of Sanitation and Drinking-water
#' 
#' GLAAS provides policy- and decision-makers at all levels with reliable, easily accessible, comprehensive data on water, sanitation and hygiene (WASH) systems, including on governance, monitoring, human resources and finance. GLAAS monitors elements of WASH systems that are required to sustain and extend WASH services and systems to all, and especially to the most vulnerable population groups.
#' 
#' @format A tibble with 263033 rows and 18 variables
#' \describe{
#'   \item{GrandParentText}{The high-level category or domain of the data, such as Finance, Governance, or Monitoring.}
#'   \item{ParentText}{The specific subcategory or topic within the high-level category, such as Domestic absorption or External funding absorption.}
#'   \item{IndText_HL}{The detailed description or indicator text for the high-level category, providing context or specific details about the data.}
#'   \item{LocText}{The location or country associated with the data, such as Brazil or Barbados.}
#'   \item{Time}{The year in which the data was recorded or the time period of the data.}
#'   \item{IsComparable_2013}{A boolean value indicating whether the data is comparable to the data from 2013.}
#'   \item{IsComparable_2016}{A boolean value indicating whether the data is comparable to the data from 2016.}
#'   \item{IsComparable_2018}{A boolean value indicating whether the data is comparable to the data from 2018.}
#'   \item{IsComparable_2021}{A boolean value indicating whether the data is comparable to the data from 2021.}
#'   \item{IsComparable_2024}{A boolean value indicating whether the data is comparable to the data from 2024.}
#'   \item{Dim1ValText}{The first dimension value text, representing categories such as Drinking-water or Sanitation.}
#'   \item{Dim2ValText}{The second dimension value text, representing categories such as Urban or Rural.}
#'   \item{Dim3ValText}{The third dimension value text, representing categories such as National* or Address.}
#'   \item{Dim4ValText}{The fourth dimension value text, representing categories such as Behaviour change improvement initiatives or Standards or regulations.}
#'   \item{Dim5ValText}{The fifth dimension value text, representing categories such as Themes or Quality.}
#'   \item{Dim6ValText}{The sixth dimension value text, representing categories such as Sufficiency or Treated.}
#'   \item{ValText}{The value text, providing specific details or descriptions about the data, such as Between 50 to 75% or No response.}
#'   \item{DataType}{The data type of the column, indicating whether the data is Text or Decimal.}
#' }
"glaas"
