import pandas as pd
import numpy as np

def load_csv(path, filter_no_labels=False):
    '''Load feature vectors from a csv file.

    Expects a header row with feature columns prefixed with 'F-' and
    label columns prefixed with 'L-'.

    @return: (dataframe, feature names, label names)

    '''
    df = pd.read_csv(path)
    label_names = [c for c in df.columns if c[0] == 'L']
    feature_names = [c for c in df.columns if c[0] == 'F']

    if filter_no_labels:
        # print df.shape
        # filter out vectors with no predictions
        criteria = (df[l] == 1.0 for l in label_names)
        df = df[reduce(lambda x, acc: x | acc, criteria)]
        # print df.shape

    return (df, feature_names, label_names)
