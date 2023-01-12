<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>判断题信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>

    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
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
				                     url: "${pageContext.request.contextPath}/admin/panduanmanager.do?actiontype=delete",
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
		<h2>判断题管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/panduanmanager.do?actiontype=load">新建判断题</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/panduanmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>题目 <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="seedid" value="${seedid}" /> <input type="hidden"
							name="forwardurl" value="/admin/panduanmanager.jsp" />
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
	<table id="panduan" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>题目</b>
				</th>
				<th><b>答案</b>
				</th>
				<th><b>难度系数</b>
				</th>
				<th><b>科目</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listpanduan== null || fn:length(listpanduan) == 0}">
				<tr>
					<td colspan="20">没有相关判断题信息</td>
				</tr>
			</c:if>
			<%	
								    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listpanduan")!=null)
								      {
									  List<Panduan> listpanduan=( List<Panduan>)request.getAttribute("listpanduan");
								     for(Panduan  tempanduan  :  listpanduan)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=tempanduan.getId()%>" class="check"
					name="ids" type="checkbox"
					value='<%=tempanduan.getId()%>'/>
				</td>
				<td><%=tempanduan.getTitle()%></td>
				<td><%=tempanduan.getDaan()%></td>
				<td><%if(tempanduan.getDifffact()==0.8){%>
							                非常难
							    <%} %>
							    <%if(tempanduan.getDifffact()==0.6){%>
							                较难
							    <%} %>
							    <%if(tempanduan.getDifffact()==0.5){%>
							                一般
							    <%} %>
							    <%if(tempanduan.getDifffact()==0.3){%>
							                容易
							    <%} %>
							</td>
				<td><%=tempanduan.getKemu()%></td>
				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/panduanmanager.do?actiontype=load&id=<%=tempanduan.getId()%>&forwardurl=/admin/panduanadd.jsp">修改</a>

				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
