<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%
            String id=request.getParameter("id");
            FcommentService fcommentSrv=BeansUtil.getBean("fcommentService", FcommentService.class);
            YingpianService yingpianSrv=BeansUtil.getBean("yingpianService",YingpianService.class);
            if(id!=null){
                Yingpian yingpian=yingpianSrv.load("where id="+id);
                if(yingpian!=null)
                   request.setAttribute("yingpian",yingpian);
            }
   %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>${yingpian.title}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/myvideo/css/ap-style.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
  
     $(function(){

		 window.shoucangFun=function(){


			 $.ajax({

				 url:'${pageContext.request.contextPath}/admin/shoucang/ajaxsave',
				 datatype:'JSON',
				 method:'POST',
				 data:{
					 "targetid":"${requestScope.yingpian.id}",
					 "targetname":"${requestScope.yingpian.title}",
					 "tupian":"${requestScope.yingpian.tupian}",
					 "hyid":"${sessionScope.huiyuan.id}",
					 "xtype":"yingpian",
					 "href":"/e/yingpianinfo.jsp?id=${requestScope.xinxi.id}"
				 },
				 success:function(resData){
					 if(resData.stateCode==-2){
						 $.toast({
							 text: '你已经收藏了...',
							 icon: 'error',
							 hideAfter: 2000,
							 allowToastClose: false,
							 position: 'mid-center',
							 loader: false,        // Change it to false to disable loader
							 loaderBg: '#9EC600'  // To change the background
						 });
						 return;
					 }
					 $.toast({
						 text: '成功收藏...',
						 icon: 'success',
						 hideAfter: 1000,
						 allowToastClose: false,
						 position: 'mid-center',
						 loader: false,        // Change it to false to disable loader
						 loaderBg: '#9EC600'  // To change the background
					 });
					 //window.location.reload();
				 },
				 error: function (XMLHttpRequest, textStatus, errorThrown) {
					 alert(XMLHttpRequest.status + errorThrown);
				 }
			 });//end ajax

		 };//end fun

    	   $("#btnDownload").click(function(){
     	    	var id=$(this).data("id"); 
        		window.location.href = "${pageContext.request.contextPath}/admin/download?url="+$(this).data("url")+"&zyid="+id;
     	    });
		 window.agreeFun=function () {
			 let $this=$(this);
			 $.ajax({

				 url:encodeURI('${pageContext.request.contextPath}/admin/yingpian/agree'),
				 method:'post',
				 data:{
					 id:"${requestScope.yingpian.id}"
				 },
				 success:function(res){
					 $this.children("[name=count]").html(res.data);
				 },
				 error:function(xmhttprequest,status,excetpion){
					 alert("系统错误，错误编码"+status);
				 }
			 });

		 };

		  window.againstFun=function () {
                  let $this=$(this);
		  	      $.ajax({
	                     
	                        url:encodeURI('${pageContext.request.contextPath}/admin/yingpian/against'),
				            method:'post',
				            data:{
	                          id:"${requestScope.yingpian.id}"
							},
				            success:function(res){
				            	$this.children("[name=count]").html(res.data);
				            },
				            error:function(xmhttprequest,status,excetpion){
				                alert("系统错误，错误编码"+status);
				            }
	                  });
                     
		 };
    	 
    	 
     });
   
</script>


</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>

    <div class="wrap round-block">
        <div class="course-detail">
            <div class="course-ct">
               <div class="title">
                   ${requestScope.yingpian.title}
                       <span  data-fun="agreeFun" class="btn btn-default required-login"><i class="fa fa-thumbs-up"></i> <span name="count">${requestScope.yingpian.agreecount}</span></span>

                       <span  data-fun="againstFun" class="btn btn-default required-login"><i class="fa fa-thumbs-down"></i> <span name="count">${requestScope.yingpian.againstcount}</span></span>
               </div>
                <div class="subtitle">
                    ${requestScope.yingpian.subtitle}
                </div>
                <div class="item">
                    <div class="tb">发布时间:</div>
                    <div class="content"><fmt:formatDate value="${requestScope.yingpian.pubtime}" pattern="yyyy-MM-dd"/></div>
                </div>
                <div class="item">
                    <div class="tb">课程:</div>
                    <div class="content">${requestScope.yingpian.ypcatename}</div>
                </div>
                <div class="item">
                    <div class="tb">视频类型:</div>
                    <div class="content">${requestScope.yingpian.jifen}</div>
                </div>
                <div class="explain">
                    <div class="hd">

                    </div>
                    <div class="bd">
                        ${requestScope.yingpian.des}
                    </div>

                </div>
            </div>
            <div class="course-box">
                <div class="c-thumbnail">
                    <img class="image" src="${pageContext.request.contextPath}${requestScope.yingpian.tupian}"/>
                    <span data-url="${pageContext.request.contextPath}/e/playyp.jsp?id=${requestScope.yingpian.id}"  class="play required-login"></span>
                </div>
                <div class="oper-wrap">
                    <span data-url="${pageContext.request.contextPath}/e/playyp.jsp?id=${requestScope.yingpian.id}" class="cst-btn cst-success required-login"><i class="fa fa-play-circle-o"></i>播放</span>
                    <span data-fun="shoucangFun" class="cst-btn cst-success required-login"><i class="fa fa-play-circle-o"></i>收藏</span>
                </div>
            </div>


        </div>


    </div>



	<jsp:include page="loginmodal.jsp"></jsp:include>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
