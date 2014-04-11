#!/usr/bin/python

@outputSchema("url:chararray")
def fix(url):
       url="http://"+url
       return url
