library(fstplyr)
path <- tempfile()
dir.create(path)
fst::write_fst(iris, file.path(path, "iris.fst"))
fst::write_fst(mtcars, file.path(path, "mtcars.fst"))
# usage of the file.path() function
file.path("C:/Users/Lenovo/Documents", "mtcars.xlsx") 
# results: "C:/Users/Lenovo/Documents/mtcars.xlsx"

# create a big tibble, about 2GB
big_df <- tibble::tibble(id = 1:10e7, 
                         name = sample(letters, size = 10e7, replace = TRUE), 
                         value = round(rnorm(10e7), 4))
# write the big_df as a .fst file, super fast
fst::write_fst(big_df, file.path(path, "big_df.fst"))
list.files(path = path)
# use the dplyr interface, super fast when tbl() and select()
src <- fstplyr::src_fst(path = path)
src
str(src)
tbl(src, "big_df") %>% 
  select(id, name)