import urllib.request as url  # Package to read urls and download images
import bs4 as bs              # Package to find information in the url
import os as os               # Package to manage directories

# ----------------Set up initial variables---------------
Dirbase = "http://www.fowtcg.com/card/"
carminnum = 100     # Including
carmaxnum = 5000    # Including

print('Setting url path as: '+Dirbase)
print('Downloading from index '+str(carminnum)+' to '+str(carmaxnum))
# ----------------Start the loop------------------------
for i in range(carminnum, carmaxnum+1):
    print('    Start iteration for index: '+str(i))
    try:
        # ----------------Get the url data-----------------------
        Dir = Dirbase + str(i)
        print('        Fetching URL: ' + Dir)

        page = url.urlopen(Dir)
        sp = bs.BeautifulSoup(page, "lxml")
        
        #----------------Get the card name information----------
        cardname  = sp.find('div',class_='prop-item col-xs-4')
        #Name
        cardname  = cardname.find('p',class_='prop-value').string
        cardname  = cardname.replace('*','')
        cardname  = cardname +  '_' + str(i) + ".jpg" 
        print('        Card name set as: ' + cardname)
        
        #Image url
        imagedir = sp.find('div',class_='ps-gallery').figure.a.get("href")
        
        #Directory to save
        
        namepos=cardname.find('-')
        if namepos==-1:
            directory = 'Extras'
        else:
            directory = cardname[0:namepos]
        print('        Card Directory set as: ' + directory)
        
        #----------------Check if already exists----------------
        if os.path.exists(directory + '\\' + cardname):
            print('        Card already exists'+'\033[93m')
        else:    
            #----------------Create the directory--------------------
            if os.path.isdir(directory)==False:
                os.mkdir(directory)  
        
            #----------------Download the card----------------------
            print('        Card Downloading...')
            savedir=directory + '\\' + cardname
            url.urlretrieve(imagedir,savedir)
            print('        Card Download '+'Successful'+'\033[92m')
            
    except:
        print('        No page found for index: ' + str(i) +'\033[91m')
    print('    End iteration for index: '+str(i))
    print()

print('End Process')
