'''
Set of functions created to work with the ARIMA model
'''

'''
--INDEX--
1: argen
2: magen
3: armagen
4: arimagen
5: sarimagen
'''




import partcorr
import numpy as np
import numpy.random as rnd
import scipy.special as sp

#argen Function--------------------------------------------------------------------------------------------------------
def argen(P, n, s = 1, AR = []):
    '''
    This fucntion generates an autoregresive serie of n values. It can continue an input serie AR.
    The new values are added to the end of AR

        INPUTS:
        =======

        --P:  (List)    The list of coeficients [c,a1,a2,...]. It must have the size p+1

        --n:  (int)     The number of values to be added

        --s:  (float)   The deviation of the random numbers. If none it is assumed as 1

        --AR: (List)    The initial serie of data used to calculate the next results.
                        If the size is smaller than the size of P-1 then zeros are added to the beggining.
                        If none the values are created assuming a serie of zeroes.

        OUTPUT:
        =======

        --result: (List)    The given serie with the new n values added to the end
    '''

    #Saves the size of the input to calculate the sixe of the output
    sizeAR=len(AR)

    #Checks if the provided AR has the required size for P-1. If not zeros are added
    if len(P)-1 > len(AR):
        AR=np.zeros([len(P)-1 - len(AR)]).tolist() + AR

    #Here starts the AR process
    for i in range(n):                      #For every new number to be added
        if s==0:                             #Only if s is not 0 I add an error
            newAR=P[0]
        else:
            newAR=P[0]+rnd.normal(scale=s)      #First I sum the constant and the random number

        for j in range(len(P)-1):               #Then I sum the previous elements ponderated
            newAR=newAR+P[j+1]*AR[-j-1]             #P[1]*AR[-1]+P[2]*AR[-2]...
        AR=AR+[newAR]                        #Finally I append the result to the serie

    #Now I erase the initial zeros added virtualy
    result=[]
    for i in range(sizeAR+n):
        result=[AR[-i-1]]+result
    return(result)

#End of the function argen---------------------------------------------------------------------------------------------


#magen Function--------------------------------------------------------------------------------------------------------
def magen(Q, n, s = 1, MA=[], Er=[0]):
    '''
    This fucntion generates a moving average serie of n values. It can continue a serie MA with errors Er.
    The new values are added to the end of MA

        INPUTS:
        =======

        --Q:  The vector of coeficients [m,q1,q2,...]. It must have the size q+1

        --n:  The number of valueºs to be added

        --s:  The deviation of the random numbers. If none it is assumed as 1

        --MA: The initial serie of data used to calculate the next results.
              It requires an Error vector to work. The size must be bigger than Q-1.
              If none the values are created assuming a serie of zeroes.

        --Er: The error associated to the MA serie. If its size is smaller than Q-1 it is filled with zeros

        OUTPUT:
        =======

        --[[OutMA],[OutEr]]: A list of lists wherethe first element is the MA serie generated and OutEr the associated Error
    '''
    #Saves the size of the input to calculate the sixe of the output
    sizeMA=len(MA)


    #Checks the size of the given error, if any, and add zeros to reach Q-1
    if len(Q)-1 > len(Er):
        Er=np.zeros([len(Q)-1 - len(Er)]).tolist() + Er

    #Here starts the MA process
    for i in range(n):                      #For every new number to be added
        newEr=rnd.normal(scale = s)         #FIrst I calculate the new Error Value
        newMA=Q[0]+newEr                    #Then I sum it with the average to the new MA value

        for j in range(len(Q)-1):               #Then I sum the previous errors ponderated
            newMA=newMA+Q[j+1]*Er[-j-1]             #Q[1]*Er[-1]+Q[2]*Er[-2]..

        for j in range(len(Q)-2):               #Afeter sum I rearange the error list
            Er[j]=Er[j+1]                       #I move every value one position to the left
        Er[len(Q)-2]=newEr                      #I add the newEr to the end
        MA=MA+[newMA]                        #Finally I append the Ma result to the MA serie

    #Now I erase the initial zeros added virtualy
    result=[]
    for i in range(sizeMA+n):
        result=[MA[-i-1]]+result

    return([result,Er])

