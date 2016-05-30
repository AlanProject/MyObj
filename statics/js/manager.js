/**
 * Created by root on 2016/5/15.
 */
//获取数据
function GetCheck(){
    var id_list = [];
    $.each($(":checkbox"),function(){

        if ($(this).prop('checked')){
            var current_id = $(this).parent().siblings().first().html();
            id_list.push(current_id);
        }

    });
    return id_list
}

//删除
function DataDel(){
    var id_list = JSON.stringify(GetCheck());
    console.log(id_list);
    if (id_list){
        $.ajax({
            type:'POST',
            data:{"data":id_list},
            url:'article_del/',
            success:function (callback){
                $('#myModal').modal('hide');
                window.location.reload()
            }
        });
    }
}

//全选
function CheckAll(){
    $.each($("input"),function(){
        $(this).prop('checked',true)
    })
}

//取消全选
function CancleALL(){
    $.each($("input"),function(){
        if($(this).prop('checked')){
            $(this).prop('checked',false)
        }
    })
}


//编辑

function EditArticle(){
    var id = $(this).siblings();
    console.log(id)
}


//获取地址栏参数
function GetQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

$(document).ready(function() {
    //点击事件
    $('.nav-sidebar li').click(function(){
        var flg=$(this).attr('current_id');
        //获取a的herf属性拼接字符串；a的herf可设置成"javascript:;";阻止a的跳转事件；
        var url =$(this).find('a').attr('data-href')+"?flg="+flg;
        //窗口跳转
        window.location.href=url;
    });
    var myflg = GetQueryString("flg");
    $('.nav li[current_id="'+myflg+'"]').addClass('active').siblings('li').removeClass('active');
});