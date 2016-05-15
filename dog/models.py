from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class DogInfo(models.Model):
    DogName = models.CharField(max_length=32)
    DogColor = models.CharField(max_length=32)
    DogImg = models.ImageField()
    DogDescribe = models.CharField(max_length=64)
    DogText = models.TextField()
    DogType = models.ForeignKey('DogType')
    Create_date = models.DateField(auto_now_add=True)
    Update_date = models.DateField(auto_now=True)
    Author = models.ForeignKey('UserProfile')

class DogType(models.Model):
    TypeName = models.CharField(max_length=32)

class UserProfile(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length=32)