#End of the function magen---------------------------------------------------------------------------------------------

#armagen Function------------------------------------------------------------------------------------------------------
def armagen(P, Q, n, s = 1, ARMA = [], Er = [0]):
    '''
    This fucntion generates an ARMA serie of n values. It can continue a serie ARMA with errors Er.
    The new values are added to the end of ARMA

        INPUTS:
        =======

        --P:  (List)    The list of coeficients [c,a1,a2,...]. It must have the size p+1

        --Q:  (List)    The vector of coeficients [m,q1,q2,...]. It must have the size q+1

        --n:  (Int)     The number of valueºs to be added

        --s:  (Float)   The deviation of the random numbers. If none it is assumed as 1

        --ARMA: (List)  The initial serie of data used to calculate the next results.
                        It requires an Error vector to work. The size of the Er must be bigger than Q-1.
                        If none the values are created assuming a serie of zeroes.

        --Er: (List)    The error associated to the MA serie. If its size is smaller than Q-1 it is filled with zeros

        OUTPUT:
        =======

        --[[OutARMA],[OutEr]]: A list of lists wherethe first element is the ARMA serie generated and OutEr the associated Error
    '''
    #Saves the size of the input to calculate the sixe of the output
    sizeARMA=len(ARMA)

    for i in range(n):                      #For every new term of the serie
        ARMATemp=ARMA
        newAR=argen(P, 1, s = 0, AR = ARMATemp) #Caluclates the AR part
        newMA=magen(Q, 1, s, MA = ARMATemp, Er = Er)      #Calculates the MA part
        Tot=newAR[-1]+newMA[0][-1]
        ARMA=ARMA+[Tot] #Sums the results
        Er=newMA[1]                         #Saves the error of the MA

    result=[]
    for i in range(sizeARMA+n):
        result=[ARMA[-i-1]]+result

    return([result,Er])

#End of the function armagen-------------------------------------------------------------------------------------------


#armagen Function------------------------------------------------------------------------------------------------------
def arimagen(P, d, Q, n, s = 1, ARIMA = [], Er = [0]):
    '''
    This fucntion generates an ARIMA serie of n values. It can continue a serie ARIMA with errors Er.
    The new values are added to the end of ARIMA

        INPUTS:
        =======

        --P:  (List)    The list of coeficients [c,a1,a2,...]. It must have the size p+1

        --d:  (Int)     The order of the integrtion.differentiation parameter

        --Q:  (List)    The vector of coeficients [m,q1,q2,...]. It must have the size q+1

        --n:  (Int)     The number of valueºs to be added

        --s:  (Float)   The deviation of the random numbers. If none it is assumed as 1

        --ARIMA: (List)  The initial serie of data used to calculate the next results.
                        It requires an Error vector to work. The size of the Er must be bigger than Q-1.
                        If none the values are created assuming a serie of zeroes.

        --Er: (List)    The error associated to the MA serie. If its size is smaller than Q-1 it is filled with zeros

        OUTPUT:
        =======

        --[[OutARIMA],[OutEr]]: A list of lists wherethe first element is the ARIMA serie generated and OutEr the associated Error
    '''
    #Saves the size of the input to calculate the sixe of the output
    sizeARIMA=len(ARIMA)


    for i in range(n):                      #For every new term of the serie
        newARMAEr=armagen(P,Q,1,s,ARIMA,Er)   #I caluclate the new ARMA term
        newI=0                                  #I calculate separately the I term
        for j in range(d):
            if len(ARIMA)<d:
                newI=0
            else:
                newI=newI + np.power(-1,j)*ARIMA[-j-1]*sp.binom(d,j+1)
        ARIMA=ARIMA+[newARMAEr[0][-1]+newI]     #I sum all the contributions
        Er=newARMAEr[1]                         #I save the error term
    result=[]
    for i in range(sizeARIMA+n):
        result=[ARIMA[-i-1]]+result

    return([result,Er])

