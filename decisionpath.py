import math
import os.path
import random
random.seed()

from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import numpy as np
import pandas as pd


import plotly.plotly as py
import plotly.graph_objs as go
import pydotplus
from IPython.display import Image  

import input_old

import cPickle

## csvs2 = [f for f in os.listdir('data/fa15/op+type') if f.endswith('.csv')]
csvs = [f for f in os.listdir('data/sp14/op+type') if f.endswith('.csv')]

random.shuffle(csvs)
dfs = []
test = []
## train = []

# for csv in csvs2:
# 	df, fs, ls = input_old.load_csv(os.path.join('data/fa15/op+type', csv), filter_no_labels=True, only_slice=False)

# 	if df is None:
# 		continue
# 	if df.shape[0] == 0:
# 		continue

# 	train.append(df)

for csv in csvs:
	df2, fs2, ls2 = input_old.load_csv(os.path.join('data/sp14/op+type', csv), filter_no_labels=True, only_slice=False)

	if df2 is None:
		continue
	if df2.shape[0] == 0:
		continue

	test.append(df2)



## train = pd.concat(train)
test = pd.concat(test)

#print (len(test))  
#print (len(train))  



## classes = list(train.groupby(ls2))
#print(ls)
## max_samples = max(len(c) for _, c in classes)
##train = pd.concat(c.sample(max_samples, replace=True) for _, c in classes)# max_samples = max(len(c) for _, c in classes)
##train = pd.concat(c.sample(max_samples, replace=True) for _, c in classes)
#print (len(train))  
#print df.shape
#print type(df)
#list_keys = [ k for k in df ]
#print list_keys
# print samps

#print sum(df['L-DidChange'].values)
# print df['L-DidChange'].index



# train_samps = train.loc[:,'F-Is-Eq' :]
# train_labels = train.loc[:,'L-DidChange']

# print test
test_samps = test.loc[:,'F-Is-Eq' :]
test_labels = test.loc[:,'L-DidChange']
test_span = test.loc[:,'SourceSpan']
# print test.iloc[1]
# print test.values[1]
feature_names = fs2[1:]


# dflist = []
# keylist = []
# for key, value in df.iteritems():
#     temp = value
#     tempk = key
#     dflist.append(temp)
#     keylist.append(tempk)
# Y = dflist[0]
# X = dflist[2:]


#-----Making classifier
#estimator = RandomForestClassifier(n_estimators=30)

# estimator = tree.DecisionTreeClassifier()
# estimator = estimator.fit(train_samps.values, train_labels.values)


# print anses
# print test_labels.values
# print sum(anses)/len(anses)
# print sum(test_labels.values)/len(test_labels.values)

#------- Saving
# with open('my_dumped_classifier_optype.pkl', 'wb') as fid:
#     cPickle.dump(estimator, fid) 

#------- Loading
with open('my_dumped_classifier_optype.pkl', 'rb') as fid:
    estimator = cPickle.load(fid)

#------- Predicting
anses = estimator.predict(test_samps.values)

#-------importances

# imps = estimator.feature_importances_
# imp_features = [(y,x) for (y,x) in sorted(zip(imps,feature_names))]
# imp_features.reverse()
# for elem in imp_features:
#         print elem  
#------------------

#testanses =test_labels.values
resacc = anses + 2*test_labels.values
acc = 1-((sum(abs(anses - test_labels.values)))/3600)

lol = test_labels.add((-1)*anses)

#print lol

#print map(lambda x : estimator.predict_proba(x), test_samps.values)
prob_score = estimator.predict_proba(test_samps.values)
prob_error = [item[1] for item in prob_score]

conf = np.array(prob_error)-0.5
posconf = filter(lambda x: x > 0, conf)
negconf = filter(lambda x: x < 0, conf)
print (np.mean(posconf))
print (np.mean(negconf))

ll = zip(prob_error, anses, test_labels.values, test_span)

score = pd.DataFrame(data=ll, index=test_labels.index, columns=['Error Probability','predictions', 'actual' ,'SourceSpan'])
# print score

# print 'recall is ' + str(sum(anses * test_labels.values)/sum(test_labels.values))
# print 'precision is ' + str(sum(anses * test_labels.values)/sum(anses))

yay1 = 0
yay2 = 0
yay3 = 0
tots = 0
tp = 0

for labelind in list(set(test_labels.index)):
	#print labelind
	temp = score.loc[labelind]
	temp = temp.values
	# print labelind
	if len(temp) < 3:
		continue
	tots = tots+1
	topn = temp[np.argsort(temp[:,0])]

#Writing into file
	# filenm = str(labelind).split('.')
	# f = open('decisiontree_results/' + filenm[0] +'.out', "w+")
	# for preds in topn:
	# 	if preds[1] == 1:
	# 		f.write(str(preds[3]) + '\n')

	# f.close()


	# print topn
	# print 'lol'
	# print topn[-3:]
	a3 = 0
	a2 = 0
	a1 = 0
	if (topn[-3][1] == 1 and topn[-3][2] == 1) :
		a3 = 1
		tp = tp+1
	if (topn[-2][1] == 1 and topn[-2][2] == 1) :
		a3 = 1
		a2 = 1
		tp = tp+1
	if (topn[-1][1] == 1 and topn[-1][2] == 1) :
		a3 = 1
		a2 = 1
		a1 = 1
		tp = tp+1		
	yay1 = yay1+a1	
	yay2 = yay2+a2
	yay3 = yay3+a3

print "precision for top 3"
print 'top 1' 
print float(yay1)/tots
print 'top 2' 
print float(yay2)/tots
print 'top 3'
print float(yay3)/tots

# print tots
# print tp
# print sum(test_labels.values)
print "recall for top 3"
print tp/sum(test_labels.values)


# # -----PLOTTING
# dot_data = tree.export_graphviz(estimator, out_file=None,
# 	feature_names=feature_names, 
# 	filled=True, 
# 	rounded=True) 
# graph = pydotplus.graph_from_dot_data(dot_data) 
# graph.write_png('mytree2.png')
# ---------

# graph.render(filename='img/g1')
# graph.write_pdf("smallfa15.pdf") 
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

fileid = 3041
samp_indsb = test_samps.index.get_loc(fileid)
samp_inds = [i for i, x in enumerate(samp_indsb) if x]

print fileid

for ind in samp_inds:
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

	        print("decision id node %s : (X[%s, %s] (= %s) %s %s)"
	              % (node_id,
	                 sample_id,
	                 feature[node_id],
	                 X_test[sample_id, feature[node_id]], # <-- changed i to sample_id
	                 threshold_sign,
	                 threshold[node_id]))
	        print(feature_names[feature[node_id]]);

	
