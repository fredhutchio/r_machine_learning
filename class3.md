# Class 3: Classification

## Objectives

* Place logistic regression in the taxonomy of ML algorithms
* Explain the key differences and similarities between logistic and linear regression.
* Fit and interpret a logistic regression model in scikit-learn
* Interpret the coefficients of logistic regression, using odds ratio

## Outline

**1. Review of class 2**

**2. Remind of machine learning concepts**
- Regression vs classification
- link to concepts class
- introduce dataset

**3. Remind of tidy models**
- overview of the packages we will touch on today

**4. Step 1 is always explore, visualize the data**
- Look at dataset
- Emphasize imbalance (if there is one)
- plot something
- remove columns that are unnecessary

```
Code: glimpse(), count(), some sort of ggplot()
```

**5. Training and testing data**
- use `rsample` package to split
- pull out training and testing data into their own variables

```
Code:
1. set.seed(1)
2. split <- initial_split()
3.  trainset <- training(split)
    testset <- testing(split)
```

**6. imbalenced data**
- Reiterate imbalance
- Explain why this would be a problem
- Explain the term "Downsampling"
  - What data do we downsample on (training!)
- we will use the `recipe` package to set up precprocessing steps

**7. using recipe for preprocessing**
- Explain the functions a little bit

```
Code: Look at recipe parameters, run recipe code
Use prep() and bake() to see processed training data
```

**8. Prediction**
- We will look at two different classifiers (similar to what we did with regression)
  - logistic regression
  - decision tree
- Link out to more information (concepts, etc) about these methods

**9. Using `workflow` to tie together `tidymodels`
>Note: Not sure where this should go: Maybe the first class should dive more into the modular nature of the packages?

- Explain the workflow is an object that bundles together preprocessing, modeling, and post processing
- Combine a `recipe` with a `parsnip` model
- Advantage:
  - Keep these objects in one place
  - Recipe prep and model fitting executed in a single call to `fit()`
  - Can combine with `tune` for tuning parameters
  - Will eventually be able to add post processing operations like modifying the probability cutoff
  
**10.  Use recipe and workflow to combine preprocessing and modeling**

- For both decision tree and logistic regression
- JS does a full example of one and then the other, I think it might be beneficial to walk through each step for both
  - like, create recipe, build a decision tree model and log regression model, etc. Walk through each step for both

```
Code:
1. Use recipe with training data to downsample
2. Build a model with set_engine()
3. Start a workflow by adding a recipe
4. Add the model to workflow and fit
5. print fitted model
```

**11. Evaluation with confusion matrix**
- Again using yardstick to evaluate

```
Code: conf_mat() on results
```

- Talk about accuracy and positive predictive value as other evaluation metrics

```
Code: use yardstick::accuracy() and yardstick::ppv()
```
