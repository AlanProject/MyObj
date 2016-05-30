#!_*_ coding:utf-8 _*_
from dog import models
from paging import Paging
from jimi import settings
import json,platform,os
from django.shortcuts import HttpResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import requires_csrf_token

# Create your views here.

@login_required
def manager(request, argv):
    current = request.GET.get('curpag')
    counts = models.DogInfo.objects.count()
    dbdata = models.DogInfo.objects.all()
    pagobj = Paging(current=current, counts=counts, dbdata=dbdata)
    pag_data = pagobj.handle()
    if argv == '1':
        return render(request, 'manager_article.html', pag_data)
    elif argv == '2':
        dbdata = models.DogType.objects.all().values()
        return render(request, 'manager_section.html', {'dbdata':dbdata})
    else:
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


@login_required
@requires_csrf_token
def article_del(request):
    print 'start'
    if request.method == 'POST':
        id_list_tmp = json.loads(request.POST.get('data'))
        for i in id_list_tmp:
            article_id = int(i)
            article_info = models.DogInfo.objects.get(id=article_id)
            article_info.delete()
            file_del(article_info.DogImg.name)
        return HttpResponse('ok')
    else:
        return HttpResponse('get')