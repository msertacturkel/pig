#!/usr/bin/python

@outputSchema("url:chararray")
def unreverse(rvsdurl):
        buf = ""
        pathbegin = rvsdurl.find("/")
        if pathbegin is -1:
            pathbegin = len(rvsdurl)
        sub = rvsdurl[0:pathbegin]
        splits = sub.split(":")
        if len(splits) is 2:
            buf += splits[1]
            buf += "://"
            reverse = splits[0]
            dotsplits = reverse.split(".")
            if len(dotsplits) > 0:
                for i in range(len(dotsplits) - 1, 0, -1):
                    buf += dotsplits[i]
                    buf += "."
                buf += dotsplits[0]
            else:
                buf += splits[0]
        if len(splits) is 3:
            buf += ":"
            buf += splits[2]
        buf += rvsdurl[pathbegin:]
        return str(buf)

