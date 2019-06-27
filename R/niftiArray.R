#' @importClassesFrom HDF5Array HDF5Array
setClass("NiftiArray",
         contains = "HDF5Array",
         slots = c(
           seed="NiftiArraySeed")
)

### - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Constructor
###

#' @importMethodsFrom DelayedArray DelayedArray
setMethod("DelayedArray", "NiftiArraySeed",
          function(seed) DelayedArray::new_DelayedArray(seed, Class="NiftiArray")
)

#' Construct NiftiArray
#'
#' @param filepath
#' @param name
#' @param header_name
#' @param type
#'
#' @return
#' @export
#' @importFrom DelayedArray DelayedArray
#' @examples
NiftiArray <- function(filepath, name = "image", header_name = "hdr", type = NA)
{
  if (is(filepath, "NiftiArraySeed")) {
    seed <- filepath
  } else {
    seed <- NiftiArraySeed(filepath, name = name,
                           header_name = header_name,
                           type = type)
  }
  DelayedArray::DelayedArray(seed)
}


