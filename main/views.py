from django.http import HttpRequest, HttpResponse
from django.shortcuts import render

from .models import Product

# Create your views here.
def index(request: HttpRequest) -> HttpResponse:
    products = Product.objects.all()
    return render(request, "index.html", {"datas": products})