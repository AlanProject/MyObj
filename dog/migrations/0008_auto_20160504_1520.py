# -*- coding: utf-8 -*-
# Generated by Django 1.9.4 on 2016-05-04 07:20
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dog', '0007_auto_20160504_1518'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='doginfo',
            name='DogType',
        ),
        migrations.DeleteModel(
            name='DogType',
        ),
    ]