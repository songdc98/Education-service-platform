<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.daowen.webcontrol.*" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@  include file="import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%

		KechengService ypcateSrv=BeansUtil.getBean("kechengService",KechengService.class);
		List<Kecheng> listYpcate=ypcateSrv.getEntity("");
		if(listYpcate!=null)
			request.setAttribute("listYpcate",listYpcate);
		YingpianService yingpiantskSrv=BeansUtil.getBean("yingpianService", YingpianService.class);
		String cateid=request.getParameter("cateid");

		String  filter="where 1=1 ";
		if(cateid!=null)
			filter+=" and ypcateid="+cateid;
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Yingpian> listYingpian = yingpiantskSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = yingpiantskSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listYingpian", listYingpian);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);


	%>

	<title>课程信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

</head>
<body>
<jsp:include page="head.jsp"></jsp:include>

<div class="wrap round-block">
	<div class="line-title">
		当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
		&gt;&gt; 学习课程
	</div>

	<div class="filter-box">

		<div class="item">
			<div class="title">分类:</div>
			<div class="content-list">
				<ul>
					<c:forEach var="item" items="${listYpcate}">
						<li>
							<a href="${pageContext.request.contextPath}/e/yingpianlist.jsp?cateid=${item.id}">${item.mingcheng}</a>
						</li>
					</c:forEach>

				</ul>
			</div>
		</div>

	</div>

	<div class="video-list">

		<div class="bd">
			<c:forEach var="yingpian" items="${listYingpian}">
			<div class="item">
				<div class="card">
                   <a href="${pageContext.request.contextPath}/e/yingpianinfo.jsp?id=${yingpian.id}">
					<div class="pic">
						<img class="image" src="${pageContext.request.contextPath}${yingpian.tupian}"/>
						<span class="play-trigger"></span>
					</div>
					<div class="name">
						${yingpian.title}
					</div>
				   </a>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<c:if test="fn:length(listYingpian) == 0}">
		<div class="no-record-tip">
			<div class="content">
				<i class="fa fa-warning"></i>没有找到相关简单列表信息
			</div>

		</div>

	</c:if>
	<c:if test="${fn:length(listYingpian) == 0}">
		<div class="no-record-tip">
			<div class="content">
				<i class="fa fa-warning"></i>没有找到相关视频信息
			</div>
		</div>

	</c:if>

	<div class="clear"></div>

	<form id="yingpiansearchForm" method="post" action="${pageContext.request.contextPath}/e/yingpianlist.jsp">
		<input type="hidden" name="actiontype" value="get" />
		<input type="hidden" name="forwardurl" value="/e/yingpianlist.jsp" />
	</form>
	<daowen:pager id="pager1"  attcheform="yingpiansearchForm" />


</div>
<div class="fn-clear"></div>


<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>