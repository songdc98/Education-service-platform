<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
            CoursewareService coursewareSrv=BeansUtil.getBean("coursewareService",CoursewareService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Courseware courseware=coursewareSrv.load("where id="+id);
                courseware.setClickout(courseware.getClickout()+1);
                coursewareSrv.update(courseware);
                if(courseware!=null)
                   request.setAttribute("courseware",courseware);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>学习资料</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
      $(function(){
    	  
    	  window.downloadFun=function (){

    	  	  let id="${requestScope.courseware.id}";
   	    	  let url="${requestScope.courseware.fileurl}";
      		  window.location.href = "${pageContext.request.contextPath}/admin/download?url="+url+"&zyid="+id;
   	      };
    	  

    	  
    	  
      });
</script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl"
		value="/e/coursewareinfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a
				href="${pageContext.request.contextPath}/e/coursewarelist.jsp">学习资料</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian"
					src="${pageContext.request.contextPath}${requestScope.courseware.tupian}" />
				<div class="operation">

				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.courseware.title}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						
						<li><strong>科目:</strong>
							${requestScope.courseware.typename}</li>
						<li><strong>点击率:</strong>
							${requestScope.courseware.clickout}次</li>
						<li><strong>下载次数:</strong>
							<i class="fa fa-download"></i>${requestScope.courseware.dwcount}次</li>
						<li><strong>发布人:</strong> ${requestScope.courseware.pubren}
						</li>
						<li><strong>发布时间:</strong> <fmt:formatDate
								value="${requestScope.courseware.pubtime}" pattern="yyyy-MM-dd hh:mm:ss" />
						</li>
						
						<li>
							<span data-fun="downloadFun"   class="dw-btn required-login"><i class="fa fa-download"></i>下载</span>
						</li>
						
					</ul>
				</div>
				
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">学习资料信息</div>
		<div class="brief-content">${requestScope.courseware.des}</div>
		<jsp:include page="comment.jsp">
			<jsp:param value="courseware" name="commenttype" />
		</jsp:include>
	</div>
	<div class="fn-clear"></div>
	
	

	<jsp:include page="loginmodal.jsp"></jsp:include>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
