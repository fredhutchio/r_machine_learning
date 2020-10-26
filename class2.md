# Class 2: Regression

## Objectives
* Explain when to use regression vs classification
* Set-up, fit, and evaluate different models for our problem, including linear regression and random forests
* Evaluate model performance
* Understand the basic structure and some of the strengths and draw-backs of the two models we fitted

## Outline

**1. Review of class 1**

**2. Introduce supervised machine learning concepts**
  - Briefly explain classification vs regression
  - Link out to concepts class
  - Introduce dataset we will be working with

**3. The first step is exploring / visualizing the data**
  - ideally we will have munged the data a bit in class 1. This should be a very quick demonstration with easy to identify application.
    - Ex. JS quickly plots mpg distribution

**4. A simple linear model using base R**
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
**5. Tidy models!**
> Note: bulk of this (and possibly section 4) could go into class one (we could explain tidyverse and tidymodels together since they both rely on a similar idea/framework). For me understanding why tidymodels was created/how it hooks into methods from other packages was key to understanding how everything fit together.

  - `Tidymodels` is a _collection_ of modular packages for modeling and machine learning that all rely on tidy principles and grammar.
    - rsample: data splitting and resampling
    - parsnip: tidy interface to models that can be used to try a range of models without having to learn each specific packages details.
    - recipes: tidy interface to data preprocessing tools for feature engineering
    - workflows: a package used to bundle pre-processing, modeling and post-processing all together
    - tune: optimize the hyperparameters of your model and pre-processing steps
    - yardstick: measure the effectiveness of models using performance metrics
    - broom: convert the information in common statistical R objects into user-friendly predictable formats
    - dials: create and manage tuning parameters and parameter grids
    
Maybe if we introduce all packages ahead of time we can just introduce the packages we will use in this class (rsample, parsnip, yardstick)

**6. Training and testing**
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

**7. Using tidymodels to train a model**

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

**8. Evaluate your models**

- root mean squared error metric
- use the yardstick package

>Note: In JS course she has them evaluate with training and testing data to show the difference in output (evaluating on training data will always be more optimistic)

**9. Resampling**

- Why resample?: "The idea of resampling is to create simulated data sets that can be used to estimate the performance of your model, say, because you want to compare models. You can create these resampled data sets instead of using either your training set (which can give overly optimistic results, especially for powerful ML algorithms) or your testing set (which is extremely valuable and can only be used once or at most twice)."
 
 ```
 Code:
 1. Create bootstrap resamples using rsample::bootstraps()
 2. Evaluate linear model and random forests with bootstrap resamples
 ```
 
 **10. Visualize model results**
 
 - Use `tune::collect_predictions()`
 - Plot predicted vs truth in  `ggplot`
