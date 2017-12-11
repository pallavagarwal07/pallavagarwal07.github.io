#!/usr/bin/env python2
from sys import argv
from re import sub
import pickle, os, sys

cacheDir = os.path.expanduser('~') + "/.cache/varstack"
try:
    os.makedirs(cacheDir)
except Exception as e:
    pass

cacheFile = cacheDir + "/cache"
if not os.path.exists(cacheFile):
    with open(cacheFile, 'wb') as f:
        pickle.dump({}, f)

f = open(cacheFile, 'rb')
b = pickle.load(f)
inp = unicode(open(argv[1]).read(), 'utf-8')
if inp in b:
    print " ".join(b[inp])
    exit(0)

from bs4 import BeautifulSoup as blsp
from markdown import markdown as mkdn
from topia.termextract import extract

extractor = extract.TermExtractor()
html = mkdn(inp)
text = ''.join(blsp(html, "html.parser").findAll(text=True))

whit = lambda x:sub('\s+', ' ', sub('[^\w]', ' ', x)).strip()

tags = extractor(text)
tags = sorted([(k[1],whit(k[0])) for k in tags if len(whit(k[0]))>1], reverse=1)
output = []
for tag in tags:
    output.append(tag[1]+":"+unicode(tag[0])+",")

b[inp] = output
with open(cacheFile, 'wb') as f:
    pickle.dump(b, f)

print " ".join(output)
