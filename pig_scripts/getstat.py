#!/usr/bin/python
@outputSchema("value:chararray")
def getstat(url_query):
        if(url_query==1):
               return "STATUS_UNFETCHED"
        elif(url_query==2):
               return "STATUS_FETCHED"
        elif(url_query==3):
               return "STATUS_GONE"
        elif(url_query==4):
               return "STATUS_REDIR_TEMP"
        elif(url_query==5):
               return "STATUS_REDIR_PERM"
        elif(url_query==34):
               return "STATUS_RETRY"
        elif(url_query==38):
               return "STATUS_NOTMODIFIED"
        else: 
              return  url_query
