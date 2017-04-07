#!/usr/bin/env python
# -*- coding: utf-8 -*

from gensim import corpora, models, similarities
import jieba.posseg as pseg
import time

import sys
stdout = sys.stdout
reload(sys)
sys.stdout = stdout
sys.setdefaultencoding('utf-8')

'''
Module name: similarity
Purpose: find the most similar case according to the description
Author: : Zian Zhao
Version: 1.0 3.7,1017
'''

'''
Module name: similarity
Revision: delete the named entity
Author: : Zian Zhao
Version: 1.1 3.8,1017
'''
tic = time.time()
# load the model, corpus and dictionary
lsi_model = models.LsiModel.load('lsi.model', mmap='r')
dictionary = corpora.Dictionary.load('dictionary.dict')
corpus = corpora.MmCorpus('cases.mm')

print time.time()-tic

# get the stopword list
words = open('stopword_origin.txt', 'r')
stopword = words.read()
words.close()

print time.time()-tic

# get the corpus
infile = open('texts.txt', 'r')
texts = infile.readlines()
for i in range(len(texts)):
    texts[i] = texts[i].split()
infile.close()

print time.time()-tic

# load the index
index = similarities.MatrixSimilarity.load('sims.index')

print time.time()-tic

intext = "ABC和一二三离婚,暴力倾向，有精神病史"
words = list(set(pseg.cut(intext)))
for i in range(len(words)):
    if words[i].flag[:2] == 'nr':
        if 1 < len(words[i].word) < 5:
            words[i] = 0
    else:
        pos = str(words[i]).index('/')
        words[i] = str(words[i])[:pos]

while True:
    try:
        words.remove(0)
    except:
        break

seg = set(words) - set(stopword)

tmp_text = ""
for word in seg:
    if (word != '   ') and (word != '\r') and (word != '\t') and (word != ' '):
        tmp_text += (str(word) + ' ')

if len(tmp_text.split()):

    vec_bow = dictionary.doc2bow(tmp_text.lower().split())
    vec_lsi = lsi_model[vec_bow]
    sims = index[vec_lsi]
    sims = sorted(enumerate(sims), key=lambda item: -item[1])

    if sims[0][1] < 0.2:
        print sims[0][1]
        print "Similar file does not exist in the database."
    else:
        count = 0
        for item in sims:
            count += 1
            print texts[item[0]][0]
            if count > 20:
                break

print time.time()-tic
