# Class 4: Unsupervised learning (PCA, UMAP)

## Class objectives:
- Explain why we might want to create a lower-dimension representation of a dataset.
- Explain the curse of dimensionality
- Explain the conceptual basis of PCA (principal component analysis) and what is meant by subsequent PCs
- Describe how PCA is used in practice and when to avoid using it.

## Data set
- Leukemia
- Merge into a single csv but point students toward rmd that explains all the steps to get there.

## Class outline

**1. Review class 3**

**2. Briefly introduce supervised vs unsupervised machine learning**
- link out to concepts course

**3. First step is exploring the data**
- JS uses a cocktail dataset. She does extensive cleaning up of terms
- Goes through the process of building a piped mutate function the condesnces ingrediates (i.e. "fresh lemon juice|juice of a lemon" -> "lemon juice"), removes outliars.
- Great example usage of pivot wider (seems important to demonstrate these in class bc they are newer functions)

**4. Use `recipes` to implement principal componant analysis**
1. Tell recipe what is going on with model (formula with _no outcome_) and what data to use
2. Update the role for cocktail name and category since we will use these as identifiers for roles but they are not a predictor or outcome
3. center and scale the numeric predictors (this is standard for pca)
4. use `step_pca()` for the actual analysis

```
pca_rec <- recipe(~., data = cocktails_df) %>%
  update_role(name, category, new_role = "id") %>%
  step_normalize(all_predictors()) %>%
  step_pca(all_predictors())
  
pca_prep <- prep(pca_rec)

pca_prep
```

Before using `prep()` the steps have been defined but not actually run or implemented. This last step is where everything gets evaluated.
  
**5. Explore the results of the PCA**
- viz of first five PCs
- discussion of how to read this plot
- viz of PC1 by PC2 and PC1 by PC3 (or similar). Discussion of what these different visualizations are telling us.
  - Similarly discuss how coloring/labeling of points can help us make sense of PCA
- Need to stress that unlike with supervised learning we aren't given a quantitative outcome here. We're given a data structure that we must make sense of in a more qualitative way.

**6. Demonstrate the utility of tidymodels by applying to UMAP**

