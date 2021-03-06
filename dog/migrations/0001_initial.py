# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-03 09:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DogInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('DogName', models.CharField(max_length=32)),
                ('DogPrice', models.IntegerField()),
                ('DogColor', models.CharField(max_length=32)),
                ('DogImg', models.ImageField(upload_to=b'')),
                ('DogDescribe', models.CharField(max_length=64)),
                ('DogText', models.TextField()),
            ],
        ),
    ]
