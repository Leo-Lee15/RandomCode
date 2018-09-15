# Little R tricks
This repository records the learning of R, Python, etc.

### 当需要使用管道操作符的时候，无需直接加载`magrittr`包，直接使用下面的语句即可
```r
import::from(magrittr, `%>%`)
```
或者
```r
`%>%` <- magrittr::`%>%`
```

### 当需要使用某个包的函数，但又不至于缺乏该包无法运行的解决办法
```r
out <- if (requireNamespace("pbapply", quietly = TRUE)) {
   pbapply::pblapply(X, FUN, ...)
} else {
   lapply(X, FUN, ...)
}
```

### `dplyr`包详细教程
1. [Data Wrangling Part 1: Basic to Advanced Ways to Select Columns](https://suzan.rbind.io/2018/01/dplyr-tutorial-1/)
2. [Data Wrangling Part 2: Transforming your columns into the right shape](https://suzan.rbind.io/2018/02/dplyr-tutorial-2/)
3. [Data Wrangling Part 3: Basic and more advanced ways to filter rows](https://suzan.rbind.io/2018/02/dplyr-tutorial-3/)
4. [Data Wrangling Part 4: Summarizing and slicing your data](https://suzan.rbind.io/2018/04/dplyr-tutorial-4/)

### `tidyverse`系列编程
[Writing Custom Tidyverse Functions](http://jonthegeek.com/2018/06/04/writing-custom-tidyverse-functions/)

[A closer look at replicate() and purrr::map() for simulations](https://aosmith.rbind.io/2018/06/05/a-closer-look-at-replicate-and-purrr/)

### R语言字符串处理在线教程
[Handling Strings with R](http://www.gastonsanchez.com/r4strings/index.html)

### R语言高级编程
[Why your S3 method isn't working](https://edwinth.github.io/blog/s3-generics/)

[Non-standard evaluation, how tidy eval builds on base R](https://edwinth.github.io/blog/nse/)


-------------------

# 自己造轮子系列

### R语言实现`逻辑回归`

[Logistic Regression with R: step by step implementation part-1](http://pingax.com/logistic-regression-wirh-r-step-by-step-implementation-part-1/)

[Logistic Regression with R: step by step implementation part-2](http://pingax.com/logistic-regression-r-step-step-implementation-part-2/)

### R语言实现梯度下降算法
[CBMM Tutorial: Optimization Notes](https://cbmm.mit.edu/sites/default/files/documents/CBMM_Optimization_Notes.html#single-variable_optimization)

[Using gradient descent for linear regression in R](https://rpubs.com/fhlgood/graddescentlr)

### R语言实现一些基本算法
#### 线性回归和逻辑回归
[Create your Machine Learning library from scratch with R ! (1/5) – Linear and logistic regression](http://enhancedatascience.com/2018/01/30/your-own-machine-learning-library-from-scratch-with-r/)

#### PCA
[Create your Machine Learning library from scratch with R ! (2/5) – PCA](http://enhancedatascience.com/2018/05/15/create-machine-learning-library-r-pca/)


#### KNN
[Create your Machine Learning library from scratch with R ! (3/5) – KNN](http://enhancedatascience.com/2018/05/23/create-your-machine-learning-library-from-scratch-with-r-3-5-knn/)


-----------------------------

# 有用的博客

### 关于R语言的一些小技巧，时间序列，量化方面
[Eran Raviv](https://eranraviv.com/)

### R语言量化
[The R Trader](http://www.thertrader.com/)

### R语言机器学习干货
[Enhance datascience](http://enhancedatascience.com/)

### R语言时间序列干货
[Business-science](http://www.business-science.io/blog/index.html)

### R语言tricks
[Ryan Timpe](http://www.ryantimpe.com/#posts)

[Win-Vector Blog](http://www.win-vector.com/blog/)

[Ariel Muldoon](https://aosmith.rbind.io/)

### R语言与量化金融
[Reproducible Finance](http://www.reproduciblefinance.com/code/)

[R Views](https://rviews.rstudio.com/)

### R语言可视化
[STATWORX Blog](https://www.statworx.com/de/blog/coordinate-systems-in-ggplot2-easily-overlooked-and-rather-underrated/)

### R语言计量经济学
[Export R output to a file](http://www.brodrigues.co/blog/2015-02-22-export-r-output-to-file/)

[How does Collinearity Influence Linear Regressions?](http://www.favstats.eu/post/multicol_sim/)




