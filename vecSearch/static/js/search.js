var page = 1;
var page_num;
var arr;
$(function(){
    var params = JSON.parse($('#params').val());
    $('#page_1').hide();
    $('#page_2').hide();
    $('#page_3').html(1);
    $('#page_4').html(2);
    $('#page_5').html(3);
    $.post("php/search.php",
        {
            params:params,
            page:page
        },
        function (data, status){
            if (status == "success"){
                $('.loading').hide();
                //alert(data);
                console.log(data);
                arr = JSON.parse(data);
                page_num = arr['page_num'];
                var len = Object.keys(arr).length - 1;
                for (var i = 0; i < len - 1; ++i){
                    $('.text-center').before($('.list-group').eq(0).clone());
                }
                if (len > 0){
                    $('.list-group').show();
                }
                var i = 0;
                for (var id in arr){
                    if (id == 'page_num'){
                        continue;
                    }
                    $('.list-group').eq(i).find("input[type='hidden']").val(id);

                    i += 1;
                }
                init();
                initPage();
                show_container(arr);
            }
        }

    );

});

function init(){
    $('.list-group').click(function(){
        $('.loading').show();
        $.post("php/get_doc.php",
            {
                id: $(this).find("input[type='hidden']").val()
            },
            function (data, status){
                if (status == 'success'){
                    $('.loading').hide();
                    console.log(data);
                    var content = JSON.parse(data);
                    $('#myModal .modal-body').html(content);
                    $('#myModal').modal('show');

                }
            }
        );

    });
}

function initPage(){
    $('#page_start').click(function(){
        page_click(0);
    });
    $('#page_1').click(function(){
        page_click(1);
    });
    $('#page_2').click(function(){
        page_click(2);
    });
    $('#page_3').click(function(){
        page_click(3);
    });
    $('#page_4').click(function(){
        page_click(4);
    });
    $('#page_5').click(function(){
        page_click(5);
    });
    $('#page_end').click(function(){
        page_click(6);
    });
}
function page_click(k){
    $('.loading').show();
    var params = JSON.parse($('#params').val());
    if (k == 0){
        page = 1;
    }
    else if (k == 1){
        page -= 2;
    }
    else if (k == 2){
        page -= 1;
    }
    else if (k == 4){
        page += 1;
    }
    else if (k == 5){
        page += 2;
    }
    else if (k == 6){
        page = page_num;
    }
    else {;}
    $.post("php/search.php",
        {
            params:params,
            page:page
        },
        function (data, status){
            if (status == 'success'){
                $('.loading').hide();
                $('#page_start').show();
                $('#page_1').show();
                $('#page_2').show();
                $('#page_3').show();
                $('#page_4').show();
                $('#page_5').show();
                $('#page_end').show();
                if (page - 2 > 0){
                    $('#page_1').html(page-2);
                }
                else {
                    $('#page_1').hide();
                }
                if (page - 1 > 0){
                    $('#page_2').html(page-1);
                }
                else {
                    $('#page_2').hide();
                }
                $('#page_3').html(page);
                $('#page_3_li').addClass('active');
                if (page + 1 <= page_num){
                    $('#page_4').html(page+1);
                }
                else {
                    $('#page_4').hide();
                }
                if (page + 2 <= page_num){
                    $('#page_5').html(page+2);
                }
                else {
                    $('#page_5').hide();
                }
                arr = JSON.parse(data);
                var i = 0;
                for (var id in arr){
                    if (id == 'page_num'){
                        continue;
                    }
                    $('.list-group').eq(i).find("input[type='hidden']").val(id);

                    i += 1;
                }
                show_container(arr);
            }
        }
    );
}

function show_container(arr){
    var i=0;
    for (var id in arr){
        var dict = arr[id];
        var text;
        if (id == 'page_num'){
            continue;
        }
        text = '原告：' + dict['YG'] + '，被告：' + dict['BG'];
        $('.list-group').eq(i).find('.lg-ybg').html(text);
        i += 1;
    }
}