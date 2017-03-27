
<html>
<head>
    <title>PV COUNSELOR</title>
    <meta charset="utf-8">
    <meta content="RESTful Web API Testing" name="description">
    <meta content="REST, API, Testing" name="keywords">
    <meta content="Christopher Reichert" name="author">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
    <meta content="ie=edge" http-equiv="x-ua-compatible">
    <link rel="icon" href="/image/icon.png" type="image/x-icon">
    <script id="boot" type="application/json">
        {"component":"site/Home.js","token":null,"props":{"isLoggedIn":false},"account":null,"msg":null,"id":null,"ultDest":null}
    </script>

    <script src="/static/jquery-1.11.3.min.js"></script>
    <script src="/static/bootstrap.min.js"></script>
    <script src="lib/highcharts.js"></script>
    <script src="lib/map.js"></script>
    <script src="lib/drilldown.js"></script>
    <script src="lib/data.js"></script>
    <script src="lib/exporting.js"></script>
    <script src="lib/cn-china-by-peng8.js"></script>


    <script type="text/javascript" src="js/home.js?version=1.1"></script>
    <script type="text/javascript" src="js/draw.js?version=1.7"></script>
    <link href="/static/css/commons.css" type="text/css" rel="stylesheet">
    <link href="/static/css/site.css" type="text/css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,300italic,400italic" type="text/css" rel="stylesheet">
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/static/css/home.css?version=1.4" rel="stylesheet">


</head>
<body>
<jsp:include page="head.jsp"/>

<div class="located">
    <div id="loading" class="loading">Loading pages...</div>
</div>
<div class="container col-md-offset-3 col-lg-6">
    <ul id="myTab" class="nav nav-tabs">
        <li class="active"><a href="#tab_divorce" data-toggle="tab">案件搜索</a></li>
        <li><a href="#tab_stat" data-toggle="tab">数据统计</a></li>
    </ul>
    <div class="tab-content row">
        <div class="tab-pane fade in active" id="tab_divorce" >
            <div class="row">
                <div class="col-lg-10">
                    <form action="search.php" target="_blank" id="main-form" method="post">
                        <div class="panel panel-primary" id="panel_checkbox">
                            <div class="panel-heading">
                                <h3 class="panel-title">选择标签</h3>
                            </div>
                            <div class="panel-body">
                                <div class="checkbox col-md-offset-1" id="checkbox_wrap">

                                </div>
                            </div>
                        </div>

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">选择条件</h3>
                            </div>
                            <div class="panel-body" id="radio_wrap">
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">选择范围</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-lg-6">
                                        <label class="col-lg-3">审判周期</label>
                                        <div class="col-lg-9">
                                            <select class="form-control" name="SPCXMC" style="width: 180px">
                                                <option value="一审">一审</option>
                                                <option value="二审">二审</option>
                                                <option value="三审">三审</option>
                                                <option value="all">所有</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label class="col-lg-3">起始日期</label>
                                        <div class="col-lg-9">
                                            <input type="date" name="QSRQ">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="col-lg-3">结束日期</label>
                                        <div class="col-lg-9">
                                            <input type="date" name="JSRQ">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-2">
                    <button type="submit" class="btn btn-primary btn-lg" id="search-btn">
                        查询
                    </button>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="tab_stat">
            <div class="row">
                <div class="col-lg-12" id="canvas"></div>
            </div>
            <div class="row">
                <div class="row">
                    <label>选择统计条件（最多两个）</label>
                    <table id="opt_btn_group">
                    </table>
                    <!--<button type="button" class="btn btn-primary">审判周期&nbsp;<span class="badge">1</span></button>-->
                </div>
                <div class="row">
                    <label>选择绘制类型</label>
                    <table id="type_btn_group">
                    </table>
                </div>
            </div>
        </div>
    </div>


</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    标题
                </h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td><img src="/static/img/sta5.png"></td>
                        <td><img src="/static/img/sta2.png"></td>
                    </tr>
                    <tr>
                        <td><img src="/static/img/sta3.png"></td>
                        <td><img src="/static/img/sta4.png"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


</body>
</html>
