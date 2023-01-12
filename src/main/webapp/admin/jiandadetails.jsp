<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    JiandaService jiandaSrv=BeansUtil.getBean("jiandaService", JiandaService.class);
    if( id!=null)
    {
      Jianda temobjjianda=jiandaSrv.load(" where id="+ id);
      request.setAttribute("jianda",temobjjianda);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>简答信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
       <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看简答</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="120" align="right">科目:</td>
			<td width="*">${requestScope.jianda.kemu}</td>
		</tr>
		<tr>
			<td align="right">题目:</td>
			<td colspan="3">${requestScope.jianda.title}</td>
		</tr>
		<tr>
			<td align="right">答案:</td>
			<td colspan="3">${requestScope.jianda.daan}</td>
		</tr>
	</table>
</body>
</html>
