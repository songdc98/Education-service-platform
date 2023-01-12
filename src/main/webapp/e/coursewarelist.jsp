<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.daowen.webcontrol.*" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@  include file="import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
 
    KechengService kechengSrv=BeansUtil.getBean("kechengService", KechengService.class);
    List<Kecheng> listKecheng=kechengSrv.getEntity("");
    if(listKecheng!=null) 
	 request.setAttribute("listKecheng", listKecheng);
    CoursewareService coursewareSrv=BeansUtil.getBean("coursewareService",CoursewareService.class);
   
    String  filter="where 1=1";
    String typeid=request.getParameter("typeid");
    if(typeid!=null)
    	filter+=" and typeid="+typeid;
    
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
	List<Courseware> coursewarelist = coursewareSrv.getPageEntitys(filter,pageindex, pagesize);
	int recordscount = coursewareSrv.getRecordCount(filter == null ? "": filter);
	request.setAttribute("listCourseware", coursewarelist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>学习资料列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 学习资料查询
		</div>

		<div class="filter-box">
			<div class="item">
				<div class="title">课程:</div>
				<div class="content-list">
					<ul>
						<c:forEach var="kecheng" items="${requestScope.listKecheng}">
							<li><a  href="${pageContext.request.contextPath}/e/coursewarelist.jsp?typeid=${kecheng.id}">${kecheng.mingcheng}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

	     <c:if test="${fn:length(listCourseware)>0}">
			<div class="picture-list">
				<ul>
					<c:forEach var="courseware" items="${listCourseware}">
						<li>
							<div class="item">
								<div class="tag">
									<span>推荐</span>
								</div>
								<div class="img">
									<a
										href="${pageContext.request.contextPath}/e/coursewareinfo.jsp?id=${courseware.id}">
										<img
										src="${pageContext.request.contextPath}${courseware.tupian}" />
									</a>
								</div>
								<div class="name">${courseware.title}</div>
								<div class="price"><i class="fa fa-download"></i>${courseware.dwcount}次</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<c:if
			test="${listCourseware== null || fn:length(listCourseware) == 0}">
			<div class="no-record-tip">
			    <div class="content">
			               没有找到相关学习资料信息
			    </div>	
			</div>
		</c:if>
		<div class="clear"></div>
		<form id="coursewaresearchForm" method="post"
			action="${pageContext.request.contextPath}/e/coursewarelist.jsp">
			<input type="hidden" name="actiontype" value="get" /> <input
				type="hidden" name="forwardurl" value="/e/coursewarelist.jsp" />
		</form>
		<daowen:pager id="pager1" attcheform="coursewaresearchForm" />
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
