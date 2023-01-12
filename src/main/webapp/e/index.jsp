<%@ page import="com.daowen.vo.LanmuContentVo" %>
<%@ page import="org.springframework.context.annotation.Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%

	 YingpianService yingpianSrv= BeansUtil.getBean("yingpianService",YingpianService.class);
     IndexcolumnsService icSrv=BeansUtil.getBean("indexcolumnsService",IndexcolumnsService.class);
     List<LanmuContentVo> listLanmuContent= icSrv.getImageLanmu(10);
	 List<LanmuContentVo> listTextLanmu= icSrv.getTextLanmu(5);
     if(listLanmuContent!=null)
     	request.setAttribute("listLanmuContent",listLanmuContent);
     if(listTextLanmu!=null)
     	request.setAttribute("listTextLanmu",listTextLanmu);
      List<Yingpian> listYingpian=yingpianSrv.getTopEntity("",10);
      if(listYingpian!=null)
      	request.setAttribute("listYingpian",listYingpian);

%>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/carousel.css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/e/js/carousel.js'></script>


    <script type="text/javascript">
        $(function () {

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	

	<div class="wrap com-panel clearfix">
	     <div class="carousel-panel fnleft">
	         <%=new FocusgraphicBuilder(request).buildFullScreen()%>
	     </div>
	     <div class="plat-notice-panel fnleft">
	         <div class="title">
	             <i class="fa fa-volume-up"></i>系统公告
	             <div class="more"><a href="${pageContext.request.contextPath}/e/noticelist.jsp"><i class="fa fa-chevron-right"></i></a></div>
	         </div>
	                <%
					   NoticeBuilder noticeBuilder=new NoticeBuilder();
					%>
					<%=noticeBuilder.build() %>
	     </div>
	   
	</div>


	<div class="wrap round-block">
		<div class="video-list">
			<div class="hd">
				<div class="title">在线课程</div>
			</div>
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
	</div>


	<div class="wrap round-block ">
		<div class="text-box-wrap">
		<c:forEach var="lanmuContent"  items="${requestScope.listTextLanmu}">

				<div class="text-box">
					<div class="hd">
						<div class="title">${lanmuContent.name}</div>
						<div class="more"><a href="${pageContext.request.contextPath}/e/lanmuinfo.jsp?lanmuid=${lanmuContent.id}">更多</a></div>
					</div>
					<div class="bd">
						<c:forEach items="${lanmuContent.content}" var="xinxi" varStatus="status">
							<c:if test="${status.first}">
								<div class="first">
									<img class="image" src="${pageContext.request.contextPath}${xinxi.tupian2}">
									<div class="des">
										<div class="time"><fmt:formatDate value="${xinxi.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></div>
										<div class="name"><a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}">${xinxi.title}</a> </div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<ul>
							<c:forEach items="${lanmuContent.content}" var="xinxi" varStatus="status">
							<c:if test="${status.index!=0}">
								<li><a class="text" href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}">${xinxi.title}</a><span class="time"><fmt:formatDate value="${xinxi.pubtime}" pattern="yyyy-MM-dd"/></span></li>
							</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>

		</c:forEach>
		</div>
	</div>
	
	<div class="wrap round-block clearfix">


		<c:forEach items="${requestScope.listLanmuContent}" var="lanmuContent">
			<div class="image-text-box">

				<div class="hd">
					<div class="text">${lanmuContent.name}</div>
				</div>
				<div class="bd">
					<c:forEach var="xinxi" items="${lanmuContent.content}">
						<div class="item2">
							<div class="image-wrap">
								<a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}">
									<img src="${pageContext.request.contextPath}${xinxi.tupian2}" />
								</a>
							</div>
							<div class="name">
									${xinxi.title}
							</div>

						</div>
					</c:forEach>
					<c:if test="${fn:length(lanmuContent.content)==0}">
						<div class="no-record-tip">
							<div class="content"><i class="fa fa-warning"></i>暂无${lanmuContent.name}信息</div>
						</div>
					</c:if>

				</div>
			</div>
		</c:forEach>


	  </div>
	


		
		
	<div class="fn-clear"></div>
	
   
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>