from django.shortcuts import render
from django.http import JsonResponse
from .models import DivorceData
import json
# Create your views here.
from django.http import HttpResponse


def index(request):
    return render(request, 'index.html')

def display(request):
    return render(request, 'display.jsp')

def label(request):
    return render(request, 'search.jsp')

def similar(request):
    # POST = []
    # data = ...
    response = JsonResponse({'foo': 'bar'})
    return response

def query(request):
    raw_sql = 'select * from divorce_data limit 1'
    raw_querySet = DivorceData.objects.raw(raw_sql)
    # for obj in raw_querySet:
    #     print obj
    #     response = JsonResponse({'data': str(obj)})
    # response = JsonResponse({'data': raw_querySet[0].path.encode('utf-8')})
    # return response
    return HttpResponse(json.dumps(raw_querySet[0].content, ensure_ascii=False), content_type="application/json")
