#!-*- coding:utf-8 -*-
from django.shortcuts import render,HttpResponse,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
import models
from jimi import settings
from paging import Paging
import time,json,platform,os
from forms import ArticleForm,head_img
from django.views.decorators.csrf import requires_csrf_token
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
@login_required
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
            return render(request, 'article_put.html', {'aritcle_obj':aritcle_obj})
        else:
            print('err:',form.errors)
    DogType_list = models.DogType.objects.all().values_list()
    return render(request, 'article_put.html', {'DogType_list':DogType_list})


def acc_logout(request):
    logout(request)
    return HttpResponseRedirect('/')

def acc_login(request):
    err_msg =''
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('passwd')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            return HttpResponseRedirect('/manager')
        else:
            err_msg = "Wrong username or password!"
    return render(request, 'login.html', {'err_msg':err_msg})


def article(request, article_id):
    try:
        data = models.DogInfo.objects.get(id=article_id)
        return render(request, 'article.html',{'data':data})
    except ObjectDoesNotExist as e:
        return render(request, '404.html')

@login_required
def manager(request, argv):
    current = request.GET.get('curpag')
    counts = models.DogInfo.objects.count()
    dbdata = models.DogInfo.objects.all()
    pagobj = Paging(current=current, counts=counts, dbdata=dbdata)
    pag_data = pagobj.handle()


    if argv == '1':
        article_data = models.DogInfo.objects.all().values()
        pag_data['article_data']=article_data
        return render(request, 'manager_article.html', pag_data)
    elif argv == '2':

        section_data = models.DogType.objects.all().values()
        pag_data['article_data']=section_data
        return render(request, 'manager_section.html', pag_data)
    else:
        article_data = models.DogInfo.objects.all().values()
        pag_data['article_data']=article_data
        return render(request, 'manager_article.html', pag_data,)
# 处理图片附件路径
def path_format(args):
    system = platform.system()
    if system == 'Windows':
        args = args.replace('\\','/')
    return args
# 删除图片文件
def file_del(filename):
    data =filename.split('imgs')
    for k,v in settings.STATICFILES_DIRS:
        if k == 'imgs':
            path = path_format(v)
            path += data[1]
            os.remove(path)

@requires_csrf_token
def article_del(request):
    if request.method == 'POST':
        id_list_tmp = json.loads(request.POST.get('data'))
        for i in id_list_tmp:
            article_id = int(i)
            article_info = models.DogInfo.objects.get(id = article_id)
            article_info.delete()
            file_del(article_info.DogImg.name)
        return HttpResponse('ok')
    else:
        return HttpResponse('get')


# def sceneImgUpload(request):
#     if request.method == 'POST':
#         callback = request.GET.get('CKEditorFuncNum')
#         try:
#             path = "uploads/" + time.strftime("%Y%m%d%H%M%S",time.localtime())
#             f = request.FILES["upload"]
#             file_name = path + "_" + f.name
#             des_origin_f = open(file_name, "wb+")
#             for chunk in f.chunks():
#                 des_origin_f.write(chunk)
#             des_origin_f.close()
#         except Exception, e:
#             print e
#         res = "<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'/"+file_name+"', '');</script>"
#         return HttpResponse(res)
#     else:
#         pass

