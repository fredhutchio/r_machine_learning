# Class 3: A more complex regression or classification

## Outline

**Intro, course objectives**

**Review of class 3**

**Introduce dataset**
- This is where we will ask questions of the dataset and work through the beginning conceptual steps of EDA
  - ex: What are we hoping to predice? What columns should be included in our prediction? What questions do we have of the data before we start?

**Explore dataset**
- Take a look at the datset. What are we aiming to predict? What model should we use?

```
glimpse(), count(), group_by(), summarise()
```

- Visualization allows you to gain an understanding of the data's characteristics **before** modeling

```
Histogram of some interesting feature
```

- Discuss take aways from what we're seeing (i.e. is the dataset imbalenced, what does the histogram tell us?)

>Even if data is balanced have students make that assessment themselves

**Training and testing data**
- Use `rsample` to split the data

```
- remove columns deemed unnecissary earlier
- load tidymodles
- split the data so it divides a specific feature evenly with rsample()
```

**Preprocessing**
- Do we have any preprocessing to do?
- If the data is imbalenced (ideally it will be) we will discuss upsampling here
- Demonstrate using recipe to preprocess our training data

```
my_recipe <- recipe() %>% step_upsample()
```

**Creating a workflow**
- We'll use a different engine for the random forest model from the `ranger` package.
- combine the model with preprocessing step (recipe) using `workflow()`

```
## specify ranger model
rf_spec <- rand_forest() %>% set_engine('ranger') %>% set_mode('classification')

## Add recipe and model to workflow
wf <- workflow() %>% add_recipe(my_recipe) %>% add_model(rf_spec)
```

**Resampling by cross validation**
- Remember: Resampling is a way to improve the accuracy of your model
- Maybe find a good resampling primer and link
- Last class we did bootstrap, this class cross validation

- Cross validation works by taking your training set and dividing up into equal subsets (aka folds). One fold is used for validation and the rest are used for training. You repeat the steps with all the training folds and combine the results by taking the mean (usually).
    - probably will have to explain a little more indepth

Cross validation can take quite a long time - it can be beneficial to use parallel processing

>Note: How do you choose the number of folds?? When do you use cross validation vs boostrapping?

```
 folds <- vfold_cv(training_dat, v = 10, repeats = 5)
```

**Evaluation**
- At this point we have preprocessed the data, built workflow to model, and created cross validation folds
- Now we will evaluate how the model performed
    - In our discussion of model performance we will touch on how to set non-default performance metrics and save predictions from resampled data.
    
- Use `fit_resamples()` to fit the workflow to the cross validation folds and determine how well the model performed each time
    - remember that the wf includes the preprocessing step AND model specification

- `save_pred = TRUE` allows us to save the model predictions so we can build a confusion matrix later
- `metric_set(roc_auc, sens, spec)` sets specific performance metrics to be computed rather than the defaults
    - the area under the ROC curve
    - sensitivity
    - specificity

```
wf %>%
    fit_resamples(
        folds,
        metrics = metric_set(roc_auc, sens, spec),
        control = control_resamples(save_pred = TRUE))
```

