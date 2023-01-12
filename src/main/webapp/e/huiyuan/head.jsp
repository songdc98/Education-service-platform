
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="law.jsp" %>
<script type="text/javascript">

    $(function(){

        $("#btnAccountExit").click(function () {
            if (!confirm("你确定要退出系统？")) {
                return;
            }
            $.ajax({

                url: encodeURI('${pageContext.request.contextPath}/admin/huiyuan/exit'),
                method: 'POST',
                dataType: "json",

                success: function (data) {
                    window.location.reload();
                },
                error: function (xmhttprequest, status, excetpion) {
                   alert("系统错误，错误编码" + status);
                }
            })


        });

        $("#searchForm").submit(function(){
            var temtitle= $("#title").val();
            if(temtitle==""){

                alert("请输入搜索信息");
                return false;
            }


        });

        $(".main-nav .menus li a").removeClass("current");
        var headid='<%=request.getParameter("headid")%>';
        if (headid != '') {

            $("#"+headid).addClass("current");
        }



    })

</script>

<%
    Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
    if(temhy!=null)
        request.setAttribute("huiyuan", temhy);

    String title=request.getParameter("title");
    if(title!=null)
        request.setAttribute("title", title);





%>




<div class="page-topbar2">
    <div class="wrap">
        <div class="bd">
            <div class="item">欢迎使用</div>
            <div class="item"><c:if test="${sessionScope.huiyuan!=null}">

                <a href="${pageContext.request.contextPath}/e/huiyuan/accountinfo.jsp" class="item"><i style="padding-right:15px;" class="fa fa-user"></i>${sessionScope.huiyuan.accountname}(${sessionScope.huiyuan.name})</a>
                <span class="op-lb" id="btnAccountExit">退出</span>
            </c:if>
                <c:if test="${sessionScope.huiyuan==null}">

                    <a href="${pageContext.request.contextPath}/e/login.jsp" class="item"><i style="padding-right:15px;" class="fa fa-user"></i>登录</a>
                </c:if>
                <a href="${pageContext.request.contextPath}/e/register.jsp" class="item">注册</a>

                <a href="${pageContext.request.contextPath}/admin/login.jsp" class="item">后台</a></div>
        </div>
    </div>
</div>


<div class="fn-clear"></div>