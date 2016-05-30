#!/usr/bin/env python
#-*- coding:utf-8 -*-
from django.conf.urls import url
from manager import views
urlpatterns = [
    url(r'^article_del/', views.article_del, name="article_del"),
    url(r'^(\d*)', views.manager, name="manager"),
]
