devtools::install_github("r-lib/crayon")
library(crayon)
cat(green(
  'I am a green line ' %+%
  blue$underline$bold('with a blue substring') %+%
  yellow$italic(' that becomes yellow and italicised!\n')
))
# I am a green line with a blue substring that becomes yellow and italicised!

