---
title       : Fuel Consumption Prediction
subtitle    : Developing Data Product Course Project
author      : Kevin Kuo
job         : Freelancer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap] # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## About The Application

This application try to predict the fuel consumption based on the three factors:   

1. 1/4 mile time
2. weight
3. transmission type.  

The prediction model is derived from the Motor Trend Car Road Tests dataset that 
was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).

---  

## Usage

The usage is simple. Just select 1/4 mile time, weight and transmission type then
press Calculate button. The prediction result will be shown on the right-hand side.

Note: The dataset acquired to make the prediction model is somewhat old(1973-74). So,
if you compare the calculated mpg result to the contemporary car's , you will find the latter is much better.

---

## The Model

We use the mtcars dataset to fit the model by there factors(wt, qsec, and am)

```r
data("mtcars")
fit <- lm(mpg ~ wt + qsec + am, data = mtcars)
```

then, predict the result with the fitted model

```r
predict(fit, list(qsec=20, wt=2, am=0))
```

```
##        1 
## 26.30249
```


---

## Others

The application is a shiny application. The source code can be found in the following
Github URL.

https://github.com/kvnkuo/devdataprod-032_courseproject/tree/master/app

Also, this presentation is deployed at the following location

https://github.com/kvnkuo/devdataprod-032_courseproject/tree/gh-pages





