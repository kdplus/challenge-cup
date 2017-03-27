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
    <link href="css/commons.css" type="text/css" rel="stylesheet">
    <link href="css/site.css" type="text/css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,300italic,400italic" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="head.jsp"/>

<main data-reactid=".1tsg8migz5s.2">
    <div class="jumbotron jumbotron-fluid" style='padding-top:115px;padding-bottom:175px;color:#f7f7f9;background-size:cover;background-position:0px;background-image:url("image/back4.png");' data-reactid=".0.2.0">
        <div class="container" data-reactid=".1tsg8migz5s.2.0.0">
            <div class="row" data-reactid=".1tsg8migz5s.2.0.0.0">
                <div class="col-md-7" data-reactid=".1tsg8migz5s.2.0.0.0.0">
                    <iframe src="//www.slideshare.net/slideshow/embed_code/key/FVfpNiIKi83SLU" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/YifanJin7/pvcoun" title="决策案例" target="_blank">决策案例</a> </strong> from <strong><a target="_blank" href="//www.slideshare.net/YifanJin7">Yifan Jin</a></strong> </div>
                </div>
                <div class="col-md-5" data-reactid=".1tsg8migz5s.2.0.0.0.1">
                    <jsp:include page="test.jsp"/>
                </div>
            </div>
        </div>
    </div>
    <br data-reactid=".1tsg8migz5s.2.4"/>
</main>
</body>
</html>
