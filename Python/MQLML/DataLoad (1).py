'''Read data from MQL5 generated file'''

from pandas import read_csv, DataFrame
from numpy  import linspace

def MqlLoad(FileName = "Export.csv", FileDir = 'C:\\Users\\Ignacio\\AppData\\Roaming\\MetaQuotes\\Terminal\\776D2ACDFA4F66FAF3C8985F75FA9FF6\\MQL5\\Files'):
    """Loads data from a csv file exported from mql5"""
    print("    Reading file " + FileName)
    
    #Data read
    DATA = read_csv(FileDir+'\\'+FileName, delimiter=",",encoding='UTF-16')
    
    #Export generation
    EXP  = DataFrame
    
    EXP.Short     = DATA.ShortMA-min(DATA.ShortMA)    # Normalized Short MA
    EXP.Long      = DATA.LongMA-min(DATA.LongMA)     # Normalized Long MA
    EXP.Close     = DATA.CLOSE-min(DATA.CLOSE)      # Normalized Closing prizes

    
    EXP.N         = len(DATA.TIME)                  # Number of observations
    EXP.Time      = linspace(0,1,EXP.N)             # Normalized Time vector
    EXP.Short     = EXP.Short/max(EXP.Short)    # Normalized Short MA
    EXP.Long      = EXP.Long/max(EXP.Long)     # Normalized Long MA
    EXP.Close     = EXP.Close/max(EXP.Close)      # Normalized Closing prizes
    EXP.DiffShort = EXP.Short.diff()*1e6            # First Short Differences
    EXP.DiffLong  = EXP.Long.diff()*1e6             # First Long Differences
    
    print("    Number of observations =  " + str(EXP.N))
    return(EXP)
    








