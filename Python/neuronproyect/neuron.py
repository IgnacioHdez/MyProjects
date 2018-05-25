#CLASS NEURON: THIS WILL WILL DEFINE THE PROPERTIES OF THE CLASS NEURON AND ITS MAIN FUNCTIONS

from numpy import zeros, tanh, asarray, linspace
from numpy.linalg import norm
from numpy.random import rand

class NeuronNet:
    
    #---Creator of the neuron-----------------------------------------------------------------------------------------------
    def __init__(self,Nneurons):
        #Nneurons: Array storing number of neurons per layer including inputs and outputs in the first and the last
        #Each layer will be stored in a list including input and outputs called 'cells'
        #Connections will be stored as a matrix [layer][from][to] called 'w'
        print('Creating neural network formed by '+str(len(Nneurons))+' layers')
        if (len(Nneurons) < 2):
            print('    ERROR: -Wrong number of layers.')
            print('           -Number of neurons must be an array of dimension at least 2 [Nin,...,Nout]')
            return
        self.cells=[]
        self.w=[]
        self.N=Nneurons
        for i in range(len(Nneurons)):
            self.cells.append(zeros(Nneurons[i]).tolist())
            if i<(len(Nneurons)-1):
                self.w.append((2*rand(Nneurons[i],Nneurons[i+1])-1).tolist())
        print('Neural network created\n')
    
    #---Set some initial values---------------------------------------------------------------------------------------------
    def input(self,x):
        #print('Setting '+str(x)+' as input')
        #Checks dimensionalty
        if len(x)!=len(self.cells[0]):
            print('    ERROR: Number of input cells and input data dimension must match')
            return
        #If dimensions are ok then:
        self.cells[0]=x
        #print('Input stored\n')
    
    #---Moves the data to the next layer------------------------------------------------------------------------------------
    def step(self,fromlayer):
        #print('Operating step from layer '+str(fromlayer))
        if fromlayer>len(self.N)-1:
            print('    ERROR: layer number out of range.')
            return
        for i in range(self.N[fromlayer+1]):
            s=0.0
            for j in range(self.N[fromlayer]):
                s=s+self.cells[fromlayer][j]*self.w[fromlayer][j][i]
            self.cells[fromlayer+1][i]=tanh(s)
        self.cells[fromlayer]=zeros(self.N[fromlayer]).tolist()
        #print('Operation completed succesfully\n')
    
    #---Calculates the result of f(x)---------------------------------------------------------------------------------------
    def Apply(self,x):
        #print('Applying '+str(x)+' to neural network')
        self.input(x)
        for i in range(len(self.N)-1):
            self.step(i)
        result=self.cells[-1]
        self.cells[-1]=zeros(self.N[-1]).tolist()
        #print('Operation completed\n')
        return(result)
    
    #---Calculates the error for y=f(x)-------------------------------------------------------------------------------------
    def error(self,x,y):
        Error=0
        for i in range(len(x)):
            r=self.Apply(x[i])
            Error=Error+norm(asarray(y[i])-asarray(r))*norm(asarray(y[i])-asarray(r))
        return(Error/2/len(x))
    
    #---Trains the network with the gradient method-------------------------------------------------------------------------
    def TrainGrad(self,x,y,Nt,cut):
        print('Starting training')
        #First we calculate the gradient
        #LF=linspace(2*self.error(x,y),0,Nt)
        #LF=linspace(0.1,0.1,Nt)
        LF=0.1
        for n in range(Nt):
            print('Trial number '+str(n+1))
            dw=[]
            #i is the layer
            for i in range(len(self.N)-1):
                #j is the cell in the current layer
                for j in range(len(self.cells[i])):
                    #k is the cell in the next layer
                    for k in range(len(self.cells[i+1])):
                        dw0=self.error(x,y)
                        Ntemp=self
                        Ntemp.w[i][j][k]=self.w[i][j][k]+0.01
                        dw1=Ntemp.error(x,y)
                        dw.append((dw1-dw0)/(0.01))
            #Now dw is the gradient
            h=0;
            for i in range(len(self.N)-1):
                #j is the cell in the current layer
                for j in range(len(self.cells[i])):
                    #k is the cell in the next layer
                    for k in range(len(self.cells[i+1])):
                        self.w[i][j][k]=self.w[i][j][k]-LF*dw[h]
                        h=h+1
            LF=self.error(x,y)/1.1
            print('  Error = '+str(LF*1.5))
            if LF*1.5<cut:
                print('---->Precision limit reached')
                break
                

    #---Trains the network with the gradient method adding errors--------------------------------------------------------------------
    def TrainRandGrad(self,x,y,Nt,cut,randf):
        print('Starting training')
        #First we calculate the gradient
        #LF=linspace(2*self.error(x,y),0,Nt)
        #LF=linspace(0.1,0.1,Nt)
        LF=0.1
        for n in range(Nt):
            print('Trial number '+str(n+1))
            dw=[]
            #i is the layer
            for i in range(len(self.N)-1):
                #j is the cell in the current layer
                for j in range(len(self.cells[i])):
                    #k is the cell in the next layer
                    for k in range(len(self.cells[i+1])):
                        dw0=self.error(x,y)
                        Ntemp=self
                        Ntemp.w[i][j][k]=self.w[i][j][k]+0.01
                        dw1=Ntemp.error(x,y)
                        dw.append((dw1-dw0)/(0.01))
            #Now dw is the gradient
            h=0;
            for i in range(len(self.N)-1):
                #j is the cell in the current layer
                for j in range(len(self.cells[i])):
                    #k is the cell in the next layer
                    for k in range(len(self.cells[i+1])):
                        self.w[i][j][k]=self.w[i][j][k]-LF*dw[h]
                        if rand()<randf/len(self.cells[i+1])/len(self.cells[i])/(len(self.N)-1) and n<Nt*2/3:
                            self.w[i][j][k]=2*rand()-1
                        h=h+1
            LF=self.error(x,y)/1.5
            print('  Error = '+str(LF*1.5))
            if LF*1.5<cut:
                print('---->Precision limit reached')
                break
            


