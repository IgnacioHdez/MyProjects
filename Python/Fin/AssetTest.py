from Asset import *
from numpy import zeros,size,pi,linspace
from pylab import grid,show,plot,log10
from numpy.random import normal
#PTF TESTS-----------------------------------------------------------------------------

#Here I extract the data from yahoo finance


#As1=Asset.fromYH('YHOO','2017-03-01','2017-03-17')
#As2=Asset.fromYH('GOOG','2017-03-01','2017-03-17')
#As3=Asset.fromYH('AAPL','2017-03-01','2017-03-17')
#As4=Asset.fromYH('AMZN','2017-03-01','2017-03-17')
#As5=Asset.fromYH('MSFT','2017-03-01','2017-03-17')
#As6=Asset.fromYH('AMD','2017-03-01','2017-03-17')
#As7=Asset(normal(0.0001,0.000001,size(As1.dat)))
#PT=pfl([As1,As2,As3,As4,As5,As6,As7],rand(6))
#
#Asts=[As1,As2,As3,As4,As5,As6,As7]
#
#PT.plotPT(100)
#PT.plotminvarset(100)
#
#
#fig=figure()
#ax=fig.add_subplot(1,1,1)
#
#for i in range(size(Asts)):
#    ax.scatter(Asts[i].s(),Asts[i].r(),color='black',s=10)
#
#
#print(' Case Optim PF ')
#print('===============')
#PT.optim_minvar(50)
#print(PT.w*100)
#print(PT.r()*100)
#print(PT.s()*100)
#ax.scatter(PT.s(),PT.r(),color='red',s=30)
#
#print('')
#print(' Case MaxR ')
#print('===========')
#PT.optim_maxr(50)
#print(PT.w*100)
#print(PT.r()*100)
#print(PT.s()*100)
#ax.scatter(PT.s(),PT.r(),color='blue',s=30)
#xlabel('$\sigma$')
#ylabel('r')
#grid()
#show()

#---------------------------------------------------------------------------------

#FFT TESTS-----------------------------------------------------------------------------

As1=Asset.fromYH('YHOO','2000-04-01','2017-05-01')
#As2=Asset.fromYH('GOOG','2016-05-01','2017-05-01')
#As3=Asset.fromYH('AAPL','2016-09-01','2017-05-01')
#As4=Asset.fromYH('AMZN','2016-09-01','2017-05-01')
#As5=Asset.fromYH('MSFT','2016-09-01','2017-05-01')
#As6=Asset.fromYH('AMD','2016-09-01','2017-05-01')
As2=Asset(normal(0,5,size(As1.dat)))

t=linspace(0,size(As1.dat)-1,size(As1.dat))

days=100
d=zeros(days)
k=zeros(days)

for i in range(days):
    k[i]=2*pi/(i+2)
    d[i]=(i+2)
#k=linspace(pi/5,pi,100*size(As1.dat))
Pk=As1.fft(k,t)
plot(d,log10(Pk),'k-')

grid()
#axis([0,days,-2,max(log10(Pk))])
show()
