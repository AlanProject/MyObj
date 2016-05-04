#!/usr/bin/env python
#-*- coding:utf-8 -*-
from django import forms
import os
class ArticleForm(forms.Form):
    DogName = forms.CharField(max_length=255,min_length=2)
    DogDescribe  = forms.CharField(max_length=255,min_length=5)
    DogType_id = forms.IntegerField()
    DogImg = forms.ImageField()
    DogText = forms.CharField(min_length=10)

def head_img(request,f):
    base_img_upload_path = 'statics/imgs'
    user_path = "%s/%s" %(base_img_upload_path,request.user.userprofile.id)
    if not os.path.exists(user_path):
        os.mkdir(user_path)
    with open("%s/%s" %(user_path,f.name), 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)
    return  "/static/imgs/%s/%s" %(request.user.userprofile.id,f.name)