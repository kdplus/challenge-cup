from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.
from django.http import HttpResponse


def index(request):
    return render(request, 'page/index.html')

def similar(request):
    # POST = []
    # data = ...
    response = JsonResponse({'foo': 'bar'})
    return response