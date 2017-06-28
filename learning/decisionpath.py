import math
import os.path
import random
random.seed()

from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import numpy as np
import pandas as pd


# import plotly.plotly as py
# import plotly.graph_objs as go
import pydotplus
# from IPython.display import Image

import sys

import input_old

model = sys.argv[1]
test, fs, ls = input_old.load_csv(sys.argv[2], filter_no_labels=True, only_slice=True)


# print test
test_samps = test.loc[:,'F-Is-Eq':]
test_labels = test.loc[:,'L-DidChange']
test_span = test.loc[:,'SourceSpan']
# print test.iloc[1]
# print test.values[1]
feature_names = fs[1:]


#------- Loading
from sklearn.externals import joblib
estimator = joblib.load(model)


# # -----PLOTTING
dot_data = tree.export_graphviz(estimator, out_file=None,
	feature_names=feature_names,
	filled=True,
	rounded=True)
graph = pydotplus.graph_from_dot_data(dot_data)
# graph.write_png(model+'.png')
# ---------

# graph.render(filename='img/g1')
graph.write_pdf(model+".pdf")
# --------------

X_test = test_samps.values


# Using those arrays, we can parse the tree structure:

n_nodes = estimator.tree_.node_count
children_left = estimator.tree_.children_left
children_right = estimator.tree_.children_right
feature = estimator.tree_.feature
threshold = estimator.tree_.threshold

# The tree structure can be traversed to compute various properties such
# as the depth of each node and whether or not it is a leaf.
# node_depth = np.zeros(shape=n_nodes)
# is_leaves = np.zeros(shape=n_nodes, dtype=bool)
# stack = [(0, -1)]  # seed is the root node id and its parent depth
# while len(stack) > 0:
#     node_id, parent_depth = stack.pop()
#     node_depth[node_id] = parent_depth + 1

#     # If we have a test node
#     if (children_left[node_id] != children_right[node_id]):
#         stack.append((children_left[node_id], parent_depth + 1))
#         stack.append((children_right[node_id], parent_depth + 1))
#     else:
#         is_leaves[node_id] = True

# print("The binary tree structure has %s nodes and has "
#       "the following tree structure:"
#       % n_nodes)
# for i in range(n_nodes):
#     if is_leaves[i]:
#         print("%snode=%s leaf node." % (node_depth[i] * "\t", i))
#     else:
#         print("%snode=%s test node: go to node %s if X[:, %s] <= %ss else to "
#               "node %s."
#               % (node_depth[i] * "\t",
#                  i,
#                  children_left[i],
#                  feature[i],
#                  threshold[i],
#                  children_right[i],
#                  ))
# print()

#i = n_nodes # lol loop



# First let's retrieve the decision path of each sample. The decision_path
# method allows to retrieve the node indicator functions. A non zero element of
# indicator matrix at the position (i, j) indicates that the sample i goes
# through the node j.

node_indicator = estimator.decision_path(X_test)

# Similarly, we can also have the leaves ids reached by each sample.

leave_id = estimator.apply(X_test)

# Now, it's possible to get the tests that were used to predict a sample or
# a group of samples. First, let's make it for the sample.

# sample_id = 50
# node_index = node_indicator.indices[node_indicator.indptr[sample_id]:
#                                     node_indicator.indptr[sample_id + 1]]

# print('Rules used to predict sample %s: ' % sample_id)
# for node_id in node_index:
#     if leave_id[sample_id] != node_id:
#         continue

#     if (X_test[sample_id, feature[node_id]] <= threshold[node_id]):
#         threshold_sign = "<="
#     else:
#         threshold_sign = ">"

#     print("decision id node %s : (X[%s, %s] (= %s) %s %s)"
#           % (node_id,
#              sample_id,
#              feature[node_id],
#              X_test[sample_id, feature[node_id]],
#              threshold_sign,
#              threshold[node_id]))

#print (estimator.decision_path(X_test[50]))

#samp_inds = [i for i, x in enumerate(test_samps) if x]

for ind, _ in enumerate(test_samps):
        if ind >= len(test_samps): # WTF?
                continue
	print ('----------------------------------')
	print ('For span')
	print(test_span.values[ind])
	print ('with confidence')
	print ((estimator.predict_proba(X_test[ind].reshape(1,-1)))[0][1]) 
	print ('our prediction is')
	print ((estimator.predict(X_test[ind].reshape(1,-1)))[0]) 
	print ('should be')
	print (test_labels.values[ind])
	sample_id = ind
	# print X_test[sample_id]

	node_index = node_indicator.indices[node_indicator.indptr[sample_id]:
	                                    node_indicator.indptr[sample_id + 1]]

	print('Rules used to predict sample %s: ' % sample_id)
	for node_id in node_index:

	    if leave_id[sample_id] == node_id:  # <-- changed != to ==
	        #continue # <-- comment out
	        print("leaf node {} reached, no decision here".format(leave_id[sample_id])) # <--

	    else: # < -- added else to iterate through decision nodes
	        if (X_test[sample_id, feature[node_id]] <= threshold[node_id]):
	            threshold_sign = "<="
	        else:
	            threshold_sign = ">"

                print("%s : (= %s) %s %s"
                      % (feature_names[feature[node_id]],
                         X_test[sample_id, feature[node_id]],
                         threshold_sign,
                         threshold[node_id]))
	        # print("decision id node %s : (X[%s, %s] (= %s) %s %s)"
	        #       % (node_id,
	        #          sample_id,
	        #          feature[node_id],
	        #          X_test[sample_id, feature[node_id]], # <-- changed i to sample_id
	        #          threshold_sign,
	        #          threshold[node_id]))
	        # print(feature_names[feature[node_id]]);
