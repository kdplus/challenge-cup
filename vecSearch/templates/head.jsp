<%--
  Created by IntelliJ IDEA.
  User: jyfmi
  Date: 2017/3/8
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-light bg-faded" data-reactid=".1tsg8migz5s.0">
    <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#site-nav" data-reactid=".1tsg8migz5s.0.0">
    </button>
    <div class="collapse navbar-toggleable-xs clearfix" id="site-nav" data-reactid=".1tsg8migz5s.0.1">
        <div class="container" data-reactid=".1tsg8migz5s.0.1.0">
            <a class="navbar-brand" href="/" data-reactid=".1tsg8migz5s.0.1.0.0">
                <img alt="Handler-logo" src="/image/icon.png" style="display:inline-block;vertical-align:text-bottom;margin-right:5px;width:25px;height:auto;" data-reactid=".1tsg8migz5s.0.1.0.0.0"/>
                <span data-reactid=".1tsg8migz5s.0.1.0.0.1">
                    DIVORCE CONSULTANT
                </span>
            </a>
            <ul class="nav navbar-nav pull-md-right" data-reactid=".1tsg8migz5s.0.1.0.1">
                <%
                    if(/*request.getSession().getAttribute("username")==null*/true){
                %>
                <div class="nav-item" data-reactid=".1tsg8migz5s.0.1.0.1.1">
                    <li class="nav-item" data-reactid=".1tsg8migz5s.0.1.0.1.1.0">
                        <a href="/search.jsp" data-reactid=".1tsg8migz5s.0.1.0.1.1.0.0">
                            <button type="button" class="btn btn-secondary-outline" data-reactid=".1tsg8migz5s.0.1.0.1.1.0.0.0">Products</button>
                        </a>
                    </li>
                    <li class="nav-item" data-reactid=".1tsg8migz5s.0.1.0.1.1.0">
                        <a href="/people.jsp" data-reactid=".1tsg8migz5s.0.1.0.1.1.0.0">
                            <button type="button" class="btn btn-secondary-outline" data-reactid=".1tsg8migz5s.0.1.0.1.1.0.0.0">About Us</button>
                        </a>
                    </li>
                    <li class="nav-item" data-reactid=".1tsg8migz5s.0.1.0.1.1.0">
                        <a href="/introduction.jsp" data-reactid=".1tsg8migz5s.0.1.0.1.1.0.0">
                            <button type="button" class="btn btn-secondary-outline" data-reactid=".1tsg8migz5s.0.1.0.1.1.0.0.0">Why DivorceConsultant?</button>
                        </a>
                    </li>
                    <li class="nav-item" data-reactid=".1tsg8migz5s.0.1.0.1.1.1">
                        <a href="/job.jsp" data-reactid=".1tsg8migz5s.0.1.0.1.1.1.0">
                            <button type="button" class="btn btn-primary-outline" data-reactid=".1tsg8migz5s.0.1.0.1.1.1.0.0">Join Us</button>
                        </a>
                    </li>
                    <%
                    }
                    else
                    {
                    %>
                    <li class="nav-item" data-reactid=".1tsg8migz5s.0.1.0.1.1.1">
                        <a href="getHistory.action" data-reactid=".1tsg8migz5s.0.1.0.1.1.1.0">
                            <%="Hello" /*request.getSession().getAttribute("username")*/ %>
                        </a>
                    </li>
                    <%
                        }
                    %>
                </div>
            </ul>
        </div>
    </div>
</nav>

