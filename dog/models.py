from __future__ import unicode_literals

from django.db import models

# Create your models here.


class DogInfo(models.Model):
    DogName = models.CharField(max_length=32)
    DogPrice = models.IntegerField()
    DogColor = models.CharField(max_length=32)
    DogImg = models.ImageField()
    DogDescribe = models.CharField(max_length=64)
    DogText = models.TextField()