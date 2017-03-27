var data_all = {};
var columns = {
    column1: 'none',
    column2: 'none'
};
var draw_type = 'none';
var chart, title, subtitle, xAxis, yAxis, tooltip, plotOptions, credits, series;
credits = {
    enabled: false
};
var translate_series_name = {'province': '省份', 'year': '年份', 'SPCXMC': '审判周期', 's-y': '周期-年份'};
var translate_title = {'province': '各省份案件数', 'year': '各年份案件数', 'SPCXMC': '各审判周期案件数'};

$(function(){
    loadTheme();
    initViews();
    $('#canvas').highcharts(
        {
            chart: {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
                    stops: [
                        [0, '#2a2a2b'],
                        [1, '#3e3e40']
                    ]
                },
                style: {
                    fontFamily: "'Unica One', sans-serif"
                },
                plotBorderColor: '#606063'
            }
        }
    );
    bindDrawEvents();
});

function loadTheme(){
    // Load the fonts
    Highcharts.createElement('link', {
        href: 'https://fonts.googleapis.com/css?family=Unica+One',
        rel: 'stylesheet',
        type: 'text/css'
    }, null, document.getElementsByTagName('head')[0]);

    Highcharts.theme = {
        colors: ["#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
            "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
        chart: {
            backgroundColor: {
                linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
                stops: [
                    [0, '#2a2a2b'],
                    [1, '#3e3e40']
                ]
            },
            style: {
                fontFamily: "'Unica One', sans-serif"
            },
            plotBorderColor: '#606063'
        },
        title: {
            style: {
                color: '#E0E0E3',
                textTransform: 'uppercase',
                fontSize: '20px'
            }
        },
        subtitle: {
            style: {
                color: '#E0E0E3',
                textTransform: 'uppercase'
            }
        },
        xAxis: {
            gridLineColor: '#707073',
            labels: {
                style: {
                    color: '#E0E0E3'
                }
            },
            lineColor: '#707073',
            minorGridLineColor: '#505053',
            tickColor: '#707073',
            title: {
                style: {
                    color: '#A0A0A3'

                }
            }
        },
        yAxis: {
            gridLineColor: '#707073',
            labels: {
                style: {
                    color: '#E0E0E3'
                }
            },
            lineColor: '#707073',
            minorGridLineColor: '#505053',
            tickColor: '#707073',
            tickWidth: 1,
            title: {
                style: {
                    color: '#A0A0A3'
                }
            }
        },
        tooltip: {
            backgroundColor: 'rgba(0, 0, 0, 0.85)',
            style: {
                color: '#F0F0F0'
            }
        },
        plotOptions: {
            series: {
                dataLabels: {
                    color: '#B0B0B3'
                },
                marker: {
                    lineColor: '#333'
                }
            },
            boxplot: {
                fillColor: '#505053'
            },
            candlestick: {
                lineColor: 'white'
            },
            errorbar: {
                color: 'white'
            }
        },
        legend: {
            itemStyle: {
                color: '#E0E0E3'
            },
            itemHoverStyle: {
                color: '#FFF'
            },
            itemHiddenStyle: {
                color: '#606063'
            }
        },
        credits: {
            style: {
                color: '#666'
            }
        },
        labels: {
            style: {
                color: '#707073'
            }
        },

        drilldown: {
            activeAxisLabelStyle: {
                color: '#F0F0F3'
            },
            activeDataLabelStyle: {
                color: '#F0F0F3'
            }
        },

        navigation: {
            buttonOptions: {
                symbolStroke: '#DDDDDD',
                theme: {
                    fill: '#505053'
                }
            }
        },

        // scroll charts
        rangeSelector: {
            buttonTheme: {
                fill: '#505053',
                stroke: '#000000',
                style: {
                    color: '#CCC'
                },
                states: {
                    hover: {
                        fill: '#707073',
                        stroke: '#000000',
                        style: {
                            color: 'white'
                        }
                    },
                    select: {
                        fill: '#000003',
                        stroke: '#000000',
                        style: {
                            color: 'white'
                        }
                    }
                }
            },
            inputBoxBorderColor: '#505053',
            inputStyle: {
                backgroundColor: '#333',
                color: 'silver'
            },
            labelStyle: {
                color: 'silver'
            }
        },

        navigator: {
            handles: {
                backgroundColor: '#666',
                borderColor: '#AAA'
            },
            outlineColor: '#CCC',
            maskFill: 'rgba(255,255,255,0.1)',
            series: {
                color: '#7798BF',
                lineColor: '#A6C7ED'
            },
            xAxis: {
                gridLineColor: '#505053'
            }
        },

        scrollbar: {
            barBackgroundColor: '#808083',
            barBorderColor: '#808083',
            buttonArrowColor: '#CCC',
            buttonBackgroundColor: '#606063',
            buttonBorderColor: '#606063',
            rifleColor: '#FFF',
            trackBackgroundColor: '#404043',
            trackBorderColor: '#404043'
        },

        // special colors for some of the
        legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
        background2: '#505053',
        dataLabelsColor: '#B0B0B3',
        textColor: '#C0C0C0',
        contrastTextColor: '#F0F0F3',
        maskColor: 'rgba(255,255,255,0.3)'
    };

// Apply the theme
    Highcharts.setOptions(Highcharts.theme);
}

function initViews(){
    // init options
    var options = {
        'province': '省份', 'year': '年份', 'SPCXMC': '审批周期', 'YGXB': '原告性别',
        'JSB': '精神病', 'JRSF': '军人身份', 'XLBM': '下落不明', 'SWSF': '涉外身份', 'ZN': '有无子女',
        'JTBL': '家庭暴力', 'CH': '重婚', 'ND': '虐待', 'YQ': '遗弃',
        'YTRTJ': '与他人同居', 'YCCC': '隐藏财产', 'ZYCC': '转移财产', 'BMCC': '变卖财产',
        'HSCC': '毁损财产', 'WZZW': '伪造债务', 'CLFH': '彩礼返还', 'AZB': '艾滋病',
        'DB': '赌博', 'XD': '吸毒', 'CJ': '残疾', 'FC': '房产',
        'FLF': '福利房', 'SPF': '商品房', 'FWCQ': '房屋产权', 'ZFGJJ': '住房公积金',
        'SFZS': '是否终审', 'PJJG': '判决结果', 'CCFP': '财产分配', 'FCFP': '房产分配'
    };
    var cnt = 0;
    var col_num = 6;
    var tr = $('<tr></tr>');
    for (var key in options){
        var td = $('<td><button class="btn btn-default btn-block"></button></td>');
        td.find('button').html(options[key]);
        td.find('button').attr('name', key);
        td.appendTo(tr);
        cnt += 1;
        if (cnt == col_num){
            tr.appendTo($('#opt_btn_group'));
            tr = $('<tr></tr>');
            cnt = 0;
        }
    }
    tr.appendTo($('#opt_btn_group'));

    $('#opt_btn_group button').click(function(){
        //console.log('a', chart_type)
        var name = $(this).attr('name');
        if (columns.column1 == name){
            columns.column1 = columns.column2;
            columns.column2 = 'none';
        }
        else if (columns.column2 == name){
            columns.column2 = 'none';
        }
        else if (columns.column1 != 'none') columns.column2 = name;
        else columns.column1 = name;
        $('#opt_btn_group span').remove();
        var btn_column1 = $('#opt_btn_group button[name="'+columns.column1+'"]'),
            btn_column2 = $('#opt_btn_group button[name="'+columns.column2+'"]');

        btn_column1.append('<span class="badge">1</span>');
        btn_column2.append('<span class="badge">2</span>');
        $('#opt_btn_group button').removeClass('btn-primary');
        $('#opt_btn_group button').addClass('btn-default');
        btn_column1.removeClass('btn-default');
        btn_column1.addClass('btn-primary');
        btn_column2.removeClass('btn-default');
        btn_column2.addClass('btn-primary');

    });

    $('#opt_btn_group button').click(function(){
        if (columns.column1 == 'province' && columns.column2 == 'none'){
            // console.log('click1');
            // console.log(columns);
            $('#type_btn_group button[name="map"]').removeAttr('disabled');
        }
        else{
            // console.log('click2');
            // console.log(columns);
            $('#type_btn_group button[name="map"]').attr('disabled', 'disabled');
            $('#type_btn_group button[name="map"]').removeClass('btn-primary');
            $('#type_btn_group button[name="map"]').addClass('btn-default');
        }
    });


    //init chart type
    var types = {
        'bar': '直方图',
        'pie': '饼图',
        'pieWithDrilldown': '向下钻取饼图',
        'map': '地图'
    };
    tr = $('<tr></tr>');
    cnt = 0;
    for (var key in types){
        var td = $('<td><button class="btn btn-default btn-block"></button></td>');
        td.find('button').html(types[key]);
        td.find('button').attr('name', key);
        td.appendTo(tr);
        cnt += 1;
        if (cnt == col_num){
            tr.appendTo($('#type_btn_group'));
            tr = $('<tr></tr>');
            cnt = 0;
        }
    }
    tr.appendTo($('#type_btn_group'));

    $('#type_btn_group button').click(function(){
        if ($(this).attr('name') == draw_type){
          draw_type = 'none';
          $('#type_btn_group button').removeClass('btn-primary');
          $('#type_btn_group button').addClass('btn-default');
        }
        else {
          $('#type_btn_group button').removeClass('btn-primary');
          $('#type_btn_group button').addClass('btn-default');
          $(this).removeClass('btn-default');
          $(this).addClass('btn-primary');
          draw_type = $(this).attr('name');
        }
    });
}

function bindDrawEvents(){
  $('#tab_stat button').click(function(){

      //console.log(columns);
      //console.log(draw_type);
      if (columns.column1 == 'none' || draw_type == 'none') {
          return;
      }

      var key =  columns.column1 + '-' + columns.column2;
      if (!(key in data_all)){
          loadAndDraw();
      }
      else{
          draw();
      }
  });
}

function loadAndDraw(){
    var tmp = [columns.column1];
    if (columns.column2 != 'none'){
        tmp.push(columns.column2);
    }
    var key =  columns.column1 + '-' + columns.column2;
    $('.located').show();
    $.post('php/data/all.php',
        {
            columns: tmp
        },
        function (response, status){
            if (status == "success"){
                console.log(response);
                $('.located').hide();
                console.log(response);
                data_all[key] = JSON.parse(response);
                draw();
            }
        }
    );
}

function draw(){
    if (draw_type == 'bar') drawBar();
    else if (draw_type == 'pie') drawPie();
    //else if (draw_type == 'pieWithDrilldown') drawPieWithDrilldown();
    else if (draw_type == 'map') drawMap();
}

function drawBar(){
    var data_key = columns.column1 + '-' + columns.column2;
    if (!(data_key in data_all)) {
        loadAndDraw();
        return;
    }
    //init params
    chart = {
        type: 'column'
    };
    title = {
        text: data_key
    };
    xAxis = {
        categories: [],
        crosshair: true
    };
    yAxis = {
        min: 0
        //title: {
        //    text: '数量'
        //}
    };
    tooltip = {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
        '<td style="padding:0"><b>{point.y}</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    };
    plotOptions = {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    };

    if (columns.column2 == 'none'){
        series= [{
            name: columns.column1,
            data: []
        }];
        title.text = data_key;
        for (var key in data_all[data_key]){
            xAxis.categories.push(key);
            series[0].data.push(parseInt(data_all[data_key][key]));
        }
        //console.log(JSON.stringify(data_basic[pattern]));
        //console.log(JSON.stringify(series));

    }
    else{
        var series_dict = {};
        title.text = data_key;
        for (var key1 in data_all[data_key]){
            xAxis.categories.push(key1);
            for (var key2 in data_all[data_key][key1]){
                if (!(key2 in series_dict)){
                    series_dict[key2] = {
                        name: key2,
                        data: []
                    }
                }
                series_dict[key2].data.push(parseInt(data_all[data_key][key1][key2]));
            }
        }
        series = [];
        console.log(JSON.stringify(series_dict));
        for (var key in series_dict){
            series.push(series_dict[key]);
        }
    }

    var json = {};
    json.chart = chart;
    json.title = title;
    json.subtitle = subtitle;
    json.tooltip = tooltip;
    json.xAxis = xAxis;
    json.yAxis = yAxis;
    json.series = series;
    json.plotOptions = plotOptions;
    json.credits = credits;
    $('#canvas').highcharts(json);
    //$('.loading').hide();
}

function drawPie(){
    var data_key = columns.column1 + '-' + columns.column2;
    if (!(data_key in data_all)) {
        loadAndDraw();
        return;
    }
    var json = {};
    chart = {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    };
    title = {
        text: ''
    };
    xAxis = {
        type: 'category'
    };
    yAxis = {
        title: 'haha'
    };
    tooltip = {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    };
    plotOptions = {
        pie: {
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    };
    series= [{
        name: '',
        data: [],
        colorByPoint: true
    }];

    if (columns.column2 == 'none'){
        series[0].name = columns.column1;
        title.text = columns.column1;
        for (var key in data_all[data_key]){
            series[0].data.push([key, parseInt(data_all[data_key][key])]);
        }
        //console.log(JSON.stringify(data_basic[pattern]));
        //console.log(JSON.stringify(series));
        json.chart = chart;
        json.title = title;
        json.tooltip = tooltip;
        json.credits = credits;
        json.series = series;
        json.plotOptions = plotOptions;
        //console.log(JSON.stringify(json));
        console.log(json);
        $('#canvas').highcharts(json);
        //$('.loading').hide();
    }
    else{
        var series= [{
            name: '',
            data: [],
            colorByPoint: true
        }];
        series[0].name = columns.column1 + '-' + columns.column2;
        var data_series, data_drill;
        var drilldownSeries = [];
        for (var key1 in data_all[data_key]){
            data_series = {
                drilldown: key1,
                name: key1,
                y: 0
            };
            data_drill = {
                id: key1,
                name: key1,
                data:[]
            };
            for (var key2 in data_all[data_key][key1]){
                data_series.y += parseInt(data_all[data_key][key1][key2]);
                data_drill.data.push([key2, parseInt(data_all[data_key][key1][key2])]);
            }
            series[0].data.push(data_series);
            drilldownSeries.push(data_drill);
        }
        var drilldown = {
            series: drilldownSeries
        };
        console.log(series);
        console.log(drilldown);
        $('#canvas').highcharts({
            chart: {
                type: 'pie'
            },
            title: {
                text: columns.column1 + '-' + columns.column2
            },
            subtitle: {
                text: ''
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.percentage:.1f}%'
                    }
                }
            },

            credits: {
                enabled: false
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> 件<br/>'
            },
            series: series,
            drilldown: drilldown
        });
        //$('.loading').hide();
    }
    //console.log(series);
    //console.log(json.drilldown);

}

