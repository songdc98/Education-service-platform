<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>试题集信息</title>
   
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			   
			});
       </script>
	</head>
	<%
	
	    String sjid=request.getParameter("sjid");
	%>
<body style="overflow:auto;">
	

				<div class="search-title">
					<h2>选择判断题加入试卷</h2>
					<div class="description"></div>
				</div>
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/panduanmanager.do"
						method="post">
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>题目 <input name="title" value="${title}"
										class="input-txt" type="text" id="title" /> <input
										type="hidden" name="actiontype" value="search" /> <input
										type="hidden" name="sjid" value="${param.sjid}" /> <input
										type="hidden" name="forwardurl"
										value="/admin/panduanguide.jsp" />
											<button class="orange-button">搜索</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- 搜索控件结束 -->
				<div class="clear"></div>
				
				<table id="panduan" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
							
							<th width="700"><b>题目</b></th>
							<th ><b>答案</b></th>
							<th><b>科目</b></th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(listpanduan) == 0}">
							<tr>
								<td colspan="20">没有相关判断题信息</td>
							</tr>
						</c:if>
						<%
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						    ShijuanitemService shijuanitemSrv=BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
							if (request.getAttribute("listpanduan") != null) {
								List<Panduan> listpanduan = (List<Panduan>) request
										.getAttribute("listpanduan");
								for (Panduan tempanduan : listpanduan) {
						%>
						<tr>
						
							<td><%=tempanduan.getTitle()%></td>
							<td><%=tempanduan.getDaan()%></td>
							<td><%=tempanduan.getKemu()%></td>
							<td>
							
							   <%
							   
							    if(sjid!=null){
							    //如果试题已经试卷中
							    if(shijuanitemSrv.isExist(MessageFormat.format("where shijuanid={0} and tixing=''判断题'' and tihao={1}",sjid,tempanduan.getId())))
							    {
							%> 已加入试卷 <%}else{ %>
                               
									<form action="${pageContext.request.contextPath}/admin/shijuanmanager.do"
									name="form<%=tempanduan.getId()%>" method="post">
									<input type="hidden" name="actiontype" value="addShiti" /> 
									<input type="hidden" name="tixing" value="2" />
									<input
										type="hidden" name="shijuanid" value="<%=sjid%>" /> <input
										type="hidden" name="tihao" value="<%=tempanduan.getId()%>" />
									<input type="hidden" name="forwardurl"
										value="/admin/zujuan.jsp?sjid=<%=sjid%>" />

										<input type="submit" name="btnOk" class="orange-href"
											value="加入试卷" />
											
									
									    
								</form> 
								
								</div>
								
								<%}} %>
								

							</td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />
		
</body>
</html>
