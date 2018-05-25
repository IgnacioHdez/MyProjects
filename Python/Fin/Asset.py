# Import the required libraries
from numpy import asarray,mean,std,cov,zeros,size,exp,real,conj,pi,sqrt,linspace
from numpy.linalg import inv
from pylab import grid,show,figure,rand,xlabel,ylabel
from yahoo_finance import Share

#Assert: Stores the hsitorical data asociated to an asset-------------------------------------------------------------
class Asset:
    #Creator: A set of data is required------------------------------------------------------
    def __init__(self, dat):
        #dat must be a numpy array
        self.dat=dat

    #Imports an asset from yahoo------------------------------------------------------------
    def fromYH(share, t0 ,tf):
        #dat must be a numpy array
        yahoo = Share(share)
        x=yahoo.get_historical(t0,tf)
        o=asarray([float(q['Open']) for q in x])
        c=asarray([float(q['Close']) for q in x])
        dat=(o+c)/2
        ast=Asset(dat)
        return ast

    #Expected Return: Returns the mean of the data-------------------------------------------
    def r(self):
        return mean(self.dat)

    #Std: Returns the standard deviation-----------------------------------------------------
    def s(self):
        return std(self.dat)

    #Covariance: Returns the covariance of an asset with an other----------------------------
    def cov(self,As2):
        c=cov(self.dat,As2.dat)
        return c[0][1]

    def fft(self,k,t):
        m=self.r()
        p=zeros(size(k))
        for h in range(size(k)):
            su=0+0j
            for i in range(size(self.dat)):
                su=su+(self.dat[i]-m)/m*exp(1j*t[i]*k[h])
            p[h]=real(su*conj(su)/(2*pi))
        return p



#Portfolio: Stores a collection of assets-----------------------------------------------------------------------------
class pfl:

    #Creator: Assets and weighs must be given-----------------------------------------------
    def __init__(self,assets,weighs):
        #assets must be an asset array
        self.Asts=assets
        self.w=weighs/sum(weighs)

    #Set w: Creates a valid vector of weighs------------------------------------------------
    def set_w(self,we):
        we=we/sum(we)
        self.w=we

    #Expected Return: Calculates the return of the portfolio--------------------------------
    def r(self):
        rs=0
        for i in range(size(self.Asts)):
            rs=rs+self.w[i]*self.Asts[i].r()
        return rs

    #Std: Calculates the standard deviation of the portfolio--------------------------------
    def s(self):
        N=size(self.Asts)
        s=0
        for i in range(N):
            for j in range(N):
                if i==j:
                    s=s+(self.w[i]*self.Asts[i].s())**2
                if i!=j:
                    s=s+self.w[i]*self.w[j]*self.Asts[i].cov(self.Asts[j])
        return sqrt(s)

    #Calculates the minimum variance portfolio for a given return---------------------------
    def optimw(self,obj):
        # I build the matrix of correlation + constrains
        N=size(self.Asts)
        M=zeros([N+2,N+2])
        v=zeros(N+2)
        for i in range(N+2):
            for j in range(N+2):
                if i<N and j<N:
                    M[i,j]=self.Asts[i].cov(self.Asts[j])
                if i<N and j==N:
                    M[i,j]=-self.Asts[i].r()
                    M[i,j+1]=-1
                if i==N and j<N:
                    M[i,j]=self.Asts[j].r()
                    M[i+1,j]=1
                if i>=N and j>=N:
                    M[i,j]=0
            if i<N:
                v[i]=0
            if i==N:
                v[i]=obj
                v[i+1]=1
        Mp=inv(M)
        w=Mp.dot(v)
        z=zeros(N)
        for i in range(N):
            z[i]=w[i]
        self.set_w(z)
        return 0

    #Calculates the minimum variance portfolio-----------------------------------------------
    def optim_minvar(self,n):
        N=size(self.Asts)
        rs=zeros(N)
        for i in range(N):
            rs[i]=self.Asts[i].r()
        mx=max(rs)
        mn=min(rs)
        mobj=mn
        smin=100
        for m in linspace(mn,mx,n):
            self.optimw(m)

            if self.s()<smin:
                mobj=m
                smin=self.s()

        self.optimw(mobj)
        return 0

    #Calculates the max rate portfolio--------------------------------------------------------
    def optim_maxr(self,n):
        N=size(self.Asts)
        rs=zeros(N)
        for i in range(N):
            rs[i]=self.Asts[i].r()
        mx=max(rs)
        mn=min(rs)
        mobj=mn
        for m in linspace(mn,mx,n):
            self.optimw(m)
            if self.r()>mobj and self.s()<self.r():
                mobj=m

        self.optimw(mobj)
        if self.s()>self.r():
            print('ERROR: maxr not possible')
            return 0


        return 0


    #Creates a plot in the r-s diagram of n random points------------------------------------
    def plotPT(self,n):
        N=size(self.Asts)
        PLtest=self
        fig=figure()
        ax=fig.add_subplot(1,1,1)
        for i in range(n):
            PLtest.set_w(rand(N))
            ax.scatter(PLtest.s(),PLtest.r(),color='black',s=1)
        ax.scatter(self.s(),self.r(),color='red',s=10)
        xlabel('$\sigma$')
        ylabel('r')
        grid()
        show()

    def plotminvarset(self,n):
        Temp=self
        N=size(self.Asts)
        rs=zeros(N)
        for i in range(N):
            rs[i]=self.Asts[i].r()
        mx=max(rs)
        mn=min(rs)

        Temp.optimw(mn)
        P1=Temp

        Temp.optimw(mx)
        P2=Temp

        fig=figure()
        ax=fig.add_subplot(1,1,1)
        PLtest=Temp
        for i in linspace(-100,100,n):
            PLtest.set_w(i*P1.w + (1-i)*P2.w)
            ax.scatter(PLtest.s(),PLtest.r(),color='black',s=1)
        ax.scatter(self.s(),self.r(),color='red',s=10)
        xlabel('$\sigma$')
        ylabel('r')
        grid()
        show()
