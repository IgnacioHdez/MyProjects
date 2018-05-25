
# coding: utf-8

# In[ ]:

#Esta clase es de prueba

class complejo:
    #Here I define the creator
    def __init__(self,r,i):
        self.r=r
        self.i=i
    
    def __str__(self):
        if self.i<0:
            return(str(self.r)+str(self.i)+'i')
        else:
            return(str(self.r)+'+'+str(self.i)+'i')
    

