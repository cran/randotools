## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(randotools)

## -----------------------------------------------------------------------------
randolist(n = 20, arms = c("Trt1", "Trt2"))

## -----------------------------------------------------------------------------
r <- randolist(n = 10, 
               arms = c("Trt1", "Trt2"), 
               blocksizes = c(1,2))

## -----------------------------------------------------------------------------
randolist(n = 20, 
          arms = c("Trt1", "Trt2"),
          blocksizes = 10)

## -----------------------------------------------------------------------------
rs <- randolist(n = 10, 
                strata = list(sex = c("Male", "Female"),
                              age = c("Teen", "Adult")))

table(rs$sex)
table(rs$sex, rs$arm)

## -----------------------------------------------------------------------------
r2 <- randolist(n = 10, 
               arms = c("A", "A", "B"))

table(r2$arm)

## -----------------------------------------------------------------------------
randolist(n = 20, arms = c("Trt1", "Trt2")) |> summary()

## -----------------------------------------------------------------------------
# create a very small randomisation list for demonstration purposes
rs2 <- randolist(n = 2, blocksizes = 1,
                 arms = c("Aspirin", "Placebo"),
                 strata = list(sex = c("Male", "Female"),
                               age = c("Teen", "Adult")))

## -----------------------------------------------------------------------------
randolist_to_db(rs2, target_db = "REDCap", 
                rando_enc = data.frame(arm = c("Aspirin", "Placebo"),
                                       rand_result = c(1, 2)),
                strata_enc = list(sex = data.frame(sex = c("Male", "Female"), code = 1:2),
                                  age = data.frame(age = c("Teen", "Adult"), code = 1:2)))

## ----warning=FALSE------------------------------------------------------------
randolist_to_db(rs2, target_db = "secuTrial",
                strata_enc = list(sex = data.frame(sex = c("Male", "Female"), code = 1:2),
                                  age = data.frame(age = c("Teen", "Adult"), code = 1:2)))

