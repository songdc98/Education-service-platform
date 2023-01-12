
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ include file="import.jsp" %>
<%
	String title=request.getParameter("title");
	if(title!=null)
		request.setAttribute("title", title);

%>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>在线搜索</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () {
           $("[name=searchtype] option[value='${requestScope.searchtype}']").attr("selected", true);
			$("#searchForm").submit(function(){
				var temtitle= $("#title").val();
				if(temtitle==""){

					alert("请输入搜索信息");
					return false;
				}


			});
		});

	</script>
    <style>

		.search-panel {
			width: 670px;
			margin: 100px auto 0;

		}
		.search-panel .bd{

			background-color:#eeeeee;
			padding:50px 30px;
			margin: 80px 0;
			position: relative;
			-moz-border-radius: 16px;
			-webkit-border-radius: 16px;
			border-radius: 16px;
		}
		.red{
			color: red;
		}

	</style>

</head>
<body>


<div class="search-panel">
  <div class="bd">
	  <form    id="searchForm"  action="${pageContext.request.contextPath}/admin/sitesearch.do" method="post" >
		  <input   type="hidden" name="actiontype" value="find" />
		  <input   type="hidden" name="searchtype" value="2" />

		  <div class="search-box ">

			  <div class="keyword">

				  <input type="text" placeholder="请输入信息" id="title" value="${title}" name="title">
			  </div>
			  <div class="so">
				  <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
			  </div>
			  <div class="error-container">
                  <a href="${pageContext.request.contextPath}/e/index.jsp"> 首页</a>
			  </div>
		  </div>

	  </form>
  </div>

</div>

<div class="fn-clear"></div>

<c:if test="${fn:length(listSearch)> 0}">
	<div class="wrap round-block" >

		<div class="video-list">

			<div class="bd">
				<c:forEach var="si" items="${requestScope.listSearch}">
					<div class="item">
						<div class="card">
							<a href="${pageContext.request.contextPath}${si.href}">
								<div class="pic">
									<img class="image" src="${pageContext.request.contextPath}${si.tupian}"/>
									<c:if test="${si.xtype==3}">
										<span class="play-trigger"></span>
									</c:if>

								</div>
								<div class="name">
										${si.name}
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	</div>
</c:if>

<c:if test="${listSearch!=null&&fn:length(listSearch) == 0}">
	<div class="no-record-tip">
		<div class="content"><i class="fa fa-warning"></i>暂无相关<span class="red">${requestScope.title}</span>信息</div>
	</div>
</c:if>












</body>
</html>