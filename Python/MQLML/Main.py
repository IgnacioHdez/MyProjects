'''Read data from MQL5 generated file'''

print("Starting process")

#--- 0 Import libraries

from DataLoad import MqlLoad
from sklearn.neural_network import MLPClassifier



#--- 1 Initial parameters and data load
NPrev    = 3     # Size of the lag vector
tPred    = 1     # Minutes for prediction
NTrain   = 9000  # Number of training sets
model="C"

DATA = MqlLoad()

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

Net = MLPClassifier(solver='sgd',
                    activation='relu',
                    learning_rate='adaptive',
                    max_iter=1000,
                    alpha=1e-5,
                    hidden_layer_sizes=(int(1.42*len(X[0]))),
                    random_state=1,
                    verbose=False)
Net.fit(X,Y)
print(Net.score(Xtest,Ytest))






























