<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.util.HtmlUtils" %>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>填空题信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
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
				                  url: "${pageContext.request.contextPath}/admin/tiankongmanager.do?actiontype=delete",
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
<body>
	<div class="search-title">
		<h2>填空题管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/tiankongmanager.do?actiontype=load">新建填空题</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/tiankongmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>题目: <input name="title" value="${title}"
							class="input-txt" type="text" id="title" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl"
							value="/admin/tiankongmanager.jsp" />
							<input type="submit" value="搜索" id="btnSearch"
								   class="orange-button" />
						</td>
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
	<table id="tiankong" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th width="300"><b>题目</b>
				</th>
				<th ><b>难度系统</b>
				</th>
				
				<th><b>科目</b>
				</th>
				
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listtiankong== null || fn:length(listtiankong) == 0}">
				<tr>
					<td colspan="20">没有相关填空题信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listtiankong")!=null)
								      {
									  List<Tiankong> listtiankong=( List<Tiankong>)request.getAttribute("listtiankong");
								     for(Tiankong  temtiankong  :  listtiankong)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temtiankong.getId()%>" class="check"
					name="ids" type="checkbox"
					value='<%=temtiankong.getId()%>'/>
				</td>
				<td>
				     <%if(temtiankong.getTitle().length()>30){ %>
				       <%=HTMLUtil.subStringInFilter(temtiankong.getTitle(),1,200)  %>
				     <%} else{%>
				       <%=temtiankong.getTitle() %>
				     <%} %>
				</td>
				<td><%if(temtiankong.getDifffact()==0.8){%>
							                非常难
							    <%} %>
							    <%if(temtiankong.getDifffact()==0.6){%>
							                较难
							    <%} %>
							    <%if(temtiankong.getDifffact()==0.5){%>
							                一般
							    <%} %>
							    <%if(temtiankong.getDifffact()==0.3){%>
							                容易
							    <%} %>
							</td>
				
				<td><%=temtiankong.getKemu()%></td>
				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/tiankongmanager.do?actiontype=load&id=<%=temtiankong.getId()%>&forwardurl=/admin/tiankongadd.jsp">修改</a>

				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
