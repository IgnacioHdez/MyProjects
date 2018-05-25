import datetime as dt
import numpy as np
import matplotlib.pyplot as plt

M=np.genfromtxt('Results/feedback.dat',dtype=None,delimiter='\t')
c=['b','r','m','g','b','r','m','g']

#0 PP
#1 PSOE
#2 Podemos
#3 Ciudadanos
#4 Rajoy
#5 Pedro Sanchez
#6 Pablo Iglesias
#7 Albert Rivera
target=[0,1,2,3,4,5,6,7]
n=8

Nt=np.zeros([8,int(len(M)/8)]).tolist()
T=np.zeros([8,int(len(M)/8)]).tolist()
t=np.zeros([int(len(M)/8)]).tolist()
for i in target:
    X=np.zeros([int(len(M)/8)]).tolist()
    Ntw=np.zeros([int(len(M)/8)]).tolist()
    Y=np.zeros([int(len(M)/8)]).tolist()
    YNt=np.zeros([int(len(M)/8)]).tolist()
    for j in range(int(len(M)/8)):
        X[j]=M[8*j+i][0]
        t[j]=dt.datetime.fromtimestamp(X[j]).isoformat().replace('T','  ')
        Y[j]=M[8*j+i][2]
        Ntw[j]=M[8*j+i][5]
        YNt[j]=Y[j]*Ntw[j]
        Nt[i][j]=M[8*j+i][5]
        T[i][j]=M[8*j+i][0]
    plt.figure(1)
    plt.plot(X,Y,'-'+c[i],label=M[i][1].decode('utf-8'))
    plt.figure(3)
    plt.plot(X,Ntw,'-'+c[i],label=M[i][1].decode('utf-8'))
    plt.figure(4)
    plt.plot(X,YNt,'-'+c[i],label=M[i][1].decode('utf-8'))
plt.figure(1)
plt.xticks(X[::4],t[::4],rotation='vertical')
plt.grid()
plt.legend()
plt.title('Sent Promedio')

plt.figure(3)
plt.xticks(X[::4],t[::4],rotation='vertical')
plt.grid()
plt.legend()
plt.title('Tuits por hora')

plt.figure(4)
plt.xticks(X[::4],t[::4],rotation='vertical')
plt.grid()
plt.legend()
plt.title('Sent*Ntuits')

# plt.figure(2)
# Tx=np.linspace(0.5,23.5,24).tolist()
# for i in range(8):
#     Xprod=np.zeros([24]).tolist()
#     Nprod=np.zeros([24]).tolist()
#     for j in range(int(len(M)/8)):
#         h=dt.datetime.fromtimestamp(T[i][j]).hour
#         Xprod[h]=Xprod[h]+Nt[i][j]
#         Nprod[h]=Nprod[h]+1
#     for j in range(24):
#         Xprod[j]=Xprod[j]/Nprod[j]
#     plt.plot(Tx,Xprod,label=M[i][1].decode('utf-8'))
# plt.grid()
# plt.xticks(Tx,Tx)
# plt.legend()
# plt.title('Distribucion horaria')
plt.show()
