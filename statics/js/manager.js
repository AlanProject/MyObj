/**
 * Created by root on 2016/5/15.
 */
//删除
function GetCheck(){
    var id_list = [];
    $.each($(":checkbox"),function(){
        if ($(this).prop('checked')){
            console.log($(this));
            var current = $(this).siblings().first();
            //id_list.append(current)
            console.log(current)
        }
    });
    //console.log(id_list)
}

//function DataDel(argv){
//    if (GetCheck()){
//
//    }
//
//}

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


//++++++++++++++++++++++++摸态框++++++++++++++++++++++
//$("#myModal").modal().css({
//                 "margin-top":$(this).height()/3}
//);
