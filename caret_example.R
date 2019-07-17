library(MASS)
data(Boston)

install.packages("tensorflow")
install.packages("keras")

tensorflow::install_tensorflow()
keras::install_keras()

library(tensorflow)
library(keras)

install.packages("caret")
library(caret)

caret_control <- trainControl(method = "repeatedcv",
                           number = 5,
                           repeats = 5)

caret_grid <- expand.grid(batch_size=seq(60,120,20),
                          dropout=0.5,
                          size=100,
                          lr=2e-6,
                          rho=.9,
                          decay=0,
                          activation = "relu")

caret_t <- train(medv ~ ., data = Boston, 
                 method = "mlpKerasDropout", 
                 trControl = caret_control, 
                 tuneGrid = caret_grid,
                 verbose = FALSE)

?repeatedcv