<%--
  Created by IntelliJ IDEA.
  User: jyfmi
  Date: 2017/3/8
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: jyfmi
  Date: 2017/2/24
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--<title>发电站决策辅助信息</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class='tableauPlaceholder' id='viz1488156014663' style='position: relative'><noscript><a href='#'><img alt='仪表板 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;PM&#47;PMBH6HPWT&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='path' value='shared&#47;PMBH6HPWT' /> <param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;PM&#47;PMBH6HPWT&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1488156014663');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='1004px';vizElement.style.height='869px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>  </body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <script src="bootstrap/js/jquery-1.11.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="lib/highcharts.js"></script>
    <script src="lib/map.js"></script>
    <script src="lib/drilldown.js"></script>
    <script src="lib/data.js"></script>
    <script src="lib/exporting.js"></script>
    <script src="lib/cn-china-by-peng8.js"></script>


    <script type="text/javascript" src="js/home.js?version=1.1"></script>
    <script type="text/javascript" src="js/draw.js?version=1.7"></script>
    <link href="css/commons.css" type="text/css" rel="stylesheet">
    <link href="css/site.css" type="text/css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,300italic,400italic" type="text/css" rel="stylesheet">
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/home.css?version=1.4" rel="stylesheet">


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
                        <td><img src="img/sta5.png"></td>
                        <td><img src="img/sta2.png"></td>
                    </tr>
                    <tr>
                        <td><img src="img/sta3.png"></td>
                        <td><img src="img/sta4.png"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


</body>
</html>
