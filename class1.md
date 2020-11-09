# Class 1: Tidyverse and EDA

## Objectives

* Understand the principles behind the tidyverse
* Import a simple dataset and explore different qualitative and quantitative aspects of the data
* Perform simple cleaning and visualization with single variables using the [Tidyverse](https://www.tidyverse.org/)
* Prepare the data for further analysis by engineering new features (columns) from existing numeric and categorical features

## Outline

**Course intro**

- Welcome to Machine Learning with R
- Things you should be familiar with
  - Machine learning concepts
    - link to concepts course materials
  - Introduction to R
    - link to intro R course materials
  
Course learning objectives:

1.
2.
3.

**Class 1 intro**  

Class 1 covers:

1. Course introduction
2. Overview of tidyverse for EDA
3. Overview of tidymodels for modeling
4. Dive into a quick visualization/model

>KEY TAKEAWAYS: Develop an undestanding of the benefits of the tidyverse and how tidymodels fits in, Demonstrate how to explore a dataset and set up a linear model

**Introduce dataset for class 1**
>FIXME: Need to decide on datasets

**Exploratory Data Anlysis (EDA) with the Tidyverse**

- `Tidyverse` is a meta package:
  - They are a single package that installs many different packages in one command
  - Modular: each package addresses a step in the data science modeling process

- Tidy tools are created specifically to support the human data analyst**
  - Focus on human centered design
    - Consistancy is key to this - focus on making data structures and APIs consistant across packages
      - API defines the external interface regardless of the internal workings
    - Value consistancy over performance
      - That means that other packages may run a little faster
    - ideal for human analyst not necissarily software development
    
>For a primer on tidyverse check out [Tidy Modeling with R, Chapter 2: A Tidyverse Primer](https://www.tmwr.org/tidyverse.html)
    
- We will use functions from
  - ggplot2: for viz
  - dplyr, tidyr: for manipulation

**What is Tidymodels?**
>Note: Want to emphasize the major principles behind tidymodels and how it fits into tidyverse. Each package has a specific usage and together they create a cohesive ecosystem of packages that play together easily and intentionaly. 
 
- `Tidymodels`
    - rsample: data splitting and resampling
    - parsnip: tidy interface to models that can be used to try a range of models without having to learn each specific packages details.
    - recipes: tidy interface to data preprocessing tools for feature engineering
    - workflows: a package used to bundle pre-processing, modeling and post-processing all together
    - tune: optimize the hyperparameters of your model and pre-processing steps
    - yardstick: measure the effectiveness of models using performance metrics
    - broom: convert the information in common statistical R objects into user-friendly predictable formats
    - dials: create and manage tuning parameters and parameter grids
    
- We'll predominately use rsample, parsnip, recpies, workflows and yardstick for this intro course

**`Parsnip` standardizes the interface for fitting models**
>Note I think it's important to stress that parsnip is an interface to other modeling 'engines'

|Function      |Package      |Code                                       |
|:-------------|:------------|:------------------------------------------|
|`glm`         |`stats`      |`predict(obj, type = "response")`          |
|`lda`         |`MASS`       |`predict(obj)`                             |
|`gbm`         |`gbm`        |`predict(obj, type = "response", n.trees)` |
|`mda`         |`mda`        |`predict(obj, type = "posterior")`         |
|`rpart`       |`rpart`      |`predict(obj, type = "prob")`              |
|`Weka`        |`RWeka`      |`predict(obj, type = "probability")`       |
|`logitboost`  |`LogitBoost` |`predict(obj, type = "raw", nIter)`        |
|`pamr.train`  |`pamr`       |`pamr.predict(obj, type = "posterior")`    |

_table content from [this](https://www.tidyverse.org/blog/2018/11/parsnip-0-0-1/) blog post by parsnip's creator, Max Kuhn_

- These are all functions and R packages to do machine learning
- They each have their own `predict()` function with different parameters, syntax, and defaults.
  - These packages also do not take a standard data format
- An analyst hoping to try a few different ML algorithms would have to reformat their data, learn new syntax/parameters with each new package.
- Parsnip provides a singular, consistant interface for these packages

>For more indepth information on `parsnip` check out [Tidy Modeling with R, Chapter 7: Fitting Models with Parsnip](https://www.tmwr.org/models.html)

## Resources

- https://joss.theoj.org/papers/10.21105/joss.01686.pdf
- https://design.tidyverse.org
- https://www.tmwr.org/base-r.html