#End of the function armagen-------------------------------------------------------------------------------------------


#sarimagen Function------------------------------------------------------------------------------------------------------
def sarimagen(p=[], d=0, q=[],c=0, P=[], D=0, Q=[], S = 0, n=1, std = 1, SARIMA = [], Er = []):
    '''
    This fucntion generates an SARIMA serie of n values. It can continue a serie SARIMA with errors Er.
    The new values are added to the end of ARIMA

        INPUTS:
        =======

        Arima non-seasonal:

        --p:  (List)    The list of coeficients [p1,p2,...].

        --d:  (Int)     The order of the integrtion.differentiation parameter

        --q:  (List)    The vector of coeficients [q1,q2,...].

        --c:  (Float)   Constant shift for the first term.

        Seasonal Arima:

        --P:  (List)    The list of coeficients [A1,A2,...]. It must have the size p

        --D:  (Int)     The order of the integrtion.differentiation parameter

        --Q:  (List)    The vector of coeficients [Q1,Q2,...]. It must have the size q

        --S:  (Int)     The period of the season

        General inputs:

        --n:  (Int)     The number of valueºs to be added

        --s:  (Float)   The deviation of the random numbers. If none it is assumed as 1

        --SARIMA: (List)    The initial serie of data used to calculate the next results.
                            It requires an Error vector to work. The size of the Er must be bigger than Q-1.
                            If none the values are created assuming a serie of zeroes.

        --Er: (List)    The error associated to the MA serie. If its size is smaller than Q-1 it is filled with zeros

        OUTPUT:
        =======

        --[[OutSARIMA],[OutEr]]: A list of lists wherethe first element is the ARIMA serie generated and OutEr the associated Error
    '''

    #---DATA SAVING---

    #Saves the size of the input to calculate the sixe of the output
    sizeSARIMA=len(SARIMA)

    #---INITIAL CHECKS---

    #Checks that S is bigger than p, q and d
    if S==0 :
        P=[]
        Q=[]
        D=0
    else :
        if S<=len(P) or S<=len(q) or S <=d :
            print("ERROR: S must be bigger for than the given values of p, q and d. Exiting opperation with error -1")
            return(-1)

    #Checks if the provided SARIMA has the required size for p+S+P. If not zeros are added
    if len(p)+S+len(P) > len(SARIMA):
        SARIMA=np.zeros([len(P) + S + len(p) - len(SARIMA)]).tolist() + SARIMA

    #Checks if the provided Er has the required size for q+S+Q. If not zeros are added
    if len(q)+S+len(Q) > len(Er):
        Er=np.zeros([len(q) + S + len(Q) - len(Er)]).tolist() + Er

    if d+S+D > len(SARIMA):
        SARIMA=np.zeros([d + S + D - len(SARIMA)]).tolist() + SARIMA


    #---SARIMA CALCULATIONS---

    #Caluclates the minimum number of iterations for the process
    Iter= max([d,len(p),len(q)]) + max([D,len(P),len(Q)])

    for i in range(n) :                      #For every new requested term of the serie:
        NewEr=rnd.normal(scale = std)             #I generate the new Er term
        NewTerm=c+NewEr                         #I sum the new Er and the cosntant term c)
        # print('SARIMA input')
        # print(SARIMA)
        # print('Error')
        # print(Er)
        # print('New Error')
        # print(NewEr)
        for j in range(Iter) :                  #For every previous relevant term of the serie:
            # print('ITERATION')
            # print(j)
            cut=max([d,len(p),len(q)])
            if j < cut :     #In non-Seasonal period
                # print('--NO SEASON')
                if j < len(p) :                     #AR Term
                    NewTerm=NewTerm + SARIMA[-j-1]*p[j]     #X[-1]p[0]+X[-2]p[1]...
                    # print('Calculated AR for j = '+str(j))
                if j < len(q) :                     #MA Term
                    NewTerm=NewTerm + Er[-j-1]*q[j]         #Er[-1]q[0]+...
                    # print('Calculated MA for j = '+str(j))
                if j < d :                          #I Term
                    NewTerm=NewTerm + np.power(-1,j)*SARIMA[-j-1]*sp.binom(d,j+1)
                    # print('Calculated I for j = '+str(j))

            else :          #In Seasonal Period
                # print('--IN SEASON')
                js=S+j-cut
                # print('[j,S,js,cut]')
                # print([j,S,js,cut])
                if j-cut < len(P) :                     #AR Term
                    NewTerm=NewTerm + SARIMA[-js-1]*P[j-cut]     #X[-1]p[0]+X[-2]p[1]...
                    # print('Calculating AR for SARIMA['+str(-js-1)+'] and P['+str(j-cut)+']')
                if j-cut < len(Q) :                     #MA Term
                    NewTerm=NewTerm + Er[-js-1]*Q[j-cut]         #Er[-1]q[0]+...
                    # print('Calculating MA for SARIMA['+str(-js-1)+'] and Q['+str(j-cut)+']')
                if j-cut < D :                          #I Term
                    NewTerm=NewTerm + np.power(-1,j-cut)*SARIMA[-js-1]*sp.binom(D,j+1-cut)
                    # print('Calculating I for SARIMA['+str(-js-1)+']')

        SARIMA=SARIMA+[NewTerm]     #I save the results
        Er=Er+[NewEr]               #I save the Errors
        # print('Result')
        # print(SARIMA)
        # print()

    #Prepare the OutPut
    SARIMAOut=[]
    ErOut=[]
    for i in range(sizeSARIMA+n):
        SARIMAOut=[SARIMA[-i-1]]+SARIMAOut
        ErOut=[Er[-i-1]]+ErOut

    #Return
    return([SARIMAOut,ErOut])

