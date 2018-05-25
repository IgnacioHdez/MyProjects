'''Generates the constant variables for the operation'''

#--- 4 Prepare training data






X=[]
Y=[]

for i in range(NTrain-NPrev):   # i for the list of training
    xtemp=[]
    i=i+(DATA.N-NTrain)   # Data starts at training point 1000 to 9994
    for j in range(NPrev):  # j for each element of the train set goes from 0 to 4
        xtemp.append(DATA.Close[i+j])
        xtemp.append(DATA.Short[i+j])
        xtemp.append(DATA.Long[i+j])
        xtemp.append(DATA.DiffShort[i+j])
        xtemp.append(DATA.DiffLong[i+j])
    X.append(xtemp)
    if (DATA.Close[i-tPred] > DATA.Close[i]) :
        Y.append(1)
    else:
        Y.append(0)

#--- 4 Prepare testing data
Xtest=[]
Ytest=[]
for i in range(DATA.N-NTrain-NPrev):   # i for the list of training
    xtemp=[]
    i=i+(tPred)   # Data starts at training point tPred to N-NTrain-NPrev (999)
    for j in range(NPrev):  # j for each element of the train set goes from 0 to 4
        xtemp.append(DATA.Close[i+j])
        xtemp.append(DATA.Short[i+j])
        xtemp.append(DATA.Long[i+j])
        xtemp.append(DATA.DiffShort[i+j])
        xtemp.append(DATA.DiffLong[i+j])
    Xtest.append(xtemp)
    if (DATA.Close[i-tPred] > DATA.Close[i]) :
        Ytest.append(1)
    else:
        Ytest.append(0)

#--- 5 Creates nerunal network

if model=="C":
    Net = MLPClassifier(solver='sgd', alpha=1e-5, hidden_layer_sizes=(50), random_state=1)
    Net.fit(X,Y)
    print(Net.score(Xtest,Ytest))
else:
    Net = MLPRegressor(alpha=1e-5, hidden_layer_sizes=(50), random_state=1)
    Net.fit(X,Y)
    print(Net.score(Xtest,Ytest))


