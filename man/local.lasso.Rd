% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/local.lasso.R
\name{local.lasso}
\alias{local.lasso}
\title{Local Lasso function}
\usage{
local.lasso(data, response, k, eps = 1, ndata = 10, nrand = 1000)
}
\arguments{
\item{data}{A data frame containing the response variable and covariates.}

\item{response}{The name of response variable.}

\item{k}{The number of nearest neighbors.}

\item{eps}{The relative error of ANN's search. The default is set to eps = 1}

\item{ndata}{number of database}

\item{nrand}{number of generated random points}
}
\value{
local.lasso object containing table of global relevence and KS statistic.
}
\description{
Local Lasso function
}
\details{
Divide randomly original data into a distributed database with \code{ndata} (default = 10) databases.
For each one of the \code{nrand} (default = 1000) random points generated,
the \code{k} Approximated nearest neighbors (ANN) are located in the distributed database.
A Local Kernel Weighted Linear Regression with LASSO penalty is then fitted to each random points.
(Formula)
The method uses local bandwidth such that each local model is fitted only with the k-ANN observations of each random points.
The value of lambda is selected with cross-validation.
}
\examples{

library(locallasso)
set.seed(1993)

# # - - - - - - - - - - - - - - -#
# # Numerical Example
# # - - - - - - - - - - - - - - -#

# Define the data generating process
n=1000000   # number of observations
nc=20       # number of continuous variables

# Continous variables
X = mvrnorm(n,rep(0,nc),diag(1,nc))

# Categorical variables
D1 = factor(as.numeric(runif(n)<=.5))
D2 = factor(as.numeric(runif(n)<=.3))
F1 = factor(sample(LETTERS[1:4], n, replace=TRUE, prob=c(0.3, 0.3, 0.3, 0.1)))

# Response variable
y <- -X[,1]^2 - 4*sin((pi/2)*X[,2]) + X[,3]*X[,4] + rnorm(n,0,1)

data = data.frame(D1,X,y,D2,F1)

# Apply local lasso method to the data frame
ll = local.lasso(data,"y", k=500, nrand=100)

ll.summary(ll)
}
