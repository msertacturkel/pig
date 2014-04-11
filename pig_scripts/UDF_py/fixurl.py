#!/usr/bin/python

@outputSchema("url:chararray")
def fix(url):
       url=url[:-1]
       return url
