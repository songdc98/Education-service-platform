﻿<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>

<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>公告</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
	 <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
	 <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
	 <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script type="text/javascript">

        $(function (){
			editor = KindEditor.create('textarea[name="dcontent"]', {
				resizeType: 1,
				allowFileManager: true
			});
			$.metadata.setType("attr", "validate");
			$("#noticeForm").validate();
        });  
    </script>
</head>
<body>

<div class="search-title">
	<h2>
		公告管理-> <a href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=load&seedid=102">新建公告</a>
	</h2>
	<div class="description">
	</div>
</div>
<form name="noticeform" method="post" action="${pageContext.request.contextPath}/admin/noticemanager.do"
	  id="noticeForm">
	<table class="grid" cellspacing="1" width="100%">
		<input type="hidden" name="id" value="${id}"/>
		<input name="pubren" value="${users.username}" type="hidden"/>
		<input type="hidden" name="actiontype" value="${actiontype}"/>
		<tr>
			<td align="right">标题:</td>
			<td>
				<input name="title" value="${requestScope.notice.title}" class="input-txt" type="text"
					   validate="{required:true,messages:{required:'请输入内容'}}"/>
			</td>
		</tr>

		<tr>
			<td align="right">公告内容:</td>
			<td colspan="3">
				<textarea name="dcontent" id="txtDcontent"
						  style="width:100%;height:400px;">${requestScope.notice.dcontent}</textarea>
			</td>
		</tr>
	</table>
	<div style="height:50px;padding-left:130px;">

		<input type="submit" value="提交" class="orange-button"/>

	</div>
</form>

</body>
</html>
