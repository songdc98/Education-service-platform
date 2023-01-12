<%@ page import="com.daowen.vo.PaperVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="huiyuan/law.jsp" %>

<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>在线测试</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css"
          type="text/css"></link>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jquery.timer/jquery.timer1.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/student/js/StringEx.js"></script>



</head>
<body>
<jsp:include page="/e/huiyuan/head.jsp"></jsp:include>

<div class="wrap round-block">

     <div class="hint-box">
            <i class="fa fa-check state-icon"></i>
         <div class="textep">测试完成<a   href="${pageContext.request.contextPath}/e/huiyuan/dajuaninfo.jsp?id=${requestScope.dajuan.id}">查看测试结果</a>
     </div>


     </div>

</div>
<div class="fn-clear"></div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
