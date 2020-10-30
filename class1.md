# Class 1: Tidyverse and EDA

## Objectives

* Understand the principles behind the tidyverse
* Import a simple dataset and explore different qualitative and quantitative aspects of the data
* Perform simple cleaning and visualization with single variables using the [Tidyverse](https://www.tidyverse.org/)
* Prepare the data for further analysis by engineering new features (columns) from existing numeric and categorical features

## Outline

**Course Intro**
- Welcome to Machine Learning with R
- Things you should be familiar with
  - Machine learning concepts
    - link to concepts course materials
  - the tidyverse

**What is Tidymodels?**
>Note: Want to emphasize the major principles behind tidymodels. Each package has a specific usage and together they create a cohesive ecosystem of packages that play together easily and intentionaly. 

- Meta packages
  - They are a single package that installs many different packages in one command
  - Modular - each package addresses a step in the data science modeling process
 
- `Tidymodels`
    - rsample: data splitting and resampling
    - parsnip: tidy interface to models that can be used to try a range of models without having to learn each specific packages details.
    - recipes: tidy interface to data preprocessing tools for feature engineering
    - workflows: a package used to bundle pre-processing, modeling and post-processing all together
    - tune: optimize the hyperparameters of your model and pre-processing steps
    - yardstick: measure the effectiveness of models using performance metrics
    - broom: convert the information in common statistical R objects into user-friendly predictable formats
    - dials: create and manage tuning parameters and parameter grids

**Tidy tools are created specifically to support the human data analyst**
- Focus on human centered design
  - Consistancy is key to this - focus on making data structures and APIs consistant across packages
    - API defines the external interface regardless of the internal workings
  - Value consistancy over performance
    - That means that other packages may run a little faster
    - ideal for human analyst not necissarily software development

**`Parsnip` standardizes the interface for fitting models**

## Resources

- https://joss.theoj.org/papers/10.21105/joss.01686.pdf
- https://design.tidyverse.org
- https://www.tmwr.org/base-r.html
