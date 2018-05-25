from neuron import *
from numpy import *
from pylab import *
print('\nSTARTING NEURON TEST\n')
N=NeuronNet([3,3,2,1])

x=[]
y=[]
for i in range(300):
    p=(2*rand()-1)
    dirc=array([p,p,p])
    v=dirc
    x.append(v.tolist())
    y.append([p])

#print(x)
N.TrainRandGrad(x,y,100,0.01,0.3)

xtest=[0.2,0.2,0.2]
s=N.error(x,y)

print('\nLAST ERROR')
print('==========')
print(s)

print('\nTEST 1')
print('======')
print('f('+str(xtest)+') = '+str(N.Apply(xtest)))

for i in range(100):
    xpl=array(x[i])
    ypl=array([0,0,N.Apply(x[i])[0]])
    ycor=array([0,0,x[i][0]])
    plot(xpl,ycor,'b.')
    plot(xpl,ypl,'r.')
show()
