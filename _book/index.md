--- 
title: "Data Wrangling with R"
author: "Bradley Boehmke"
site: bookdown::bookdown_site
output: bookdown::gitbook
documentclass: book
bibliography: references.bib
biblio-style: apalike
link-citations: yes
github-repo: bradleyboehmke/uc-bana-7025
twitter-handle: bradleyboehmke
description: "Master the art of data wrangling with the R programming language."
---

 

# Syllabus {-}

<div class="note">
<p>TBD</p>
</div>

Welcome to _Data Wrangling with R_! This course provides an intensive, hands-on introduction to Data Wrangling with the R programming language. You will learn the fundamental skills required to acquire, munge, transform, manipulate, and visualize data in a computing environment that fosters reproducibility.

Data wrangling, which is also commonly referred to as data munging, transformation, manipulation, janitor work, etc. can be a painstakingly laborious process. In fact, it has been stated that up to 80% of data analysis is spent on the process of cleaning and preparing data [@tidy-data; @dasu2003exploratory]. However, being a prerequisite to the rest of the data analysis workflow (visualization, modeling, reporting), it's essential that you become fluent *and* efficient in data wrangling techniques.

## Learning Objectives {-}

This course will guide you through the data wrangling process along with give you a solid foundation of the basics of working with data in R. My goal is to teach you how to easily wrangle your data so you can spend more time focused on understanding the content of your data via visualization, modeling, and reporting your results. Upon successfully completing this course, you will be able to:

* Perform your data analysis in a literate programming environment
* Manage different types of data
* Manage different data structures
* Import and export data
* Index, subset, reshape and transform your data
* Compute descriptive statistics
* Visualize data
* Make your code efficient by using control statements & iteration
* Write your own functions

...all with R!

## Is This Course for Me? {-}

This book is meant to establish the baseline R vocabulary and knowledge for the primary data wrangling processes.  This captures a wide range of programming activities which covers the full spectrum from understanding basic data objects in R to writing your own functions, applying loops, and webscraping.  As a result, this book can be beneficial to all levels of R programmers.  Beginner R programmers will gain a basic understanding of the functionality of R along with learning how to work with data using R.  Intermediate and/or advanced R programmers will likely find the early chapters reiterating established knowledge; however, these programmers will benefit from the mid and later chapters by learning newer and/or more efficient data wrangling techniques.  


## Prework {-}

