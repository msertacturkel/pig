#!/usr/bin/python
@outputSchema("value:chararray")
def sg(url_query):
        if(url_query.startswith( 'sg', 0, 2 )):
                   return url_query
