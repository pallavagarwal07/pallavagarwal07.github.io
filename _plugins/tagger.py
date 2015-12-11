#!/usr/bin/env python2
from bs4 import BeautifulSoup as blsp
from markdown import markdown as mkdn
from topia.termextract import extract
from sys import argv
from re import sub

extractor = extract.TermExtractor()

html = mkdn(unicode( open(argv[1]).read(), 'utf-8' ))
text = ''.join(blsp(html).findAll(text=True))

whit = lambda x:sub('\s+', ' ', sub('[^\w]', ' ', x)).strip()

tags = extractor(text)
tags = sorted([(k[1],whit(k[0])) for k in tags if len(whit(k[0]))>1], reverse=1)
for tag in tags:
    print tag[1]+":"+unicode(tag[0])+",",
