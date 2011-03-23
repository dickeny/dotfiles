#!/usr/bin/env python
#
# yaml2json.py
'''
convert DJango's yaml fixtures to json fixtures
'''

import datetime
import os
import sys
import json as simplejson
import yaml


class JSONEncoder(simplejson.JSONEncoder):
    """
    JSONEncoder subclass that knows how to encode date/time and decimal types.
    """

    DATE_FORMAT = "%Y-%m-%d"
    TIME_FORMAT = "%H:%M:%S"

    def default(self, o):
        if isinstance(o, datetime.datetime):
            return o.strftime("%s %s" % (self.DATE_FORMAT, self.TIME_FORMAT))
        elif isinstance(o, datetime.date):
            return o.strftime(self.DATE_FORMAT)
        elif isinstance(o, datetime.time):
            return o.strftime(self.TIME_FORMAT)
        elif isinstance(o, decimal.Decimal):
            return str(o)
        else:
            print "fallback"
            return super(JSONEncoder, self).default(o)


def main(fname):
    print "dealing ", fname
    assert os.path.splitext(fname)[1] == ".yaml"

    with file(fname) as fp:
        d = yaml.load(fp)

    outname = os.path.splitext(fname)[0] + ".json"
    with open(outname, "wb") as fp:
        fp.write(JSONEncoder(indent=4).encode(d))

if __name__ == '__main__':
    main(sys.argv[1])

