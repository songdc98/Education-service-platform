<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

	String id=request.getParameter("id");
	XinxiService xinxiSrv=BeansUtil.getBean("xinxiService", XinxiService.class);
	if(id!=null){

		Xinxi xinxi=xinxiSrv.load(new Integer(id));

		if(xinxi!=null){
			xinxi.setClickcount(xinxi.getClickcount()+1);
			xinxiSrv.update(xinxi);
			request.setAttribute("xinxi",xinxi);
		}

	}
	List<Xinxi> listHotXinxi=xinxiSrv.getTopEntity(" order by clickcount desc",10);
	if(listHotXinxi!=null)
		request.setAttribute("listHotXinxi",listHotXinxi);

%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>系统首页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>


	<script type="text/javascript">

		$(function(){

			window.agreeFun=function(){


				$.ajax({

					url:encodeURI('${pageContext.request.contextPath}/admin/xinxi/agree'),
					method:'post',
					data:{

						"targetid":"${requestScope.xinxi.id}",
						"commentator":"${sessionScope.huiyuan.accountname}"
					},
					success:function(data){
						console.log(data);
						if(data.stateCode==1){
							//点赞数量
							$("#btnAgree [name=count]").html(data.data.agreecount);
						}

						if(data.stateCode==-2){
							$.toast({
								text: '你已经赞过不能再赞',
								icon: 'error',
								hideAfter: 2000,
								allowToastClose: false,
								position: 'mid-center',
								loader: false,        // Change it to false to disable loader
								loaderBg: '#9EC600'  // To change the background
							});
							return;
						}

					},
					error:function(xmhttprequest,status,excetpion){
						alert("系统错误，错误编码"+status);
					}
				});

			};

			window.againstFun=function(){



				$.ajax({

					url:encodeURI('${pageContext.request.contextPath}/admin/xinxi/against'),
					method:'post',
					data:{

						"targetid":"${requestScope.xinxi.id}",
						"commentator":"${sessionScope.huiyuan.accountname}"
					},
					success:function(data){
						console.log(data);
						if(data.stateCode==1){
							//点赞数量
							$("#btnAgainst [name=count]").html(data.data.againstcount);
						}

						if(data.stateCode==-2){
							$.toast({
								text: '你已经赞过不能再赞',
								icon: 'error',
								hideAfter: 2000,
								allowToastClose: false,
								position: 'mid-center',
								loader: false,        // Change it to false to disable loader
								loaderBg: '#9EC600'  // To change the background
							});
							return;
						}

					},
					error:function(xmhttprequest,status,excetpion){
						alert("系统错误，错误编码"+status);
					}
				});

			};

			window.shoucangFun=function(){


				$.ajax({

					url:'${pageContext.request.contextPath}/admin/shoucang/ajaxsave',
					datatype:'JSON',
					method:'POST',
					data:{
						"targetid":"${requestScope.xinxi.id}",
						"targetname":"${requestScope.xinxi.title}",
						"tupian":"${requestScope.xinxi.tupian2}",
						"hyid":"${sessionScope.huiyuan.id}",
						"xtype":"xinxi",
						"href":"/e/xinxiinfo.jsp?id=${requestScope.xinxi.id}"
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




		});


	</script>







</head>
<body>

<jsp:include page="head.jsp"></jsp:include>



<input type="hidden" id="commentresurl" value="/e/xinxiinfo.jsp?id=<%=id%>">
<input type="hidden" id="reUrl" name="reurl" value="/e/xinxiinfo.jsp?id=<%=id%>"/>

<div class="fn-clear"></div>


<div  class="wrap  round-block">

	<div class="two-split ">
		<div class="split-left white-paper">
               <div class="news-info">
	<div class="title">${requestScope.xinxi.title}</div>
	<div class="con-des">
		<span><i class="fa fa-clock-o"></i><fmt:formatDate value="${requestScope.xinxi.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>

		<span id="btnAgree" data-fun="agreeFun"  class="btn btn-default required-login"><i
				class="fa fa-thumbs-up"></i> 赞<span name="count">${requestScope.xinxi.agreecount}</span></span>

		<span id="btnAgainst" data-fun="againstFun" class="btn btn-default required-login"><i
				class="fa fa-thumbs-down"></i> 踩<span name="count">${requestScope.xinxi.againstcount}</span></span>

		<span  id="btnShoucang" data-fun="shoucangFun"  class="btn btn-default required-login"><i class="fa fa-plus"></i>关注</span>

	</div>
	<div class="brief-content">
		${xinxi.dcontent}
	</div>

	<jsp:include page="comment.jsp">
		<jsp:param value="xinxi" name="commenttype"/>
	</jsp:include>
   </div>
		</div>
		<div class="split-right">
			<div class="vm-sidebar">
				<div class="hd">热门信息</div>
				<div class="bd">
					<c:forEach items="${listHotXinxi}" var="xinxi">


						<div class="item">
							<a href="${pageContext.request.contextPath}/e/xinxiinfo.jsp?id=${xinxi.id}">
								<div class="image-wrap">
									<img src="${pageContext.request.contextPath}${xinxi.tupian2}"/>
								</div>
								<div class="tag">${xinxi.lanmuming}</div>
								<div class="text-wrap">
									<div class="name">${xinxi.title}</div>
									<div class="muted"><fmt:formatDate value="${xinxi.pubtime}" pattern="yyyy-MM-dd"/></div>
									<div class="bm-wrap">${xinxi.clickcount}人点击</div>
								</div>
							</a>
						</div>


					</c:forEach>

				</div>
			</div>
		</div>
	</div>

</div>




<div class="fn-clear"></div>


<jsp:include page="bottom.jsp"></jsp:include>
<jsp:include page="loginmodal.jsp"></jsp:include>



</body>
</html>