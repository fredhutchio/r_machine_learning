# Class 1: Tidyverse and EDA

## Objectives

* Understand the principles behind the tidyverse
* Import a simple dataset and explore different qualitative and quantitative aspects of the data
* Perform simple cleaning and visualization with single variables using the [Tidyverse](https://www.tidyverse.org/)
* Prepare the data for further analysis by engineering new features (columns) from existing numeric and categorical features

## Data Set

- Glaucoma
- This dataset has already been cleaned, subsetted. Walk through what the researchers did, look at summary statistics, and do some visualization 

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
>For more information on design principles behind tidyverse check out the [Tidyverse Design Guide](https://design.tidyverse.org)
    
- We will use functions from
  - ggplot2: for viz
  - dplyr, tidyr: for manipulation

**Lets build a model!**
>Notes: Emphasize EDA as a step in model building, we will iteratively add more compelxity throughout this course including splitting data, bootstrapping, preprocessing with recipes, utilizing workflow objects, etc but class1 will demonstrate a very simplistic application of ML and usage of tidymodels

**The first step is exploring / visualizing the data**
  - ideally we will have munged the data a bit in class 1. This should be a very quick demonstration with easy to identify application.
    - Ex. JS quickly plots mpg distribution

**A simple linear model using base R**
  - Before diving into more complex models lets do a really simple linear model using base R `lm()`
  - Really set the scene
    - Look at the dataset. Specify column that we want to predict.
    - Look at the dataset again what columns won't be useful to predict this
      - Ex. JS removes the model and model index (unique identifiers for certain car models). Another ex would be removing patient ID
    - Explain the formula 
      - mpg is the predicted value explained by all predictors ( `mpg ~ .`)

```
Code: run lm() 
```

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
  - Added benefit of working with `recipe` and `workflow` to easily create workflows that capture preprocessing, modeling, and post processing.
 
>For more indepth information on `parsnip` check out [Tidy Modeling with R, Chapter 7: Fitting Models with Parsnip](https://www.tmwr.org/models.html)

**Training and testing**
  - We don't _need_ to do this for linear model but we will anyway (good practice)
  - use `rsample`
    - 80/20 split training/testing
    - balancing the split
  - build with training data
  - choose with validation data or resampled data
- evaluate with testing data

```
Code: split the data
```

**Using tidymodels to train a model**
> Ripped from chp one of JS machine learning with tidy models tutorial

In tidymodels, you specify models using three concepts.

- _Model type_ differentiates models such as logistic regression, decision tree models, and so forth.
- _Model mode_ includes common options like regression and classification; some model types support either of these while some only have one mode. (Notice in the example on this slide that we didn't need to set the mode for linear_reg() because it only does regression.)
- _Model engine_ is the computational tool which will be used to fit the model. Often these are R packages, such as "lm" for OLS or the different implementations of random forest models.

```
Code: Specify a linear model and a random forest model
```

After a model has been specified you can fit it
  - typically using a symbolic description of the model (a formula) and some data. 
  - SG example fits models with data = car_train [This means we're saying, "Just fit the model one time, on the whole training set"]
  - Once you have fit your model, you can evaluate how well the model is performing.

```
Code: Fit the linear model and random forest model
```

**Evaluate your models**
- root mean squared error metric
- use the yardstick package

>Note: In JS course she has them evaluate with training and testing data to show the difference in output (evaluating on training data will always be more optimistic)

**Resampling**
- Why resample?: "The idea of resampling is to create simulated data sets that can be used to estimate the performance of your model, say, because you want to compare models. You can create these resampled data sets instead of using either your training set (which can give overly optimistic results, especially for powerful ML algorithms) or your testing set (which is extremely valuable and can only be used once or at most twice)."

 ```
 Code:
 1. Create bootstrap resamples using rsample::bootstraps()
 2. Evaluate linear model and random forests with bootstrap resamples
 ```
 
 **Visualize model results**
 - Use `tune::collect_predictions()`
 - Plot predicted vs truth in  `ggplot`

## Resources

- https://joss.theoj.org/papers/10.21105/joss.01686.pdf
- https://design.tidyverse.org
- https://www.tmwr.org/base-r.html
