from django.contrib import admin
import models
# Register your models here.


class DogInfoDisplay(admin.ModelAdmin):
    list_display = ['id','DogName','DogPrice','DogColor','DogImg','DogDescribe','DogText']

admin.site.register(models.DogInfo,DogInfoDisplay)