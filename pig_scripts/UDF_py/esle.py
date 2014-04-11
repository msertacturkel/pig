#!/usr/bin/python

@outputSchema("url:chararray")
def esle(url,cc,uygunsuz,spam,bozuk,devlet):
       if(cc!=None):
                url=url+"\t"+"nutch.score="+str(cc)
       if(uygunsuz!="" or spam!="" or bozuk!="" or devlet!=""):
		url=url+"\t"+"userType="       
       
       if(uygunsuz != None):
		url=url+uygunsuz
       if(spam != None):
		url=url+spam
       
       if(bozuk != None):
		url=url+bozuk
       if(devlet != None):
		url=url+devlet	 
       return url
