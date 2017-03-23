#!/usr/bin/env python
# -*- coding: utf-8 -*

from gensim import corpora, models, similarities

import sys
stdout = sys.stdout
reload(sys)
sys.stdout = stdout
sys.setdefaultencoding('utf-8')

'''
Module name: initModel
Purpose: create corpus and lsimodel based on existing data
Author: : Zian Zhao
Version: 1.0 3.6,1017
'''

'''
Module name: initModel
Revision: store the similarity matrix
Author: : Zian Zhao
Version: 1.1 3.7,1017
'''

# get the corpus
infile = open('texts.txt', 'r')
texts = infile.readlines()
for i in range(len(texts)):
    texts[i] = texts[i].split()
infile.close()

# model 只需要2选1
# create and save the dictionary
dictionary = corpora.Dictionary(texts)
dictionary.save('dictionary.dict')
corpus = [dictionary.doc2bow(text) for text in texts]
corpora.MmCorpus.serialize('cases.mm', corpus)

# create and save the tf-idf model
# tf_idf = models.TfidfModel(corpus)
# tf_idf.save('tfidf.model')

# create and save the LSI model
lsi_model = models.LsiModel(corpus, id2word=dictionary)
lsi_model.save('lsi.model')

# create the similar matrix
index = similarities.MatrixSimilarity(lsi_model[corpus])
index.save('sims.index')
