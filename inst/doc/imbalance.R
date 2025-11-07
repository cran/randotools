## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(randotools)

## -----------------------------------------------------------------------------
data(rando_balance)
summary(rando_balance)

## -----------------------------------------------------------------------------
table(rando_balance$rando_res)
table(rando_balance$rando_res2)

## ----echo=FALSE---------------------------------------------------------------
set.seed(134)

## ----fig.width=7, message=FALSE-----------------------------------------------
library(patchwork)
imbalance_seq_plots(rando_balance, 
                    randovar = "rando_res") |> 
  wrap_plots(ncol = 2)

## ----fig.width=7, fig.height=9, message=FALSE---------------------------------
imbalance_seq_plots(rando_balance, 
                    randovar = "rando_res",
                    stratavars = c("strat1", "strat2")) |> 
  wrap_plots(ncol = 2)

## ----message=FALSE------------------------------------------------------------
imb <- imbalance_test(rando_balance, 
                      randovar = "rando_res2",
                      stratavars = c("strat1", "strat2"))
imb

## ----fig.height=9, fig.width = 4----------------------------------------------
imbalance_test_plot(imb)

