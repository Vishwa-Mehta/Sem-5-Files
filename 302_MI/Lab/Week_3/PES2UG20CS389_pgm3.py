'''
Assume df is a pandas dataframe object of the dataset given
'''

import numpy as np
import pandas as pd
import random
import math

'''Calculate the entropy of the enitre dataset'''
# input:pandas_dataframe
# output:int/float
def get_entropy_of_dataset(df):
    # TODO
    entropy = 0
    real_outputs = df.iloc[:, -1]
    positive_op = 0
    negative_op = 0
    for i in real_outputs:
        if i == 'yes':
            positive_op += 1
        else:
            negative_op += 1
    entropy = (-positive_op / (positive_op + negative_op)) * (math.log(positive_op / (positive_op + negative_op), 2)) + (-negative_op / (positive_op + negative_op)) * (math.log(negative_op / (positive_op + negative_op), 2))
    return entropy


'''Return avg_info of the attribute provided as parameter'''
# input:pandas_dataframe,str   {i.e the column name ,ex: Temperature in the Play tennis dataset}
# output:int/float
def get_avg_info_of_attribute(df, attribute):
    # TODO
    avg_info = 0
    target, count = np.unique(df[attribute], return_counts=True)
    attribute_count = count / count.sum()
    entropy = np.array([])
    for i in range(len(target)):
        new_df = df.loc[df[attribute] == target[i]]
        x, c = np.unique(new_df.iloc[:, -1], return_counts = True)
        value = c / c.sum()
        entropy = np.append(entropy, -(value * np.log2(value)).sum())
    avg_info = (attribute_count * entropy).sum()

    return avg_info


'''Return Information Gain of the attribute provided as parameter'''
# input:pandas_dataframe,str
# output:int/float
def get_information_gain(df, attribute):
    # TODO
    information_gain = get_entropy_of_dataset(df) - get_avg_info_of_attribute(df, attribute)
    return information_gain

#input: pandas_dataframe
#output: ({dict},'str')
def get_selected_attribute(df):
    '''
    Return a tuple with the first element as a dictionary which has IG of all columns 
    and the second element as a string with the name of the column selected

    example : ({'A':0.123,'B':0.768,'C':1.23} , 'C')
    '''
    # TODO
    ig = {}
    mg = float("-inf")
    for i in df.columns[:-1]:
        inf_attribute = get_information_gain(df, i)
        if inf_attribute > mg:
            col = i
            mg = inf_attribute
        ig[i] = inf_attribute
    return (ig, col)
    pass
