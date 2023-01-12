<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>简答信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
				 $("#btnDelete").click(function(){
				       var ids = $(".check[type=checkbox]:checked").serialize();
						 if($(".check:checked").length<1)
					        {
					           $.dialog.alert("请选择需要删除条目");
					           return;
					        } 
						if(!confirm("你确定要删除吗")){
							return;
						}
						$.ajax({
				                  url: "${pageContext.request.contextPath}/admin/jiandamanager.do?actiontype=delete",
				                     method: 'post',
				                     data: ids,
				                     success: function (data) {
				                          window.location.reload();
				                     },
				                     error: function (XMLHttpRequest, textStatus, errorThrown) {
				                         alert(XMLHttpRequest.status + errorThrown);
				                     }
				                 });
				    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>简答管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/jiandamanager.do?actiontype=load">新建简答</a>
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
							name="seedid" value="${seedid}" /> <input type="hidden"
							name="forwardurl" value="/admin/jiandamanager.jsp" />
							<input type="submit" value="搜索" id="btnSearch"
								   class="orange-button" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
			 <div class="btn-group">
                    <button id="btnCheckAll" class="btn btn-default btn-success btn-group-sm">
                        <span class="fa fa-check"></span>
                                                                    选择
                    </button>
                    <button id="btnDelete" class="btn btn-default btn-success btn-group-sm">
                        <span class="fa fa-remove"></span>
                                                                    删除
                    </button>

                </div>

	</div>
	<table id="jianda" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>题目</b>
				</th>
				
				<th width="200"><b>难度系数</b>
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
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listjianda")!=null)
								      {
									  List<Jianda> listjianda=( List<Jianda>)request.getAttribute("listjianda");
								     for(Jianda  temjianda  :  listjianda)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temjianda.getId()%>" class="check"
					name="ids" type="checkbox"
					value='<%=temjianda.getId()%>'/>
				</td>
				<td>
				
				  <%if(temjianda.getTitle().length()>30){%>
				     <%=temjianda.getTitle().substring(1,30) %>
				  <%}else{ %>
				     <%=temjianda.getTitle() %>
				  <%} %> 
				</td>
				<td><%if(temjianda.getDifffact()==0.8){%>
							                非常难
							    <%} %>
							    <%if(temjianda.getDifffact()==0.6){%>
							                较难
							    <%} %>
							    <%if(temjianda.getDifffact()==0.5){%>
							                一般
							    <%} %>
							    <%if(temjianda.getDifffact()==0.3){%>
							                容易
							    <%} %>
							</td>
				<td><%=temjianda.getKemu()%></td>
				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/jiandamanager.do?actiontype=load&id=<%=temjianda.getId()%>&forwardurl=/admin/jiandaadd.jsp">修改</a>
					<a class="orange-href"
					href="${pageContext.request.contextPath}/admin/jiandadetails.jsp?id=<%=temjianda.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
