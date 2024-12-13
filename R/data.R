#' Example data set of tumors
#'
#' A randomly generated dataset of tumors to use in examples
#'
#' @format ## `tumors`
#' A data frame with 39 rows and 5 columns:
#' \describe{
#'   \item{patient_id }{A unique patient identifier}
#'   \item{tumor_id}{A unique tumor identifier}
#'   \item{tumor_location}{The organ affected by the tumor}
#'   \item{is_primary_tumor}{TRUE if the tumor is the patient's primary cancer site, otherwise FALSE}
#'   \item{stage}{The stage of the tumor (I, II, or III)}
#' }
"tumors"

#' Example data set of patients
#'
#' A randomly generated dataset of patient details
#'
#' @format ## `patients`
#' A data frame with 16 rows and 5 columns:
#' \describe{
#'   \item{patient_id }{A unique patient identifier}
#'   \item{gender}{"male" or "female"}
#'   \item{age}{Patient age}
#'   \item{height}{Patient height in inches}
#'   \item{weight}{Patient weight in lbs}
#' }
"patients"
