<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    YingpianService yingpianSrv=BeansUtil.getBean("yingpianService",  YingpianService.class);
    if( id!=null)
    {
         Yingpian temobjyingpian= yingpianSrv.load(" where id="+ id);
          request.setAttribute("yingpian",temobjyingpian);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>影片审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>影片审批</h2>
		<div class="description"></div>
	</div>
	<form name="yingpianform" method="post"
		action="${pageContext.request.contextPath}/admin/yingpianmanager.do"
		id="yingpianForm">
		<input type="hidden" name="id" value="<%=id%>" /> <input
			type="hidden" name="actiontype" value="shenpi" /> <input
			type="hidden" name="errorurl" value="/admin/yingpianadd.jsp" /> <input
			type="hidden" name="forwardurl"
			value="/admin/yingpianmanager.do?actiontype=get&forwardurl=/admin/yingpianmanager.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">视频名称:</td>
				<td>${requestScope.yingpian.title}</td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
					src="${pageContext.request.contextPath}${requestScope.yingpian.tupian}" />
				</td>
			</tr>
			<tr>
				<td width="10%" align="right">发布人:</td>
				<td>${requestScope.yingpian.pubren}</td>
			</tr>
			
			<tr>
				<td align="right">发布时间:</td>
				<td><fmt:formatDate value="${requestScope.yingpian.pubtime}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td width="10%" align="right">广告语:</td>
				<td>${requestScope.yingpian.subtitle}</td>
			</tr>
			
			
			<tr>
				<td width="10%" align="right">类别名称:</td>
				<td>${requestScope.yingpian.ypcatename}</td>
			</tr>
			
			
			<tr>
				<td align="right">审批结果</td>
				<td><input type="radio" value="2" name="state"
					checked="checked" />审批通过 <input type="radio" value="3" name="state" />拒绝
				</td>
			</tr>

			<tr>
				<td align="right">处理说明:</td>
				<td colspan="3"><textarea name="reply" id="txtReply"
						style="width: 48%; height: 80px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="orange-button">提交审批</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
