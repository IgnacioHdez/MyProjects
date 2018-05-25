import twitter as tw

with open("MyCred.dat","r") as myfile:
    creds=myfile.readlines()
for i in range(len(creds)):
    creds[i]=creds[i].replace('\n','')

api=tw.Api(consumer_key=creds[0],
           consumer_secret=creds[1],
           access_token_key=creds[2],
           access_token_secret=creds[3])
