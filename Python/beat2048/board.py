from numpy import zeros,array_str
from numpy.random import randint,rand

#This file will save the class board definition and how to create adn represent it.
class board:

    #Here I will define the creator:
    def __init__(self, M=None):
        #If there is no board input then I create it
        if M==None:
            self.T=zeros([4,4])
            self.NewPiece()
            self.NewPiece()
        else:
            self.T=M;

    #Here I define how to print
    def __str__(self):
        sr=array_str(self.T)
        return ( sr )

    #Here I define how to place a new piece
    def NewPiece(self):
        #Finds a position empty randomly to place a new piece
        x=randint(0,3)+1
        y=randint(0,3)+1
        while self.T[x,y]!=0:
            x=randint(0,3)+1
            y=randint(0,3)+1

        #Finds the value to place
        val=2
        if rand()<0.2:
            val=4;
        self.T[x,y]=val

    def Move(self,dire):
        #UP
        if dire=='u':
            print('Move up')
            #Sum the pairs
            for j in range(4):
                for i in range(3):
                    if self.T[i,j]==self.T[i+1,j] and self.T[i,j]!=0:
                        self.T[i,j]=self.T[i,j]+self.T[i+1,j]
                        self.T[i+1,j]=0
            #Move up
            for j in range(4):
                for i in range(3):
                    if self.T[i,j]==0:
                        self.T[i,j]=self.T[i+1,j]
                        self.T[i,j]=0


#Here I do the tests

B1=board()
print(B1)
B1.Move('u')
print(B1)
