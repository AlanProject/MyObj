from django.contrib import admin
import models
# Register your models here.


class DogInfoDisplay(admin.ModelAdmin):
    list_display = ['id','DogName','DogType','DogColor','DogImg','DogDescribe','DogText']
class DogTypeDisplay(admin.ModelAdmin):
    list_display = ['id','TypeName']
class UserProfileDisplay(admin.ModelAdmin):
    list_display = ['id','user','name']
admin.site.register(models.DogInfo,DogInfoDisplay)
admin.site.register(models.DogType,DogTypeDisplay)
admin.site.register(models.UserProfile,UserProfileDisplay)