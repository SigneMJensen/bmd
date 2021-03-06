\name{bmd}
\alias{bmd}
\title{
Benchmark dose estimation
}
\description{Estimation of benchmark doses and benchmark dose lower limit from dose response model fits 
}
\usage{
bmd(object, bmr, backg = 0, def = c("excess", "additional", "relative", "hybrid"), 
interval = c("delta"), ma = FALSE, maList = NULL, display = FALSE)
}
\arguments{
  \item{object}{object of class \code{drc}}
  \item{bmr}{numeric vector of bench mark response levels for which to calculate benchmark doses (should be between 0 and 1)}
  \item{backg}{numeric value specifying the background level (defaults to 0)}
  \item{def}{character string specifiying the definition of the benchmark dose to use in the calculations. "excess" and "additional" are for binomial
  response whereas "relative" and "hybrid" (additive hybrid) are for continuous response}
  \item{interval}{character string specifying the type of confidence interval to use}
  \item{ma}{logical value switching on/off model averaging using a default list of model functions}
  \item{maList}{list of model functions to include in the model averaging}
  \item{display}{logical. If TRUE results are displayed; otherwise they are not}
}
}
\details{
This package project just started and is still under development. The aim to provide an R package 
  calculating the benchmark dose (BMD) and the lower limit of the corresponding 95\% confidence interval (BMDL)
  for continuous and quantal dose-response data for a range of dose-response model based on the available
  definitions of the benchmark dose concepts.
  
  Details on the implemented definitions and methods can be found in Crump (2002)
}
\value{
A matrix with two column, one containing BMD and the other containing BMDL.
}
\references{
  Budtz-Jorgensen, E., Keiding, N., and Grandjean, P. (2001) 
  Benchmark Dose Calculation from Epidemiological Data,
  \emph{Biometrics} \bold{57}, 698--706.  

  Crump, K. (2002)
  Critical Issues in Benchmark Calculations from Continuous Data,
  \emph{Critical Reviews in Toxicology} \bold{32}, 133--153.
}

\author{ Signe M. Jensen
}
\note{
}

\seealso{
}
\examples{
## Fitting log-logistic two-parameter model to binomial data
deguelin.m1 <- drm(r/n~dose, weights=n, data=deguelin, fct=LL.2(), type="binomial")

## Estimated EC values for comparison
ED(deguelin.m1, c(5, 10, 50), interval = "delta")

## Excess risk with BMR=5% and background 0
bmd(deguelin.m1, 0.05)

## Additional risk BMR=5% and with background 0
bmd(deguelin.m1, 0.05, def = "additional")

## Excess risk with BMR=5% and known background
bmd(deguelin.m1, 0.05, backg = 0.05)

## Additional risk with BMR=5% and known background
## similar but not identical to excess risk
bmd(deguelin.m1, 0.05, backg = 0.05, def = "additional", display = TRUE)

## Benchmark doses for a continuous response
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

## Standard single-model BMD using relative values (background level cannot be incorporated)
bmd(ryegrass.m1, 0.05, def = "relative", display = TRUE)

## Standard single-model BMD using the hybrid method (background level can be incorporated)
bmd(ryegrass.m1, 0.05, backg = 0.05, def = "hybrid", display = TRUE)

}
