from partcorr import partialcorr
from sarimamodel import sarimagen
import numpy as np
# from matplotlib.pyplot import hist,show,grid

def pguess(AR = [],pmax = 0, nsample=0):
    '''
    Guess the value of the p parameter finding the maximum value of the partial autocorrelation function.

        INPUTS:
        --AR: Serie to find p
        --pmax: Maximum value to try
        --nsample: maximum number of values to use
        OUTPUT
        --guess: Found value
    '''
    #Checks that nsample has a valid value
    if nsample > len(AR)-pmax:
        nsample = len(AR)-pmax

    #Creates an empty matrix to fill with data from AR
    Input=np.zeros([nsample-pmax+1,pmax])
    for i in range(nsample-pmax+1):
        for j in range(pmax):
            Input[i,j]=AR[i+j]
    pt=partialcorr(Input)
    # plot(range(len(pt[0][0])),pt[0][0])
    # show()

    #Finds the max of the PTF


    pt=pt[0][0][1:]
    for i in range(len(pt)):
        if abs(pt[i])==max(abs(pt)):
            maxi=i

    #Finds the decay of the PTF
    for i in range(len(pt)-maxi):
         if abs(pt[maxi])/2 >= abs(pt[i+maxi]):
             return(i+maxi)
    return(maxi)



def qguess(MA = [],qmax = 0, nsample=0):
    '''
    Guess the value of the q parameter finding the maximum value of the partial autocorrelation function.

        INPUTS:
        --MA: Serie to find q
        --qmax: Maximum value to try
        --nsample: maximum number of values to use
        OUTPUT
        --guess: Found value
    '''
    #Checks that nsample has a valid value
    if nsample > len(MA)-qmax:
        nsample = len(MA)-qmax

    #Creates an empty matrix to fill with data from AR
    Input=np.zeros([nsample-qmax+1,qmax])
    pt=np.zeros([qmax]).tolist()
    for i in range(nsample-qmax+1):
        for j in range(qmax):
            Input[i,j]=MA[i+j]

    for i in range(qmax):
        c=np.corrcoef(Input[:][0],Input[:][i])
        pt[i]=c[0][1]
    # plot(range(len(pt[0][0])),pt[0][0])
    # show()

    #Finds the max of the ACF
    pt=np.asarray(pt[1:])
    print(pt)
    for i in range(len(pt)):
        if abs(pt[i])==max(abs(pt)):
            maxi=i

    #Finds the decay of the ACF
    for i in range(len(pt)-maxi):
         if abs(pt[maxi])/1.5 >= abs(pt[i+maxi]):
             return(i+maxi)
    return(maxi+1)



NTRY=200
nsample=200
# pmax=10

# pg=np.zeros([NTRY]).tolist()
# for i in range(NTRY):
#     # pdata=[np.random.rand()-0.5,np.random.rand()-0.5,np.random.rand()-0.5,np.random.rand()-0.5]
#     Pt=np.random.randint(7)+1
#     pdata=np.zeros([Pt]).tolist()
#     for j in range(Pt):
#         pdata[j]=np.power(-1,np.random.randint(2))*(np.random.rand()*0.6+0.2)
#     Data=sarimagen(p=pdata, n=nsample)
#     Pg=pguess(Data[0],pmax,nsample-pmax)
#     if Pg>=Pt:
#         pg[i]=1
#     else:
#         pg[i]==0
#     print(pdata)
#     print([Pt,Pg,pg[i]])
#     print()

# print(pg)
# print(sum(pg)/len(pg)*100)
# # hist(pg)
# # grid()
# # show()

qmax=5

qg=np.zeros([NTRY]).tolist()
for i in range(NTRY):
    # pdata=[np.random.rand()-0.5,np.random.rand()-0.5,np.random.rand()-0.5,np.random.rand()-0.5]
    Qt=np.random.randint(3)+1
    qdata=np.zeros([Qt]).tolist()
    for j in range(Qt):
        qdata[j]=np.power(-1,np.random.randint(2))*(np.random.rand()*0.6+0.2)
    Data=sarimagen(q=qdata, n=nsample)
    Qg=qguess(Data[0],qmax,nsample-qmax)
    if Qg>=Qt:
        qg[i]=1
    else:
        qg[i]==0
    print(qdata)
    print([Qt,Qg,qg[i]])
    print()

print(qg)
print(sum(qg)/len(qg)*100)
