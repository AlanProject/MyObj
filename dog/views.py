#!-*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.core.exceptions import ObjectDoesNotExist
import models
from forms import ArticleForm,head_img
# Create your views here.
def index(request):
    big = []
    inside = []
    small = []
    dog_data = models.DogInfo.objects.all().values()
    for dog in dog_data:
        if dog['DogType_id'] == 1:
            big.append(dog)
        elif dog['DogType_id'] == 2:
            inside.append(dog)
        else:
            small.append(dog)

    return render(request, 'index.html',{'big':big,'inside':inside,'small':small})

def new_article(request):
    if request.method == 'POST':
        form = ArticleForm(request.POST,request.FILES)
        if form.is_valid():
            form_data = form.cleaned_data
            form_data['Author_id'] = request.user.userprofile.id
            new_img_path = head_img(request,request.FILES['DogImg'])
            form_data['DogImg'] = new_img_path
            aritcle_obj = models.DogInfo(**form_data)
            aritcle_obj.save()
            return render(request, 'new.html', {'aritcle_obj':aritcle_obj})
        else:
            print('err:',form.errors)
    DogType_list = models.DogType.objects.all().values_list()
    return render(request,'new.html', {'DogType_list':DogType_list})


def acc_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

def acc_login(request):
    err_msg =''
    if request.method == "POST":

        username = request.POST.get('username')
        password = request.POST.get('passwd')
        user = authenticate(username=username,password=password)
        if user is not None:
            login(request,user)
            return HttpResponseRedirect('/')
        else:
            err_msg = "Wrong username or password!"
    return render(request,'login.html',{'err_msg':err_msg})


def article(request,article_id):
    try:
        data = models.DogInfo.objects.get(id=article_id)
        return render(request, 'article.html',{'data':data})
    except ObjectDoesNotExist as e:
        return render(request,'404.html')