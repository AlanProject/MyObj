#!/usr/bin/env python
#-*- coding:utf-8 -*-

# 设置分页的阈值、比如每10条数据一页 这里设置10


class Paging(object):
    def __init__(self, current, counts, dbdata, number=10):
        self.number = number
        # 获取数据总条数
        self.counts = counts
        # 获取所有数据
        self.obj = dbdata
        self.current = current
        self.total = divmod(self.counts, self.number)[0]
        self.surplus = divmod(self.counts, self.number)[1]
        if self.surplus > 0:
            self.total += 1
    # 主调度程序
    def handle(self):
        if self.current:
            self.current = int(self.current.strip('/'))
        else:
            self.current = 1
        data = self.pag_current().values()
        number_list = self.pag_change()
        return {'data': data, 'number_list': number_list, 'count': self.number, 'total': self.total}

    # 获取当前页码的所有数据并返回
    def pag_current(self):
        self.current -= 1
        start = self.current*self.number
        end = start+self.number
        data = self.obj[start:end]
        return data

    # 页码分篇
    def pag_change(self):
        start = self.current-5
        end = self.current+4
        if start < 1:
            start = 1
            end = self.number
        if end > self.total:
            end = self.total
            # start = self.total-9
        return range(start, end+1)