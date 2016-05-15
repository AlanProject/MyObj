/**
 * Created by root on 2016/5/15.
 */
function DataDel(argv){

}

function CheckAll(){
    $.each($("input"),function(k,v){
        $(this).attr('checked','checked')
    })
}


function CancleALL(){
    $.each($("input"),function(k,v){
        if($(this).attr('checked')){
            $(this).removeAttr('checked')
        }
    })
}