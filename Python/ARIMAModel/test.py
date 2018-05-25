from numpy import genfromtxt
from matplotlib.pyplot import plot,show,gca,figure#,subplots,draw
import statsmodels.api as sm
# from sarimamodel import sarimagen
#Import the test data from out.txt
x=genfromtxt('GOOG.txt',delimiter=',')
x=x[500:,5]
N=len(x)
print(N)

# plot(range(N),x)
# show()
#Creates data to test
# N=1000
# x=sarimagen(p=[-0.5],q=[0.3],d=1,n=N,std=0.3)
# x=x[0]

# fig, axes = subplots(1, 2, figsize=(15,4))

# fig = sm.graphics.tsa.plot_acf(x, lags=20, ax=axes[1])
# fig = sm.graphics.tsa.plot_pacf(x, lags=20, ax=axes[0])
# show()


# p = int(input("p = "))
# q = int(input("q = "))

p=1
q=0
orden=(p,1,q)
ordens=(2,0,0,30)
print(orden)
print(ordens)
#Create the sarimax object with data from x
X = sm.tsa.statespace.SARIMAX(x,order=orden,order_season=ordens)
Xfit = X.fit(disp=False)
print(Xfit.summary())

#Create the prediction 1 step ahead
predict = Xfit.get_prediction()
predict_ci = predict.conf_int()

s=100
P2=[]
for i in range(100):
    predict2 = Xfit.get_prediction(dynamic=True,start=N-100+i,end=N-100+s-1+i)
    P2.append(predict2.predicted_mean[0])



#Create the plots
figure(2)
plot(range(N-100,N),x[N-100:],'ob')
ax=gca()

plot(range(N-100,N),predict.predicted_mean[N-100:],'r.-')
ax.fill_between(range(N-100,N),predict_ci['lower y'][N-100:], predict_ci['upper y'][N-100:], color='r', alpha=0.1)

plot(range(N-100,N),P2,'g.-')

show()
