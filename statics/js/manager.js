/**
 * Created by root on 2016/5/15.
 */
//删除
function GetCheck(){
    var id_list = [];
    $.each($(":checkbox"),function(){
        if ($(this).prop('checked')){
            var current_id = $(this).parent().siblings().first().html();
            id_list.push(current_id);
        }
    });
    return id_list;
}

//$('#myModal').on('shown.bs.modal', DataDel());

function DataDel(){
    var id_list = JSON.stringify(GetCheck());
    if (id_list){
        $.post(
            'article_del/',
            {'data':id_list},
            function (data,success){
                $('#myModal').modal('hide');
                window.location.reload()
            }
        )

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


//++++++++++++++++++++++++摸态框++++++++++++++++++++++
//$("#myModal").modal().css({
//                 "margin-top":$(this).height()/3}
//);
