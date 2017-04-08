#!/usr/bin/env python
# -*- coding: utf-8 -*
from django.shortcuts import render
from django.http import JsonResponse
from .models import DivorceData
import json
# Create your views here.
from django.http import HttpResponse
from gensim import corpora, models, similarities
import jieba.posseg as pseg
import time
import sys
import os
import datetime


models_loaded = False
full_path = os.path.realpath(__file__)
if models_loaded == False:
    stdout = sys.stdout
    reload(sys)
    sys.stdout = stdout
    sys.setdefaultencoding('utf-8')
    tic = time.time()
    # load the model, corpus and dictionary
    file_path = '%s/vecmodel/lsi.model' % os.path.dirname(full_path)
    lsi_model = models.LsiModel.load(file_path, mmap='r')
    file_path = '%s/vecmodel/dictionary.dict' % os.path.dirname(full_path)
    dictionary = corpora.Dictionary.load(file_path)
    file_path = '%s/vecmodel/cases.mm' % os.path.dirname(full_path)
    corpus = corpora.MmCorpus(file_path)

    print time.time() - tic

    # get the stopword list
    file_path = '%s/vecmodel/stopword_origin.txt' % os.path.dirname(full_path)
    words = open(file_path, 'r')
    stopword = words.read()
    words.close()

    print time.time() - tic

    # get the corpus
    file_path = '%s/vecmodel/texts.txt' % os.path.dirname(full_path)
    infile = open(file_path, 'r')
    texts = infile.readlines()
    for i in range(len(texts)):
        texts[i] = texts[i].split()
    infile.close()

    print time.time() - tic

    # load the index
    file_path = '%s/vecmodel/sims.index' % os.path.dirname(full_path)
    sims_index = similarities.MatrixSimilarity.load(file_path)

    print time.time() - tic
    models_loaded = True
    print("load over")


def index(request):
    return render(request, 'index.html')


def display(request):
    return render(request, 'display.jsp')


def label(request):
    return render(request, 'search.html')

def people(request):
    return render(request, 'people.html')

def introduction(request):
    return render(request, 'introduction.html')


def similar(request):
    stdout = sys.stdout
    reload(sys)
    sys.stdout = stdout
    sys.setdefaultencoding('utf-8')
    intext = "和一二三离婚,暴力倾向，有精神病史"
    if request.is_ajax() and request.method == 'GET':
        for key in request.GET:
            intext = key
    intext = intext.encode("utf8")
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
    global stopword
    seg = set(words) - set(stopword)

    tmp_text = ""
    for word in seg:
        if (word != '   ') and (word != '\r') and (word != '\t') and (word != ' '):
            tmp_text += (str(word) + ' ')

    res = {}
    if len(tmp_text.split()):
        global dictionary
        vec_bow = dictionary.doc2bow(tmp_text.lower().split())
        global lsi_model
        vec_lsi = lsi_model[vec_bow]
        global sims_index
        sims = sims_index[vec_lsi]
        sims = sorted(enumerate(sims), key=lambda item: -item[1])

        global texts
        if sims[0][1] < 0.13:
            print sims[0][1]
            print "Similar file does not exist in the database."
        else:
            count = 0
            for item in sims:
                count += 1
                tid = texts[item[0]][0]
                res[str(count)] = DivorceData.objects.get(id=tid).content
                if count > 20:
                    break

    print time.time()-tic
    response = HttpResponse(json.dumps(res, ensure_ascii=False), content_type="application/json;charset=utf-8")
    return response


def query(request):
    lb_ref = {'JTBL':'lb1', 'CH':'lb2', 'ND':'lb3', 'YQ':'lb4', 'YTRTJ':'lb5', 'YCCC':'lb6',
              'ZYCC':'lb7', 'BMCC':'lb8', 'HSCC':'lb9', 'WZZW':'lb10', 'CLFH':'lb11',
              'AZB':'lb12', 'DB':'lb13', 'XD':'lb14', 'CJ':'lb15', 'FC':'lb16', 'FLF':'lb17',
              'SPF':'lb18', 'FWCQ':'lb19', 'ZFGJJ':'lb20', 'SFZS':'lb21', 'JSB':''}
    vl_ref = {u'on':True,'':False}
    cond_list = ['JSB', 'JRSF', 'XLBM', 'SWSF']
    time_list = ['QSRQ', 'JSRQ']
    condi = {'JSB':{'0':'mental_pros', '1':'mental_def'},
             'JRSF':{'0':'soldier_pros', '1':'soldier_def'},
             'XLBM':{'0':'missing_pros', '1':'missing_def'},
             'SWSF':{'0':'foreign_pros', '1':'foreign_def'}}
    first_filter = True
    time_limit = {'QSRQ':None, 'JSRQ':None}
    if request.is_ajax() and request.method == 'GET':
        kw = {}
        for key in request.GET:
            print key
            valuelist = request.GET.getlist(key)
            print valuelist[0]
                # if first_filter == True:
                    # kw[lb] =
                    # lbid = 'lb'+str(lb_ref[key])
                    # query_data = DivorceData.objects.filter(lbid=True)
                # query_data = query_data.filter
            if valuelist[0]!='':
                kw_key = ''
                if key in cond_list and valuelist[0] != '':
                    if valuelist[0] == 'BOTH':
                        kw[condi[key][str(1)]] = True
                        kw[condi[key][str(0)]] = True
                    elif valuelist[0] == 'YG':
                        kw[condi[key][str(1)]] = True
                    elif valuelist[0] == 'BG':
                        kw[condi[key][str(0)]] = True
                elif key in time_list:
                    time_limit[key] = valuelist[0]
                else:
                    kw[lb_ref[key]] = vl_ref[valuelist[0]]
    print(kw)
    print(time_limit)
    query_result = DivorceData.objects.filter(**kw)
    if time_limit['QSRQ'] != None:
        date = datetime.datetime.strptime(time_limit['QSRQ'], "%Y-%m-%d")
        print(date)
        query_result = query_result.filter(casedate__gte=date)
    if time_limit['JSRQ'] != None:
        date = datetime.datetime.strptime(time_limit['JSRQ'], "%Y-%m-%d")
        print(date)
        query_result = query_result.filter(casedate__lte=date)
    res_dict = {}
    cnt = 0
    for obj in query_result[:20]:
        res_dict[cnt] = obj.content
        cnt += 1
    # raw_sql = 'select * from divorce_data limit 1'
    # raw_querySet = DivorceData.objects.raw(raw_sql)
    # for obj in raw_querySet:
    #     print obj
    #     response = JsonResponse({'data': str(obj)})
    # response = JsonResponse({'data': raw_querySet[0].path.encode('utf-8')})
    # return response
    # print (raw_querySet[0].content)
    return HttpResponse(json.dumps(res_dict, ensure_ascii=False), content_type="application/json;charset=utf-8")
