#!-*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
import models
from forms import ArticleForm,head_img
# Create your views here.
def index(request):

    return render(request, 'index.html')

def new_article(request):
    if request.method == 'POST':
        form = ArticleForm(request.POST,request.FILES)
        if form.is_valid():
            form_data = form.cleaned_data

            form_data['author_id'] = request.user.userprofile.id

            new_img_path = head_img(request,request.FILES['DogImg'])
            form_data['DogImg'] = new_img_path
            new_article_obj = models.DogInfo(**form_data)
            new_article_obj.save()
            return render(request, 'new.html', {'new_article_obj':new_article_obj})
        else:
            print('err:',form.errors)
    DogType_list = models.DogType.objects.all().values_list()
    return render(request,'new.html', {'categroy_list':DogType_list})


def acc_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

def acc_login(request):
    err_msg =''
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username,password=password)
        if user is not None:
            login(request,user)
            return HttpResponseRedirect('/')
        else:
            err_msg = "Wrong username or password!"
    return render(request,'login.html',{'err_msg':err_msg})