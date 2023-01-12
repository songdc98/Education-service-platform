
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%
    String id=request.getParameter("id");
    YingpianService yingpianSrv=BeansUtil.getBean("yingpianService",YingpianService.class);

    if(id!=null){
        Yingpian yingpian=yingpianSrv.load("where id="+id);
        if(yingpian!=null) {
            String url=yingpian.getRemoteurl();
            if(url!=null&&!(url.startsWith("http://")||url.startsWith("https://")))
                url=request.getContextPath()+url;
            request.setAttribute("yingpian", yingpian);
            request.setAttribute("url",url);
        }
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

 <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/myvideo/css/style.css" type="text/css"></link>


<script type="text/javascript">
         $(function(){
             $.ajax({

                 url:"${pageContext.request.contextPath}/e/huiyuan/play",
                 method:'POST',
                 datatype:'JSON',
                 data:{
                     'mid':"${yingpian.id}",
                     'mname':"${yingpian.title}",
                     "name":"${sessionScope.huiyuan.name}",
                     'accountname':"${sessionScope.huiyuan.accountname}"
                 },
                 success:function(data){

                     if(data.stateCode==-2){
                         window.location.href="${pageContext.request.contextPath}/e/nofeetip.jsp";
                     }
                 },
                 error:function(xmhttprequest,status,excetpion){
                     alert("系统错误，错误编码"+status);
                 }
             });
         });
        
 </script>

</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div id="ap-player-box">
    <div id="ap-player-bar">
        <div id="ap-loading-box">
            <img src="${pageContext.request.contextPath}/webui/myvideo/image/loading.png">
            <div>视频及弹幕加载中~请稍后</div>
        </div>
        <div id="ap-player-hide">
            <img src="${pageContext.request.contextPath}/webui/myvideo/image/play.png" id="ap-player-icon" ondragstart="return false">
        </div>
        <div id="ap-chatbox">

        </div>
        <div class="ap-title">${requestScope.yingpian.title} <div id="ap-danmu-num">该视频已有 <span>0</span> 条吐槽!</div></div>
        <video id="ap-player">

        </video>
        <div id="ap-console">
            <div id="ap-console-play">&nbsp<i class="fa fa-play"></i></div>
            <div id="ap-console-time">00:00 / 00:00</div>
            <div id="ap-console-jdbar">
                <div id="ap-console-jdbar-btn"></div>
                <div id="ap-console-jdbar-beacon"></div>
                <div id="ap-console-jdbar-okbar"></div>
            </div>
            <div id="ap-console-volume">&nbsp<i style="font-size:18px" class="fa fa-volume-down"></i>
                <div id="ap-console-volume-box">
                    <div id="ap-console-volume-text">30</div>
                    <div id="ap-console-volume-bar">
                        <div id="ap-console-volume-btn"></div>
                    </div>
                </div>
            </div>
            <div id="ap-console-clarity">
                <div id="ap-console-clarity-txt">高清</div>
                <ul>
                    <li>高清</li>
                    <li>流畅</li>
                </ul>
            </div>
            <div id="ap-console-full">&nbsp<i class="fa fa-arrows-alt"></i></div>

        </div>
    </div>
    <div class="ap-other-bar">
        <ul class="ap-right-tab">
            <li class="ap-tab-se">推荐视频</li>
            <li>弹幕设置</li>
        </ul>
    </div>
    <div id="ap-mouse-rightkey">
        <ul>
            <li>播放器版本 V1.0.1</li>
            <a href="updata-log.html"><li>更新日志</li></a>
            <a href=""><li>重置播放器</li></a>
            <a href=""><li>BUG提交</li></a>
            <a href=""><li>复制调试信息</li></a>
        </ul>
    </div>
</div>


<div class="fn-clear"></div>


<jsp:include page="bottom.jsp"></jsp:include>


</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/webui/myvideo/myvideo.js"></script>
<script type="text/javascript">
    apcore.apAdd('${requestScope.url}');
</script>