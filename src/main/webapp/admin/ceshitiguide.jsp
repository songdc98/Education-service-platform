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
	                <h2>
	                       试题集管理
	                </h2>
                <div class="description">
                </div>
              </div>
					<!-- 搜索控件开始 -->
					  <div class="search-options">
					  <form id="searchForm"  action="${pageContext.request.contextPath}/admin/ceshitimanager.do" method="post" >
					   <table  cellspacing="1" width="100%">
					        <tbody>
					          <tr>
					             <td>
                                            题目标题
                                      <input name="Title"  value="${Title}" class="input-txt" type="text" id="Title"  />
					                  <input type="hidden"   name="actiontype" value="search"/>
					                  <input type="hidden"   name="seedid" value="${seedid}"/>
					                  <input type="hidden"   name="sjid" value="${param.sjid}"/>
					                  <input type="hidden"   name="forwardurl" value="/admin/ceshitiguide.jsp"/>
					                   <input type="submit" value="搜索" id="btnSearch" class="orange-button" /> 
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
					</div>
					<!-- 搜索控件结束 -->
					<div class="clear">
					</div>
					
				<table  width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>

							<th><b>题目</b>
							</th>
							<th><b>选项A</b>
							</th>
							<th><b>选项B</b>
							</th>
							<th><b>选项C</b>
							</th>
							<th><b>选项D</b>
							</th>
							
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(listceshiti) == 0}">
							<tr>
								<td colspan="20">没有相关试题集信息</td>
							</tr>
						</c:if>
						<%	
									if(request.getAttribute("listceshiti")!=null)
								      {
									  ShijuanitemService shijuanitemSrv=BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
									  List<Ceshiti> listceshiti=( List<Ceshiti>)request.getAttribute("listceshiti");
								     for(Ceshiti  temceshiti  :  listceshiti)
								      {
							%>
						<tr>

							<td><%=temceshiti.getTitle()%></td>
							<td><%=temceshiti.getChoicea()%></td>
							<td><%=temceshiti.getChoiceb()%></td>
							<td><%=temceshiti.getChoicec()%></td>
							<td><%=temceshiti.getChoiced()%></td>
							<td>
							
							<%
							   
							    if(sjid!=null){
							    //如果试题已经试卷中
							    if(shijuanitemSrv.isExist(MessageFormat.format("where shijuanid={0} and tihao={1}",sjid,temceshiti.getId())))
							    {
							%>
							     已加入试卷
							  <%}else{ %>
							   
							      <form  action="${pageContext.request.contextPath}/admin/shijuanmanager.do" name="form<%=temceshiti.getId()%>" method="post" >
							           <input type="hidden" name="actiontype"  value="addShiti"/>
							         
							           <input type="hidden" name="shijuanid"  value="<%=sjid%>"/>
							           <input type="hidden" name="tihao"  value="<%=temceshiti.getId()%>"/>
							           <input type="hidden" name="forwardurl"  value="/admin/zujuan.jsp?sjid=<%=sjid%>"/>
							            <input type="hidden" name="tixing" value="单选题" /> 

							           
							              <button class="orange-button"><i class="fa fa-plus"></i>加入试卷</button>

							           
							      </form>
									
								
								
								<%}} %>
							</td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				<div class="clear"></div>
				
				<daowen:pager id="pager1"  attcheform="searchForm" />
		
	</body>
</html>
