#!/usr/bin/env python
# coding: utf-8

# Required Packages:

import numpy as np
import pandas as pd  
import seaborn as sns 

# Required Dataset:

from sklearn.datasets import load_boston

# Load Dataset:

boston_dataset = load_boston()

# Load Data into Frame:

boston = pd.DataFrame(boston_dataset.data, columns=boston_dataset.feature_names)
boston.head()

# Set Target Variable 'MEDV':

boston['MEDV'] = boston_dataset.target

# Prepare Data to Train Model:

X = pd.DataFrame(np.c_[boston['LSTAT'], boston['RM']], columns = ['LSTAT','RM'])
Y = boston['MEDV']

# Splitting into Training & Testing Set:

from sklearn.model_selection import train_test_split

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state=5)
print(X_train.shape)
print(X_test.shape)
print(Y_train.shape)
print(Y_test.shape)

# Training & Testing of Model:

from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

lin_model = LinearRegression()
lin_model.fit(X_train, Y_train)

# model evaluation for training set
y_train_predict = lin_model.predict(X_train)
rmse = (np.sqrt(mean_squared_error(Y_train, y_train_predict)))

print("The model performance for training set")
print("--------------------------------------")
print('RMSE is {}'.format(rmse))
print("\n")

# model evaluation for testing set
y_test_predict = lin_model.predict(X_test)
rmse = (np.sqrt(mean_squared_error(Y_test, y_test_predict)))

print("The model performance for testing set")
print("--------------------------------------")
print('RMSE is {}'.format(rmse))



