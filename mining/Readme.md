
## Predicting rock facies (classes of rocks) from well log data

Well log data is recorded either during drilling operations or after the drilling via tools either on the drill string or wireline tools descended into the well. Typically, geoscientists would take the logs and make correlations by hand. They would have to draw lines from log to log to get a holistic view of the rock type/facies, their characteristics, and their content. This can get tedious in mature fields and is prone to likely misinterpretation in new fields.

![](https://github.com/mlhubca/lab/blob/master/mining/well-logging.gif)

### Goal
Train a machine learning model that is able to predict the facies for wells not in the training set.

### Benefits
More accurate rock facies classification
Reduce costs and time, and improve productivity

### Data set
The data set we will use comes from University of Kansas. This dataset was taken from nine wells with 3232 examples, consisting of a set of seven predictor variables and a rock facies (class).

*Features:*
- GR: gamma ray (GR)
- ILD_log10: resistivity logging (ILD_log10)
- PE: photoelectric effect (PE) 
- DeltaPHI: neutron-density porosity difference 
- PHIND: average neutron-density porosity
- NM_M: nonmarine-marine indicator 
- RELPOS:  relative position 

*Rock facies:*
- Nonmarine sandstone (SS)
- Nonmarine coarse siltstone (CSiS)
- Nonmarine fine siltstone (FSiS)
- Marine siltstone and shale (Sish)
- Mudstone (limestone) (MS)
- Wackestone (limestone) (WS)
- Dolomite (D)
- Packstone-grainstone (limestone) (PS)
- Phylloid-algal bafflestone (limestone) (BS)






