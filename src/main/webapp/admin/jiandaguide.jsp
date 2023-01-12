<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
	<%
	
	    String sjid=request.getParameter("sjid");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>简答信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>简答管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/jiandamanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>题目 <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="sjid" value="${param.sjid}" /> <input type="hidden"
							name="forwardurl" value="/admin/jiandaguide.jsp" />
								<button class="orange-button">搜索</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	
	<table id="jianda" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				
				<th width="200"><b>题目</b>
				</th>
				<th width="200"><b>答案</b>
				</th>
				<th><b>科目</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listjianda== null || fn:length(listjianda) == 0}">
				<tr>
					<td colspan="20">没有相关简答信息</td>
				</tr>
			</c:if>
			<%	
			ShijuanitemService shijuanitemSrv=BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
									if(request.getAttribute("listjianda")!=null)
								      {
									  List<Jianda> listjianda=( List<Jianda>)request.getAttribute("listjianda");
								     for(Jianda  temjianda  :  listjianda)
								      {
							%>
			<tr>
				
				<td>
				
				  <%if(temjianda.getTitle().length()>30){%>
				     <%=temjianda.getTitle().substring(1,30) %>
				  <%}else{ %>
				     <%=temjianda.getTitle() %>
				  <%} %> 
				</td>
				<td>
				
				    <%if(temjianda.getDaan().length()>30){%>
				       <%=temjianda.getDaan().substring(1, 30)+"...." %>
				    <%} else{%>
				       <%=temjianda.getDaan() %>
				    <%} %>
				
				</td>
				<td><%=temjianda.getKemu()%></td>
				<td>
				
				   
							   <%
							   
							    if(sjid!=null){
							    //如果试题已经试卷中
							    if(shijuanitemSrv.isExist(MessageFormat.format("where shijuanid={0} and tixing=''简答题'' and tihao={1}",sjid,temjianda.getId())))
							    {
							%> 已加入试卷 <%}else{ %>
                               
									<form action="${pageContext.request.contextPath}/admin/shijuanmanager.do"
									name="form<%=temjianda.getId()%>" method="post">
									<input type="hidden" name="actiontype" value="addShiti" /> 
									<input type="hidden" name="tixing" value="4" />
									<input
										type="hidden" name="shijuanid" value="<%=sjid%>" /> <input
										type="hidden" name="tihao" value="<%=temjianda.getId()%>" />
									<input type="hidden" name="forwardurl"
										value="/admin/zujuan.jsp?sjid=<%=sjid%>" />

										<input type="submit" name="btnOk" class="orange-href"
											value="加入试卷" />
											
									
									    
								</form> 
								
								
								
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