Obviously to gain and retain knowledge from this book it is highly recommended that you follow along and practice the code examples yourself.  Furthermore, this book assumes that you will actually be performing data wrangling in R; therefore, it is assumed that you have or plan to have R installed on your computer. You will find the latest version of R for Linux, Mac OS, and Windows at [cran.r-project.org/](https://cran.r-project.org/).  It is also recommended that you use an integrated development environment (IDE) as it will simplify and organize your coding environment greatly.  There are several to choose from; however, I highly recommend [RStudio](https://www.rstudio.com/).

## Schedule {-}

| Module        | Description                                         |
|:-------------:|:----------------------------------------------------|
| **1**         | **Introduction**                                    |
|               | Intro to data wrangling, R, and this course         |
|               | Base R & the Rstudio IDE                            |
| **2**         | **Reproducible Documents and Importing Data**       |
|               | Managing your workflow and reproducibility          |
|               | Importing data and understanding the basics of it   |
| **3**         | **Tidy Data and Data Manipulation**                 |
|               | Tidying & preparing data for analysis               |
|               | Data manipulation                                   |
| **4**         | **Relational Data and More Tidyverse Packages**     |
|               | Relational data                                     |
|               | Leveraging the Tidyverse to simplify data wrangling |
| **5**         | **Data Visualization & Exploration**                |
|               | Data visualization                                  |
|               | Exploratory data analysis                           |
| **6**         | **Creating Efficient Code in R**                    |
|               | Control statements & iteration                      |
|               | Writing functions                                   |
| **7**         | **Introduction to Applied Modeling**                |
|               | Correlation & pattern discovery                     |
|               | Introduction to machine learning                    |

## Conventions used in this book {-}

The following typographical conventions are used in this book:

* ___strong italic___: indicates new terms,
* __bold__: indicates package & file names,
* `inline code`: monospaced highlighted text indicates functions or other commands that could be typed literally by the user,
* code chunk: indicates commands or other text that could be typed literally by the user


```r
1 + 2
## [1] 3
```

In addition to the general text used throughout, you will notice the following code chunks with images:

<div class="tip">
<p>Signifies a tip or suggestion</p>
</div>

<div class="note">
<p>Signifies a general note</p>
</div>

<div class="warning">
<p>Signifies a warning or caution</p>
</div>

## Feedback {-}

Reader comments are greatly appreciated. To report errors or bugs please post an issue at https://github.com/bradleyboehmke/dw-r/issues.

## Acknowledgments {-} 

I'd like to thank everyone who contributed feedback, typo corrections, and discussions while the book was being written. TBD.

## Software information {-} 

This book was built with the following packages and R version.  All code was executed on 2017 MacBook Pro with a 2.9 GHz Intel Core i7 processor, 16 GB of memory, 2133 MHz speed, and double data rate synchronous dynamic random access memory (DDR3). 


```r
# packages used
pkgs <- c(
  "completejourney",
  "tidyverse"
)

# package & session info
sessioninfo::session_info(pkgs)
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value
#>  version  R version 4.1.3 (2022-03-10)
#>  os       macOS Big Sur/Monterey 10.16
#>  system   x86_64, darwin17.0
#>  ui       X11
#>  language (EN)
#>  collate  en_US.UTF-8
#>  ctype    en_US.UTF-8
#>  tz       America/New_York
#>  date     2022-04-20
#>  pandoc   2.17.1.1 @ /Users/b294776/Desktop/RStudio.app/Contents/MacOS/quarto/bin/ (via rmarkdown)
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  ! package         * version date (UTC) lib source
#>    askpass           1.1     2019-01-13 [1] CRAN (R 4.1.0)
#>    assertthat        0.2.1   2019-03-21 [1] CRAN (R 4.1.0)
#>    backports         1.4.1   2021-12-13 [1] CRAN (R 4.1.0)
#>    base64enc         0.1-3   2015-07-28 [1] CRAN (R 4.1.0)
#>    bit               4.0.4   2020-08-04 [1] CRAN (R 4.1.0)
#>    bit64             4.0.5   2020-08-30 [1] CRAN (R 4.1.0)
#>    blob              1.2.2   2021-07-23 [1] CRAN (R 4.1.0)
#>    broom             0.7.12  2022-01-28 [1] CRAN (R 4.1.2)
#>    bslib             0.3.1   2021-10-06 [1] CRAN (R 4.1.0)
#>    callr             3.7.0   2021-04-20 [1] CRAN (R 4.1.0)
#>    cellranger        1.1.0   2016-07-27 [1] CRAN (R 4.1.0)
#>    cli               3.2.0   2022-02-14 [1] CRAN (R 4.1.2)
#>    clipr             0.8.0   2022-02-22 [1] CRAN (R 4.1.2)
#>    colorspace        2.0-3   2022-02-21 [1] CRAN (R 4.1.2)
#>  R completejourney   <NA>    <NA>       [?] <NA>
#>    cpp11             0.4.2   2021-11-30 [1] CRAN (R 4.1.0)
#>    crayon            1.5.1   2022-03-26 [1] CRAN (R 4.1.2)
#>    curl              4.3.2   2021-06-23 [1] CRAN (R 4.1.0)
#>    data.table        1.14.2  2021-09-27 [1] CRAN (R 4.1.0)
#>    DBI               1.1.2   2021-12-20 [1] CRAN (R 4.1.0)
#>    dbplyr            2.1.1   2021-04-06 [1] CRAN (R 4.1.0)
#>    digest            0.6.29  2021-12-01 [1] CRAN (R 4.1.0)
#>    dplyr             1.0.8   2022-02-08 [1] CRAN (R 4.1.2)
#>    dtplyr            1.2.1   2022-01-19 [1] CRAN (R 4.1.2)
#>    ellipsis          0.3.2   2021-04-29 [1] CRAN (R 4.1.0)
#>    evaluate          0.15    2022-02-18 [1] CRAN (R 4.1.2)
#>    fansi             1.0.3   2022-03-24 [1] CRAN (R 4.1.2)
#>    farver            2.1.0   2021-02-28 [1] CRAN (R 4.1.0)
#>    fastmap           1.1.0   2021-01-25 [1] CRAN (R 4.1.0)
#>    forcats           0.5.1   2021-01-27 [1] CRAN (R 4.1.0)
#>    fs                1.5.2   2021-12-08 [1] CRAN (R 4.1.0)
#>    gargle            1.2.0   2021-07-02 [1] CRAN (R 4.1.0)
#>    generics          0.1.2   2022-01-31 [1] CRAN (R 4.1.2)
#>    ggplot2           3.3.5   2021-06-25 [1] CRAN (R 4.1.0)
#>    glue              1.6.2   2022-02-24 [1] CRAN (R 4.1.2)
#>    googledrive       2.0.0   2021-07-08 [1] CRAN (R 4.1.0)
#>    googlesheets4     1.0.0   2021-07-21 [1] CRAN (R 4.1.0)
#>    gtable            0.3.0   2019-03-25 [1] CRAN (R 4.1.0)
#>    haven             2.4.3   2021-08-04 [1] CRAN (R 4.1.0)
#>    highr             0.9     2021-04-16 [1] CRAN (R 4.1.0)
#>    hms               1.1.1   2021-09-26 [1] CRAN (R 4.1.0)
#>    htmltools         0.5.2   2021-08-25 [1] CRAN (R 4.1.0)
#>    httr              1.4.2   2020-07-20 [1] CRAN (R 4.1.0)
#>    ids               1.0.1   2017-05-31 [1] CRAN (R 4.1.0)
#>    isoband           0.2.5   2021-07-13 [1] CRAN (R 4.1.0)
#>    jquerylib         0.1.4   2021-04-26 [1] CRAN (R 4.1.0)
#>    jsonlite          1.8.0   2022-02-22 [1] CRAN (R 4.1.2)
#>    knitr             1.38    2022-03-25 [1] CRAN (R 4.1.2)
#>    labeling          0.4.2   2020-10-20 [1] CRAN (R 4.1.0)
#>    lattice           0.20-45 2021-09-22 [1] CRAN (R 4.1.3)
#>    lifecycle         1.0.1   2021-09-24 [1] CRAN (R 4.1.0)
#>    lubridate         1.8.0   2021-10-07 [1] CRAN (R 4.1.0)
#>    magrittr          2.0.3   2022-03-30 [1] CRAN (R 4.1.2)
#>    MASS              7.3-55  2022-01-16 [1] CRAN (R 4.1.3)
#>    Matrix            1.4-0   2021-12-08 [1] CRAN (R 4.1.3)
#>    mgcv              1.8-39  2022-02-24 [1] CRAN (R 4.1.3)
#>    mime              0.12    2021-09-28 [1] CRAN (R 4.1.0)
#>    modelr            0.1.8   2020-05-19 [1] CRAN (R 4.1.0)
#>    munsell           0.5.0   2018-06-12 [1] CRAN (R 4.1.0)
#>    nlme              3.1-155 2022-01-16 [1] CRAN (R 4.1.3)
#>    openssl           2.0.0   2022-03-02 [1] CRAN (R 4.1.2)
#>    pillar            1.7.0   2022-02-01 [1] CRAN (R 4.1.2)
#>    pkgconfig         2.0.3   2019-09-22 [1] CRAN (R 4.1.0)
#>    prettyunits       1.1.1   2020-01-24 [1] CRAN (R 4.1.0)
#>    processx          3.5.3   2022-03-25 [1] CRAN (R 4.1.2)
#>    progress          1.2.2   2019-05-16 [1] CRAN (R 4.1.0)
#>    ps                1.6.0   2021-02-28 [1] CRAN (R 4.1.0)
#>    purrr             0.3.4   2020-04-17 [1] CRAN (R 4.1.0)
#>    R6                2.5.1   2021-08-19 [1] CRAN (R 4.1.0)
#>    rappdirs          0.3.3   2021-01-31 [1] CRAN (R 4.1.0)
#>    RColorBrewer      1.1-3   2022-04-03 [1] CRAN (R 4.1.2)
#>    readr             2.1.2   2022-01-30 [1] CRAN (R 4.1.2)
#>    readxl            1.4.0   2022-03-28 [1] CRAN (R 4.1.2)
#>    rematch           1.0.1   2016-04-21 [1] CRAN (R 4.1.0)
#>    rematch2          2.1.2   2020-05-01 [1] CRAN (R 4.1.0)
#>    reprex            2.0.1   2021-08-05 [1] CRAN (R 4.1.0)
#>    rlang             1.0.2   2022-03-04 [1] CRAN (R 4.1.2)
#>    rmarkdown         2.13    2022-03-10 [1] CRAN (R 4.1.3)
#>    rstudioapi        0.13    2020-11-12 [1] CRAN (R 4.1.0)
#>    rvest             1.0.2   2021-10-16 [1] CRAN (R 4.1.0)
#>    sass              0.4.1   2022-03-23 [1] CRAN (R 4.1.2)
#>    scales            1.1.1   2020-05-11 [1] CRAN (R 4.1.0)
#>    selectr           0.4-2   2019-11-20 [1] CRAN (R 4.1.0)
#>    stringi           1.7.6   2021-11-29 [1] CRAN (R 4.1.0)
#>    stringr           1.4.0   2019-02-10 [1] CRAN (R 4.1.0)
#>    sys               3.4     2020-07-23 [1] CRAN (R 4.1.0)
#>    tibble            3.1.6   2021-11-07 [1] CRAN (R 4.1.0)
#>    tidyr             1.2.0   2022-02-01 [1] CRAN (R 4.1.2)
#>    tidyselect        1.1.2   2022-02-21 [1] CRAN (R 4.1.2)
#>    tidyverse         1.3.1   2021-04-15 [1] CRAN (R 4.1.0)
#>    tinytex           0.38    2022-03-29 [1] CRAN (R 4.1.2)
#>    tzdb              0.3.0   2022-03-28 [1] CRAN (R 4.1.2)
#>    utf8              1.2.2   2021-07-24 [1] CRAN (R 4.1.0)
#>    uuid              1.0-4   2022-03-16 [1] CRAN (R 4.1.2)
#>    vctrs             0.4.0   2022-03-30 [1] CRAN (R 4.1.2)
#>    viridisLite       0.4.0   2021-04-13 [1] CRAN (R 4.1.0)
#>    vroom             1.5.7   2021-11-30 [1] CRAN (R 4.1.0)
#>    withr             2.5.0   2022-03-03 [1] CRAN (R 4.1.2)
#>    xfun              0.30    2022-03-02 [1] CRAN (R 4.1.2)
#>    xml2              1.3.3   2021-11-30 [1] CRAN (R 4.1.0)
#>    yaml              2.3.5   2022-02-21 [1] CRAN (R 4.1.2)
#> 
#>  [1] /Library/Frameworks/R.framework/Versions/4.1/Resources/library
#> 
#>  R ── Package was removed from disk.
#> 
#> ──────────────────────────────────────────────────────────────────────────────
```



