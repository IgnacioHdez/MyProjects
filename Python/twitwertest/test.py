'''
2017-06-21        piopio.py

This program follows a list of topics saved in file topics.dat on twitter and calculates the sentiment polarity every 15 min. Then it saves the results at feedback.dat

feedback.dat:

Timestamp   Topic   Sentiment   LastID  Ntuits  NValidTuits (SentSTD)
'''

import datetime as dt               #Package to manage date and time
import twitter as tw                #Package to manage the searches on twitter
from textblob import TextBlob       #Package to manage the tex sentiment analysis
import os                           #Package to manage the OS
import numpy as np                  #Package to manage nuerical operations
import time as tm                   #Package to manage time waiting

def getinfo(Nsearch) :
    '''
    This is the operation that will be done every 15 min
    '''

    #----------Get the Topics----------

    #Read the file of topics and save to topics[i]
    with open("topics.dat","r") as myfile:
        topics=myfile.readlines()
    for i in range(len(topics)):
        topics[i]=topics[i].replace('\n','')

    #Save the number of topics as Ntopics
    Ntopics=len(topics)

    #----------Do login in Twitter----------

    #Get the credentials
    with open("MyCred.dat","r") as myfile:
        creds=myfile.readlines()
    for i in range(len(creds)):
        creds[i]=creds[i].replace('\n','')

    #Do login on twitter
    api=tw.Api(consumer_key=creds[0],
               consumer_secret=creds[1],
               access_token_key=creds[2],
               access_token_secret=creds[3])

    #----------Gets the last IDs for each topic----------

    #Checks if the feedback file exits
    if os.path.isfile("/home/ignacio/Projects/Results/feedback.dat"):
        #If it exists then it gets the lastID of the Ntopics last lines
        lastID=np.genfromtxt("../Results/feedback.dat",delimiter='\t',usecols=(3))
        lastID=lastID[-Ntopics:].tolist()
    else:
        #If it doesn't exists then it creates a serie of zeros
        lastID=np.zeros([Ntopics]).tolist()

    #----------Gets the tuits for every topic------------

    #I set up the counters to 0
    ctSearches=0
    ctTuits=np.zeros([Ntopics]).tolist()
    ctValidTuits=np.zeros([Ntopics]).tolist()
    Sent=np.zeros([Ntopics]).tolist()
    ctIDReached=np.zeros([Ntopics]).tolist()
    maxid=np.zeros([Ntopics]).tolist()
    maxIDsave=np.zeros([Ntopics]).tolist()

    print('Starting Operation at ' + dt.datetime.today().isoformat())
    #For every topic (i)
    while ctSearches<Nsearch:
        for i in range(Ntopics):
            #If lastID has not been reached
            if ctIDReached[i]==0:
                #Fisrt I do the search
                if maxid[i]==0:
                    twit=api.GetSearch(term=topics[i],count=100,result_type="recent",lang='en')
                else:
                    twit=api.GetSearch(term=topics[i],count=100,result_type="recent",max_id=maxid[i]-1,lang='en')
                ctSearches=ctSearches+1
                maxid[i]=twit[-1].id
                #For each of the cathced tuits(j)
                for j in range(len(twit)):
                    if twit[j].id>lastID[i]:    #if the ID is larger than lastID
                        ctTuits[i]=ctTuits[i]+1
                        #I analyse the text
                        tx = TextBlob(str(twit[j].text.encode('utf-8')))
                        pop = tx.sentiment.polarity
                        #If pop is exactly 0 then it is not valid
                        if pop != 0:
                            ctValidTuits[i]=ctValidTuits[i]+1
                            Sent[i]=Sent[i]+pop
                        maxIDsavetemp=twit[j].id
                        maxIDsave[i]=max([maxIDsavetemp,maxIDsave[i]])
                    else:                       #I save that the last ID has been reached
                        ctIDReached[i]=1
                        break
                if ctSearches>=Nsearch:
                    break

    #----------Save the results----------

    #I collect the useful data
    TStamp=round(dt.datetime.today().timestamp())
    for i in range(Ntopics):
        if ctValidTuits[i]==0:
            Sent[i]=0
        else:
            Sent[i]=Sent[i]/ctValidTuits[i]

    #I write it into a file
    for i in range(Ntopics):
        with open("/home/ignacio/Projects/Results/feedback.dat","a") as f:

            f.write(str(TStamp))
            f.write('\t')
            f.write(topics[i])
            f.write('\t')
            f.write(str(Sent[i]))
            f.write('\t')
            f.write(str(maxIDsave[i]))
            f.write('\t')
            f.write(str(ctTuits[i]))
            f.write('\t')
            f.write(str(ctValidTuits[i]))
            f.write('\n')

    print('End of Operation at ' + dt.datetime.today().isoformat())
    print()
    return None



#Set the directory of the executable
os.chdir("/home/ignacio/Projects/Send/")
T=dt.datetime.today()
while True:
    print(abs((dt.datetime.today()-T).total_seconds()))
    if abs((dt.datetime.today()-T).total_seconds()) > 60*15 :
        getinfo(180)
        T=dt.datetime.today()
    else:
        tm.sleep(55)
print('End')
