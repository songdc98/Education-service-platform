<%@page import="com.daowen.webcontrol.*" %>
<%@  include file="import.jsp"%>
<%@page import="com.daowen.webcontrol.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

	String lanmuId=request.getParameter("lanmuid");
	int nlanmuId=0;
	LanmuService lanmuSrv=BeansUtil.getBean("lanmuService", LanmuService.class);
	XinxiService xinxiSrv=BeansUtil.getBean("xinxiService", XinxiService.class);
	List<Xinxi> hotXinxis=xinxiSrv.getTopEntity("order by clickcount desc ",10);
	if(hotXinxis!=null)
		request.setAttribute("hotXinxis",hotXinxis);
	String parentId=request.getParameter("parentid");
	List<Lanmu> listLanmu=null;
	if(lanmuId!=null){
		nlanmuId=Integer.parseInt(lanmuId);
		Lanmu lanmu=lanmuSrv.load("where id="+lanmuId);
		if(lanmu!=null)
			request.setAttribute("lanmu",lanmu);
		if(lanmu.getIsleaf()!=1){
			listLanmu=lanmuSrv.getSublanmus(nlanmuId);
			parentId=lanmuId;
		}else
		{
			if(parentId!=null)
				listLanmu=lanmuSrv.getSublanmus(Integer.parseInt(parentId));
		}

	}

	request.setAttribute("listLanmu", listLanmu);

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
	List<Xinxi> xinxilist =xinxiSrv.findXinxi(nlanmuId,pageindex, pagesize);
	int recordscount =xinxiSrv.getCount(nlanmuId);
	request.setAttribute("listXinxi", xinxilist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${lanmu.title}</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

</head>
<body>

<jsp:include page="head.jsp"></jsp:include>

<div class="fn-clear"></div>
<div class="wrap round-block" >

	<c:if test="${fn:length(listLanmu)>0 }">
		<div class="filter-box">

			<div class="item">
				<div class="title">${lanmu.title }:</div>
				<div class="content-list">
					<ul>

						<c:forEach var="lanmu" items="${listLanmu}">
							<li>
								<a href="${pageContext.request.contextPath}/e/lanmuinfo.jsp?lanmuid=${lanmu.id}&parentid=<%=parentId%>">${lanmu.title}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</c:if>
	<div class="two-split">
		<div class="split-left">
			<div class="common-picture-list" style="min-height:500px;">


				<c:if test="${fn:length(listXinxi) >0}">
					<ul>
						<%
							for(Iterator it=xinxilist.iterator();it.hasNext();){
								SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
								Xinxi temxinxi=(Xinxi)it.next();

						%>

						<li>
							<h3>
								<a
										href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=<%=temxinxi.getId()%>"><%=temxinxi.getTitle() %></a>
							</h3>
							<div class="picture-area">
								<img src="${pageContext.request.contextPath}<%=temxinxi.getTupian2() %>"/>
							</div>
							<div class="text-area">

								<div class="list-show-item">
									<em> <i class="fa fa-list-alt"></i>:</em> <span><%=sdf.format(temxinxi.getPubtime()) %></span>
								</div>
								<div class="list-show-item">
									<i class="fa fa-user"></i>:<span><%=temxinxi.getPubren() %></span>
								</div>
								<div class="list-show-item">
									<i class="fa fa-eye"></i>: <span><%=temxinxi.getClickcount() %>次</span>
								</div>
								<div class="abstract">
									<%=HTMLUtil.subStringInFilter(temxinxi.getDcontent(),0, 300) %>
									[<a
										href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=<%=temxinxi.getId()%>">详细</a>]
								</div>

							</div>
						</li>
						<%} %>
					</ul>
				</c:if>


				<c:if test="${listXinxi== null || fn:length(listXinxi) == 0}">
					<div style="position:relative;height:400px;">

						<div
								style="font-size: 26px; position:absolute;left: 50%; top: 50%;transform: translate(-50%, -50%); font-weight: 600;">
							<i class="fa fa-warning"></i>没有找到<span style="color:red;">${requestScope.lanmu.title }</span>信息</div>

					</div>
				</c:if>
			</div>

		</div>
		<div class="split-right">


			<div class="sidebar">
				<div class="hd">热门信息</div>
				<div class="body">
					<c:forEach items="${hotXinxis}" var="xinxi">
						<div class="item">
							<div class="text-wrap">

								<a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}">
										${xinxi.title}
								</a>
								<div class="muted">
									<fmt:formatDate value="${xinxi.pubtime}" pattern="yyyy-MM-dd"></fmt:formatDate>
								</div>
							</div>
							<div class="thumbnail">
								<a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}">
									<img src="${pageContext.request.contextPath}${xinxi.tupian2}"/>
								</a>
							</div>


						</div>
					</c:forEach>
				</div>
			</div>

		</div>

		<form id="xinxisearchForm" method="post" action="${pageContext.request.contextPath}/e/lanmuinfo.jsp">
			<input type="hidden" name="actiontype" value="get" />
			<input type="hidden" name="lanmuid" value="<%=lanmuId %>" />
			<%if(parentId!=null){ %>
			<input type="hidden" name="parentid" value="<%=parentId %>" />
			<%} %>
		</form>
		<daowen:pager id="pager1"  attcheform="xinxisearchForm" />
	</div>
</div>



<div class="fn-clear"></div>


<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>