function drawMap(){
    var data_key = columns.column1 + '-' + columns.column2;
    if (!(data_key in data_all)) {
        loadAndDraw();
        return;
    }
    var data_province = data_all[data_key];
    var province2hckey = {
        '广东': 'cn-gd', '上海': 'cn-sh', '浙江': 'cn-zj', '海南': 'cn-ha', '西藏': 'cn-xz',
        '云南': 'cn-yn', '安徽': 'cn-ah', '湖北': 'cn-hu', '陕西': 'cn-sa', '重庆': 'cn-cq',
        '贵州': 'cn-gz', '湖南': 'cn-hn', '四川': 'cn-sc', '山西': 'cn-sx', '河南': 'cn-he',
        '江西': 'cn-jx', '内蒙古': 'cn-nm', '广西': 'cn-gx', '黑龙江': 'cn-hl', '福建': 'cn-fj',
        '北京': 'cn-bj', '河北': 'cn-hb', '辽宁': 'cn-ln', '山东': 'cn-sd', '天津': 'cn-tj',
        '江苏': 'cn-js', '青海': 'cn-qh', '甘肃': 'cn-gs', '新疆': 'cn-xj', '吉林': 'cn-jl',
        '宁夏': 'cn-nx'
    };
    var hckey2province = {};
    for (var province in province2hckey) hckey2province[province2hckey[province]] = province;
    console.log(JSON.stringify(hckey2province));
    var data = [
    ];
    for (var province in data_province){
        if (province in province2hckey){
            data.push({
                "hc-key": province2hckey[province],
                "value": parseInt(data_province[province])
            });
        }
    }
    // Initiate the chart
    $('#canvas').highcharts('Map', {

        title : {
            text : '各省份案件数'
        },

        //subtitle : {
        //    text : 'Source map: <a href="https://code.highcharts.com/mapdata/countries/cn/cn-all.js">China</a>'
        //},

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        colorAxis: {
            min: 0
        },

        credits: credits,

        series : [{
            data : data,
            mapData: Highcharts.maps['countries/cn/cn-all'],
            joinBy: 'hc-key',
            name: '数量',
            states: {
                hover: {
                    color: '#BADA55'
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.properties.cn-name}'
            }
        }]
})
}

