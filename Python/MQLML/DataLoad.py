'''Read data from MQL5 generated file'''

from pandas            import read_csv, DataFrame
from datetime          import datetime
from numpy             import linspace
from matplotlib.pyplot import plot, show



# Definition of the class MoneyTree to manage the data extracted from MTL5

class MoneyTree:
    """ Class to manage data from MQL"""
    # ---------------------------Inicialization function---------------------------
    def __init__(self,FileName = "EURUSDM1.csv", FileDir = '/mnt/c/Users/Ignacio/AppData/Roaming/MetaQuotes/Terminal/D0E8209F77C8CF37AD8BF550E51FF075/MQL5/Files'): 
        """Initial Function: Reads the data from files and join it"""
        
        #Extraction of the raw data from the reference file
        self.DATA = read_csv(FileDir+'/'+FileName, delimiter=",",encoding='UTF-16') # RAW Data
        
        #TEMP
        self.DATA = self.DATA.drop(columns=['FRA_1','FRA_2'])

        # Extraction of Number of observation, stock name and period
        self.NObs   = len(self.DATA.DATE)              # Number of observations
        self.stock  = FileName[0:3]+'/'+FileName[3:6]  # Name of the stock exchange
        self.period = FileName[6:8]                    # Period of the original char
        
        # Generate a file with the price and indicators only
        self.DATAInd = self.DATA.drop(columns = ['DATE','TIME'])

        # Generate a list of dates and time
        TimeRef   = self.DATA[['DATE','TIME']]
        for i in range(self.NObs):
            auxdate = str(TimeRef.DATE[i]) 
            auxtime = str(TimeRef.TIME[i])
            if len(auxtime)==3:
                auxtime='0'+auxtime
            
            if len(auxtime)==2:
                auxtime='00'+auxtime
            
            if len(auxtime)==1:
                auxtime='000'+auxtime


            year   = int(auxdate[0:4])
            month  = int(auxdate[4:6])
            day    = int(auxdate[6:8])
            hour   = int(auxtime[0:2])
            minute = int(auxtime[2:4])
            second = 0
            
            if i == 0:
                self.DTime = [datetime(year,month,day,hour,minute,second)]
            else:
                self.DTime.append(datetime(year,month,day,hour,minute,second))
            self.normt = linspace(1,0,self.NObs)
            
    # -----------------------------Data Resume function--------------------------------
    def DataResume(self):
        """Print a resume of the data loaded"""
        
        print("        This is a resume for the MoneyTree object:")
        print("            - Stock: "+self.stock)
        print("            - Number of obsermations = "+str(self.NObs))
        print("            - Period: "+self.period) 
        print("            -","Data from ",self.DTime[0]," to ",self.DTime[self.NObs-1])
        print("            -","Mean price = ",self.DATAInd['OPEN'].mean())
        print("            - List of columns:")
        print("                - "+"\n                - ".join(self.DATAInd.columns.values))
    

    # -----------------------------Correlation matrix function--------------------------------
    def CorrMat(self):
        Mcorr = self.DATAInd.corr()
        return(Mcorr)

    # -----------------------------Train/Test sample generation function--------------------------------
    def GenTrainTest(self,TrainFactor = 0.8,Nsample = 5,Nforward = 3,Ycolumn = 'CLOSE'):   # <-- Only for backtesting models
        ''' Generates dataframes for a train and a test data (Train for training a model and test for testing it
                TrainFactor: from 0 to 1 the realitve amount of data for training'''
        
        # Separe the Train and the Test Data
        NTrain = int(self.NObs*TrainFactor)
        XTrain = self.DATAInd[ (self.NObs - NTrain) : self.NObs]
        XTest  = self.DATAInd[ 0 : (self.NObs - NTrain)]

        YTrain = self.DATA[Ycolumn][ (self.NObs - NTrain + 1) : self.NObs]
        YTest  = self.DATA[Ycolumn][ 0 : (self.NObs - NTrain + 1)]

        #Create a list with the Xs and the Ys normalizing each data to the mean
        XTrainList=[]
        for i in range(NTrain-Nsample+1):
            AuxDataInd = XTrain[i:i+Nsample]
            TempList=[]
            for col in AuxDataInd.columns.values:
                x = AuxDataInd[col].tolist()
                for j in range(Nsample):
                    TempList.append(x[j])
            XTrainList.append(TempList)

    # -----------------------------KNN model for prediction function--------------------------------
    def KNNPred(self, Nforward = 5, Nsample = 10):
        # Calculate initial factors
        NGroups = self.NObs - Nsample +1
        NSampleGroups = NGroups - Nforward

        # For each forward to be calculated
#Testing:

print("Loading data")
M = MoneyTree("EURUSDM1.csv",'/mnt/c/Users/Ignacio/AppData/Roaming/MetaQuotes/Terminal/D0E8209F77C8CF37AD8BF550E51FF075/MQL5/Files')
M.DataResume()
M.GenTrainTest()
# print("Correlations")
# n = M.CorrMat()
# print (n.to_string())
# print(n['OPEN']['OPEN'])
