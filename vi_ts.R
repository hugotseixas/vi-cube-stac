
library(tictoc)
library(glue)
library(quarto)
library(sf)
library(tidyverse)

targets <- read_sf("data/targets.gpkg")

tic()

walk(
  .x = targets$id,
  ~ quarto_render(
    input = "vi_ts.qmd",
    output_file = glue("area_{.x}.html"),
    execute_params = list(area = {.x})
  )
)

toc()