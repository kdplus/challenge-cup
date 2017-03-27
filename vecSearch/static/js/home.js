window.onload = function(){
    initCheckbox();
    initRadio();
    initBtn();
};

function initCheckbox(){

    var translate = {
        'JTBL': '家庭暴力', 'CH': '重婚', 'ND': '虐待', 'YQ': '遗弃',
        'YTRTJ': '与他人同居', 'YCCC': '隐藏财产', 'ZYCC': '转移财产', 'BMCC': '变卖财产',
        'HSCC': '毁损财产', 'WZZW': '伪造债务', 'CLFH': '彩礼返还', 'AZB': '艾滋病',
        'DB': '赌博', 'XD': '吸毒', 'CJ': '残疾', 'FC': '房产',
        'FLF': '福利房', 'SPF': '商品房', 'FWCQ': '房屋产权', 'ZFGJJ': '住房公积金',
        'SFZS': '是否终审'

    };
    //alert('haha');
    //initCheckbox
    var temp_checkbox_row= $("<div class='row'></div>");
    var temp_checkbox_item = $("<label class='col-lg-3'><input type='checkbox'></label>");
    var checkbox_row, checkbox_item;
    var max_line_num = 4;
    var line_num = 0;
    for (var key in translate){
        checkbox_item = temp_checkbox_item.clone();
        checkbox_item.find('input').attr('name', key);
        checkbox_item.append(translate[key]);
        if (line_num == 0) checkbox_row = temp_checkbox_row.clone();
        checkbox_row.append(checkbox_item);
        line_num += 1;
        if (line_num >= max_line_num){
            //alert(checkbox_row.html());
            line_num = 0;
            $('#checkbox_wrap').append(checkbox_row);
        }
    }
    checkbox_row.appendTo('#checkbox_wrap');
}

function initRadio(){
    var options = {'YG': '原告', 'BG': '被告', 'BOTH': '双方', 'NONE': '无'};
    var data = {
        'JSB': {'name': '精神病', 'options': options},
        'JRSF': {'name': '军人身份', 'options': options},
        'XLBM': {'name': '下落不明', 'options': options},
        'SWSF': {'name': '涉外身份', 'options': options}
    };
    var temp_radio_row= $("<div class='row'><label class='checkbox-inline'></label></div>");
    var temp_radio_item = $(" <label class='checkbox-inline'><input type='radio'></label>");
    var radio_row, radio_item;
    for (var key in data){
        radio_row = temp_radio_row.clone();
        radio_row.find('label').text(data[key]['name']);
        for (var option in data[key]['options']){
            radio_item = temp_radio_item.clone();
            radio_item.find('input').attr('name', key);
            radio_item.find('input').attr('value', option);
            radio_item.find('input').after(data[key]['options'][option]);
            radio_item.appendTo(radio_row);
        }
        radio_row.appendTo($('#radio_wrap'));
    }
}

function initBtn(){
    $('#search-btn').click(function(){
        $('#main-form').submit();
    });
}