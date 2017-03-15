import math
import os.path
import random
random.seed()

from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import numpy as np
import pandas as pd

import input_old

csvs2 = [f for f in os.listdir('ml2/data/fa15/op+type+size') if f.endswith('.csv')]
csvs = [f for f in os.listdir('ml2/data/sp14/op+type+size') if f.endswith('.csv')]

random.shuffle(csvs)
dfs = []
test = []
train = []

for csv in csvs2:
	df, fs, ls = input_old.load_csv(os.path.join('ml2/data/fa15/op+type+size', csv), filter_no_labels=True, only_slice=False)

	if df is None:
		continue
	if df.shape[0] == 0:
		continue

	test.append(df)

for csv in csvs:
	df2, fs2, ls2 = input_old.load_csv(os.path.join('ml2/data/sp14/op+type+size', csv), filter_no_labels=True, only_slice=False)

	if df2 is None:
		continue
	if df2.shape[0] == 0:
		continue

	train.append(df2)



train = pd.concat(train)
test = pd.concat(test)

#print (len(test))  
#print (len(train))  


# print (df.shape)
# print df
classes = list(train.groupby(ls2))
#print(ls)
max_samples = max(len(c) for _, c in classes)
train = pd.concat(c.sample(max_samples, replace=True) for _, c in classes)
#print (len(train))  
#print df.shape
#print type(df)
#list_keys = [ k for k in df ]
#print list_keys
# print samps

#print sum(df['L-DidChange'].values)
# print df['L-DidChange'].index



train_samps = train.loc[:,'F-InSlice':]
train_labels = train.loc[:,'L-DidChange']

# print test
test_samps = test.loc[:,'F-InSlice':]
test_labels = test.loc[:,'L-DidChange']
test_span = test.loc[:,'SourceSpan']
# print test.iloc[1]
# print test.values[1]


# dflist = []
# keylist = []
# for key, value in df.iteritems():
#     temp = value
#     tempk = key
#     dflist.append(temp)
#     keylist.append(tempk)
# Y = dflist[0]
# X = dflist[2:]

#clf = RandomForestClassifier(n_estimators=30)
clf = tree.DecisionTreeClassifier()
clf = clf.fit(train_samps.values, train_labels.values)
# print test_samps
# print test_samps.values
anses = clf.predict(test_samps.values)

# print anses
# print test_labels.values
# print sum(anses)/len(anses)
# print sum(test_labels.values)/len(test_labels.values)

#-------importances

# imps = clf.feature_importances_
# imp_features = [(y,x) for (y,x) in sorted(zip(imps,fs))]
# imp_features.reverse()
# for elem in imp_features:
#         print elem  
#------------------

#testanses =test_labels.values
resacc = anses + 2*test_labels.values
acc = 1-((sum(abs(anses - test_labels.values)))/3600)

lol = test_labels.add((-1)*anses)

#print lol

#print map(lambda x : clf.predict_proba(x), test_samps.values)
prob_score = clf.predict_proba(test_samps.values)
prob_error = [item[1] for item in prob_score]

# print prob_error

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

	filenm = str(labelind).split('.')
	f = open('results/' + filenm[0] +'.out', "w+")
	for preds in topn:
		if preds[1] == 1:
			f.write(str(preds[3]) + '\n')

	f.close()
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
