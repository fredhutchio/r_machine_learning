# Dataset information

## `glaucoma`

- Downloaded from: https://datadryad.org/stash/dataset/doi:10.5061/dryad.q6ft5
- Corrosponding paper: https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0177726
- 3 files: ds_test.csv, ds_train.csv, ds_whole.csv
-

### Data Dictionary

| col_num  |  col_name |  description |  data_type |  comment |
|---|---|---|---|---|
| 1 | RL | designate right or left eye. OD = oculus dexter, os = oculus sinister | binary, character | unsure what RL stands for (best guess) |
| 2 | glaucoma | diagnosed with glaucoma? YES (1) / NO (0) | binary | NA |
| 3 | age | age of patient in years | num | NA |
| 4 | ocular_pressure | Eye pressure is measured in millimeters of mercury (mm Hg) | num | normal eye pressure ranges between 12-22 |
| 5 | MD | mean deviation - average difference from normal expected value in the patients particular age group | num | Typically, an MD of -2.00 or less could indicate glaucoma. *See notes on visual field testing |
| 6 | PSD | pattern standard deviation  | num | *See notes on visual field testing |
| 7 | GHT  | glaucoma hemifield test | num | *See notes on visual field testing |
| 8 | cornea_thickness | thickness of the cornea measured in micrometers | num | average cornea thickness is 540-565, thin corneas have been identified as a predictive factor of glaucoma |
| 9 | RNFL4.mean | Retinal nerve fiber layor synthesized feature | num | *See notes about RNFL4.mean |

**Notes on Visual Field testing**

- The visual field is how wide of an area your eye can see when you focus on a central point.
  - Testing this is a way for doctors to measure how much vision you have in either eye and quantify vision loss over time
- standard automated perimetry (SAP) is a method of field testing
  - quantifies the ability of the observer to percieve a spot of light of a standard size briefly shown at mutiple locations across the visual field
  - It's commonly used to map out local and global patterns of visual field loss associated with the underlying structural atrophy in the retina (like with glaucoma)
- Mean deviation, pattern standard deviation, and glaucoma hemifield test are summary statistics of the many measurements taken during SAP.
  - mean deviation is the average of deviations across all test locations. Subjects who can see dimmer stimuli than other in their age category will have a positive value. Subjects who require brighter stimuli will have negative MD values.

>This section needs more explanation of pattern standard deviation + glaucoma hemifield test. They are also summary statistics but are harder to explain...will return to this. For now see [this](https://eyewiki.aao.org/Standard_Automated_Perimetry#Identifying_Glaucomatous_VF_Loss_on_SAP) resource for more information.

**Notes on RNFL4.mean**

- From the paper:

>To increase the quality of the training dataset, we made a synthesized feature. The feature RNFL4.mean reflects the average value of RNFL SUP, INF, and TMP. Because the four RNFL features contain partial information about RNFL, and we need to reflect whole RNFL, we tested every combination of the four RNFL features and SUP-INF-TMP combination showed best performance.

## `pan_cancer`

- Downloaded from: https://archive.ics.uci.edu/ml/datasets/gene+expression+cancer+RNA-Seq#
- Corrosponding paper: Weinstein, John N., et al. 'The cancer genome atlas pan-cancer analysis project.' Nature genetics 45.10 (2013): 1113-1120.
- 3 files: labels.csv, data.csv
- Comments:
  - Samples (instances) are stored row-wise. Variables (attributes) of each sample are RNA-Seq gene expression levels measured by illumina HiSeq platform
  - A dummy name (gene_XX) is given to each attribute. Check the original submission ([Web Link]#!Synapse:syn4301332), or the platform specs for the complete list of probes name. The attributes are ordered consitently with the original submission.

