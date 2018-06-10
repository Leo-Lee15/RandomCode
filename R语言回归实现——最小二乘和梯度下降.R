
##%###########################################################%##
#                                                               #
#                                                               #
####   R语言实现线性回归的最小二乘算法和梯度下降算法         ####
#                                                               #                        
#                                                               #
##%###########################################################%##


## 展示数据集
data("mtcars")
mtcars

dat <- mtcars[, 1:4]
rownames(dat) <- NULL
dat

## 首先通过`lm`函数建立线性回归模型
# 无截距项
r_lm_mod_no_cons <- lm(mpg ~ cyl + disp + hp - 1, data = dat)
r_lm_mod_no_cons
# 有截距项
r_lm_mod <- lm(mpg ~ cyl + disp + hp, data = dat)
r_lm_mod


##%######################################################%##
#                                                          #
####                  最小二乘求解                      ####
#                                                          #
##%######################################################%##
## 无截距项，beta = (beta1, beta2, beta3)
dat_x <- dat[, c("cyl", "disp", "hp")]
dat_x_mat <- as.matrix(dat_x)
dat_y_vec <- dat$mpg

# 假定要求解的参数向量为 beta
beta_no_cons <- solve(t(dat_x_mat) %*% dat_x_mat) %*% t(dat_x_mat) %*%  dat_y_vec
beta_no_cons
r_lm_mod_no_cons$coefficients

## 有截距项，beta = (cons, beta1, beta2, beta3)
dat_x <- dat[, c("cyl", "disp", "hp")]
dat_x2 <- cbind(cons = 1, dat_x)
dat_x_mat <- as.matrix(dat_x2)
dat_y_vec <- dat$mpg

# 假定要求解的参数向量为 beta
beta <- solve(t(dat_x_mat) %*% dat_x_mat) %*% t(dat_x_mat) %*%  dat_y_vec
beta
r_lm_mod$coefficients


##%######################################################%##
#                                                          #
####                  梯度下降求解                      ####
#                                                          #
##%######################################################%##
# 有截距项：beta = (cons, beta1, beta2, beta3)
# beta = beta - alpha * (beta * X - Y)
# alpha为学习速率，取值为(0, 1)，X为解释变量，Y为被解释变量

dat_x <- dat[, c("cyl", "disp", "hp")]
dat_x2 <- cbind(cons = 1, dat_x)
dat_x_mat <- as.matrix(dat_x2)
dat_y <- matrix(dat$mpg, ncol = 1)
dat_y
m <- nrow(dat_y)

# 设定系数向量的初始值
beta <- matrix(c(0, 0, 0, 0), ncol = 1)
# 初始化学习速率alpha的值为0.1
alpha <- 0.1
# 由于每次迭代需要更新beta，因此设定中间变量temp
temp <- beta


grad_desc <- function(x, y, learn_rate, conv_thresh, max_iter = 1000) {
  stopifnot(is.matrix(x), is.matrix(y), is.numeric(x), is.numeric(y))
  
  # Y = X * beta + epsilon
  # Y: n * 1
  # X: n * (p + 1)
  # beta: (p + 1) * 1
  # epsilon: n * 1
  
  # 观测值的个数
  n <- nrow(y)
  # 解释变量的个数，包括截距项cons
  p1 <- ncol(x) + 1
  # 初始化系数向量`beta`
  beta_new <- beta <- matrix(rep(0, p1), ncol = 1)
  # 解释变量构成的矩阵
  x_mat <- as.matrix(cbind(1, x))
  # 计算Y的拟合值
  y_hat <- x %*% beta 
  # 均方误差
  mse <- sum((y - y_hat) ^ 2) / n
  
  is_converge <- FALSE
  iter <- 0
  while (isFALSE(is_converge)) {
    # 实施梯度下降算法
    beta_new <- beta - learn_rate * (sum((y_hat - y) %*% x))
    beta <- beta_new
    y_hat <- x %*% beta
    mse_new <- sum((y - y_hat) ^ 2) / n
    if (mse -mse_new <= conv_thresh) {
      is_converge <- TRUE
      return(beta)
    }
    iter <- iter + 1
    if (iter > max_iter) {
      is_converge <- FALSE
      stop("The number of iterations exceed the max interations.")
    }
  }
}
grad_desc(x = x_mat[, -1], y = dat_y, learn_rate = 0.1, conv_thresh = 1e-6)





grad_desc <- function(y, X, epsilon = 0.0001, eta, iters) {
  
  stopifnot(is.matrix(x), is.matrix(y), is.numeric(x), is.numeric(y))
  
  # Y = X * beta + epsilon
  # Y: n * 1
  # X: n * (p + 1)
  # beta: (p + 1) * 1
  # epsilon: n * 1
  
  # 学习速率
  epsilon <- 0.0001
  # 解释变量
  X <- as.matrix(cbind(cons = 1, X))
  # X <- as.matrix(data.frame(rep(1, length(y)), X))
  # 观测值个数
  N <- nrow(X)
  cat("Initialize parameters...\n")
  
  # 系数初始化， beta: (p + 1) * 1
  beta_init <- as.matrix(rnorm(n = ncol(X), mean = 0, sd = 1)) # Initialize beta
  beta_init <- t(beta_init)
  
  # 回归的残差项
  e <- t(y) - beta_init %*% t(X)
  
  # 初始化梯度
  grad_init <- -(2 / N) %*% (e) %*% X
  
  # 梯度下降
  beta <- beta_init - eta * (1 / N) * grad_init
  l2loss <- c()
  
  for (i in 1:iters) {
    l2loss <- c(l2loss, sqrt(sum((t(y) - beta %*% t(X))^2)))
    e <- t(y) - beta %*% t(X)
    grad <- -(2 / N) %*% e %*% X
    beta <- beta - eta * (2 / N) * grad
    if (sqrt(sum(grad ^ 2)) <= epsilon) {
      break
    }
  }
  print("Algorithm converged")
  print(paste("Final gradient norm is", sqrt(sum(grad^2))))
  values <- list(coef = t(beta), l2loss = l2loss)
  return(values)
}
y = rnorm(n = 10000, mean = 0, sd = 1)
x1 = rnorm(n = 10000, mean = 0, sd = 1)
x2 = rnorm(n = 10000, mean = 0, sd = 1)
x3 = rnorm(n = 10000, mean = 0, sd = 1)
x4 = rnorm(n = 10000, mean = 0, sd = 1)
x5 = rnorm(n = 10000, mean = 0, sd = 1)

ptm <- proc.time()
gdec.eta1 <- grad_desc(y = y, X = cbind(x1, x2, x3, x4), eta = 100, iters = 1000)