#End of the function sarimagen-------------------------------------------------------------------------------------------


#Tests:
# from matplotlib.pyplot import plot,show,grid

# P=[0.5,-0.5,0.2]
# N=30
# x=argen(P,N,s=0.3)
# x.append(10)
# x=argen(P, N, AR = x)
# plot(range(2*N+1),x,'o-')
# show()

# Q=[0,-0.2,0.5,-0.4]
# N=20
# y=magen(Q,N,s=0.3)
# y[1][-1]=10
# y[0].append(10)
# y=magen(Q,N,MA=y[0], Er=y[1])
# plot(range(2*N+1),y[0],'o-')
# show()

# d=2
# Q=[0,0.5]
# N=20
# z=arimagen(P,d,Q,N,s = 0.3)
# y[1][-1]=10
# y[0].append(10)
# y=magen(Q,N,MA=y[0], Er=y[1])
# plot(range(N),x,'o-b',label='AR')
# plot(range(N),y[0],'o-r',label='MA')
# plot(range(N),z[0],'o-g',label='ARIMA')
# legend()
# show()

# p=[-0.2,-0.1]
# q=[0.1]
# d=1
# c=0
# S=10
# P=[-0.2,-0.1]
# Q=[-0.1]
# D=0
# Ninit=20
# Nsim=10
# n=1000
# z0=sarimagen(p,d,q,c,P,D,Q,S,Ninit,std=0.1)
# plot(range(Ninit),z0[0])
# for i in range(n):
#     z=sarimagen(p,d,q,c,P,D,Q,S,Nsim,std = 0.1,SARIMA = z0[0],Er = z0[1])
#     plot(range(Ninit,Ninit+Nsim),z[0][Ninit:])
# #plot([0,10,20,30,40,50,60,70,80,90,100],np.zeros([11]).tolist(),'ok')
# grid()
# #legend()
# show()
