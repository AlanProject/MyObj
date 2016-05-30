/**
 * Created by jhwangyl2 on 2016/5/26.
 */

//获取当前页码列表
function getlist(){
    console.log('ok');
    var data = $('.pagination').children();
    var pag_list = [];
    $.each(data,function(k,v){
        if ($(v).attr('tag') == 'pag'){
            var num = $(v).children().html();
            num = Number(num);
            pag_list.push(num)
        }
    });
    return pag_list
}

//获取当前点击的选项
function action(args){
    //从前端获取当前
    var total = Number($('.pagination').attr('total'));
    var count = Number($('.pagination').attr('count'));
    var data = getlist();
    var new_list = [];
    if (args == 'Next'){
        console.log(data.length);
        if (total <= count){
            for ( var i=1;i<=total;i++){
                new_list.push(i)
            }
        }else{
            var end = data[count-1]+count;
            if (end >= total){
                var start = total-count-1;
                for ( var i=start;i<=total;i++){
                    new_list.push(i)
                }
            }else{
                $.each(data, function (k,v) {
                    v += count;
                    new_list.push(v)
                })
            }
        }
    }else if(args == 'Previous'){
        if (count >= total){
            for (var i=1;i<=total;i++){
                new_list.push(i)
            }
        }else if (data[0]-count <= 1){
            for (var i=1;i<=count;i++){
                new_list.push(i)
            }
        }else{
                $.each(data, function (k,v) {
                    v -= count;
                    new_list.push(v)
                })
            }
    }
    update(new_list);
}

//根据选项对列表页码进行处理并返回
function update(data){
    var head = '<li><a onclick="action('+"'Previous'"+')"'+'aria-label="Previous"' +'><span >&laquo;</span></a></li>';
    var html = '';
    var end = '<li><a onclick="action('+"'Next'"+')"'+'aria-label="Next"' +'><span >&raquo;</span></a></li>';
    for ( var i in data){
        html += '<li tag="pag"><a href="?curpag='+data[i]+'">'+data[i]+'</a></li>'
    }
    html = head + html + end;
    $('.pagination').html(html);
}



