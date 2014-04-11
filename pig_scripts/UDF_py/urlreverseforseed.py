#!/usr/bin/python

@outputSchema("url:chararray")
def unreverse(rvsdurl):
	if not "." in rvsdurl: return "sertac"
	else:
		x=rvsdurl.split(".")
		if(len(x)>=2):
			url="http://www."+x[1]+"."+x[0]
			return url
		return "sertac"

