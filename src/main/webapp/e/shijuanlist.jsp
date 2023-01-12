<%@ page import="org.springframework.context.annotation.Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%
   ShijuanService shijuanSrv= BeansUtil.getBean("shijuanService",ShijuanService.class);
   List<Shijuan> listShijuan=shijuanSrv.getEntity("");
   if(listShijuan!=null)
   	   request.setAttribute("listShijuan",listShijuan);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>在线测试</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	    <div style="min-height:600px;" class="wrap round-block">
		    <div class="paper-list">
				<div class="hd">
					<div class="title">试卷列表</div>
				</div>
				<div class="bd">

					<c:forEach items="${requestScope.listShijuan}" var="shijuan">


					<div class="item">

						<div class="card">

                               <div class="inrow">
								    <div class="tb">试卷名称:</div>
								    <div class="content">${shijuan.title}</div>
							   </div>
							<div class="inrow">
								<div class="tb">科目:</div>
								<div class="content">${shijuan.kemu}</div>
							</div>
							<div class="inrow">
								<div class="tb">总分:</div>
								<div class="content">${shijuan.zongfen}</div>
							</div>
							<div style="margin-top:12px " class="inner">
								<span data-url="${pageContext.request.contextPath}/e/onlinetest.jsp?id=${shijuan.id}" class="c-btn required-login">测试</span>
							</div>


						</div>


					</div>

					</c:forEach>

				</div>

			</div>

		</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
     <jsp:include page="loginmodal.jsp"></jsp:include>
 </body>
</html>
