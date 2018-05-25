
# coding: utf-8

# In[94]:

#Import the required packages

from yahoo_finance import *
from pylab import *
from numpy import *


# In[95]:

#We set the enviroment parameters of the experiment

Tf=600;   # -Final Time
Tw=10;    # -Window Time
Ts=5;     # -Shift Time


# In[96]:

#We now define a function to get from some financial object the data starting at T0 and length d

def WinExtract(Sh, T0, d):
    #Sh is an array with the indexed data as if 0 were today
    #T0 is the day init for the window
    #d is the size of the output
    return Sh[T0:T0+d]


# In[97]:

#Here I extract the data from yahoo finance

yahoo = Share('YHOO')
x1=yahoo.get_historical('2010-01-02', '2017-01-01')

google = Share('GOOG')
x2=google.get_historical('2010-01-02', '2017-01-01')

o1=asarray([float(q['Open']) for q in x1])
c1=asarray([float(q['Close']) for q in x1])

y1=(o1+c1)/2

o2=asarray([float(q['Open']) for q in x2])
c2=asarray([float(q['Close']) for q in x2])

y2=(o2+c2)/2


# In[98]:

#Here I extract only the data up to Tf

fixed=zeros(Tf)
shifted=zeros(Tf)

for i in range(Tf):
    fixed[i]=y1[i]
    shifted[i]=y2[i]


# In[99]:

#I define the Matrix that will keep the results.

Results=zeros((Tf-Ts,Ts))


# In[100]:

#First we start a loop for every time from 0 to Tf-Ts to do the exam

for daycheck in range(Tf-2*Tw):

    #Next for every posible shift 0:Ts

    for shift in range(Ts):

        #I extract the correlation coeficient
        C = corrcoef(WinExtract(fixed,daycheck,Tw),WinExtract(shifted,daycheck+shift,Tw))
        Results[daycheck][shift]=C[0][1]


# In[106]:

x1[0]['Symbol']


# In[104]:

#Now I plot the results

figure()

c=['b','r','g','m','k']
labels=['0','1','2','3','4']

t=arange(Tf-Ts)+1
for i in range(Ts):
    plot(t,Results[:,i],color=c[i],label=labels[i])
legend()
grid()
show()

