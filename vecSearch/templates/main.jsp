<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/image/hi.png" type="image/x-icon">
    <link href="../css/main.css" rel="stylesheet" type="text/css">
    <link href="../css/commons.css" rel="stylesheet" type="text/css">
    <link href="../css/check.css" rel="stylesheet" type="text/css">
    <title>Handler:Checking</title>

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        function hello() {

            var max = 80;

            par=document.getElementById("article");

            if (par.value.length < max)

                var str = max - par.value.length;

            document.getElementById("span").innerHTML = str.toString();

        }

        //多行文本输入框剩余字数计算
        function checkMaxInput(obj, maxLen) {
            if (obj == null || obj == undefined || obj == "") {
                return;
            }
            if (maxLen == null || maxLen == undefined || maxLen == "") {
                maxLen = 100;
            }

            var strResult;
            var $obj = $(obj);
            var newid = $obj.attr("id") + 'msg';

            if (obj.value.length > maxLen) {	//如果输入的字数超过了限制
                strResult = '<div id="' + newid + '" class="Max_msg" ><br/>超出(' + (obj.value.length - maxLen) + ')字</div>'; //计算并显示剩余字数
                document.getElementById("submit").disabled=true;
            }
            else {
                strResult = '<div id="' + newid + '" class="Max_msg" ><br/> 还可以输入 ' + (maxLen - obj.value.length) + '字</div>'; //计算并显示剩余字数
                document.getElementById("submit").disabled=false;
            }

            var $msg = $("#" + newid);
            if ($msg.length == 0) {
                $obj.after(strResult);
            }
            else {
                $msg.html(strResult);
            }
        }
    </script>
</head>
<body>
<jsp:include page="head.jsp"/>


<div class="container">

    <section class="social-proof">
        <form role="form" action="newHistory.action">

            <div class="form-group text-center">
                <div class="col-xs-12 text-center">
                    <h1 class="titleStyle">Your Article</h1>
                </div>
                <div class="col-xs-12 text-center"><h1>


                </h1></div>
                <textarea id="article" rows="4" cols="80" placeholder="Your text ..." name="message" class="SpanHeight" onkeydown="checkMaxInput(this,80)" onkeyup="checkMaxInput(this,80)" onfocus="checkMaxInput(this,80)" onblur="checkMaxInput(this,80);"><%if(true) {%><%="Hello"%><%}%></textarea>
            </div>

            <input id="submit" type="submit" value="Submit"  class="btn btn-primary btn-lg pull-right" />
        </form>
    </section>

</div>

<jsp:include page="settings.jsp"/>
</body>
</html>