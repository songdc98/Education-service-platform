<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">




    
	<div class="menu-group">
		<h2><i class="fa fa-cog"></i>与我相关</h2>
		<ul>

			<li id="301">
				<a   href="${pageContext.request.contextPath}/admin/dajuanmanager.do?actiontype=get&seedid=301&dajuanren=${sessionScope.huiyuan.accountname}&forwardurl=/e/huiyuan/dajuanmanager.jsp">我的测试结果</a>
			</li>
			
			<li id="302" >
				<a  href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&lwren=${sessionScope.huiyuan.accountname}&seedid=302&forwardurl=/e/huiyuan/leavewordmanager.jsp">我的留言</a>
			</li>	
		    <li id="303" >
				<a  href="${pageContext.request.contextPath}/admin/shoucangmanager.do?actiontype=get&hyid=${sessionScope.huiyuan.id}&seedid=303&forwardurl=/e/huiyuan/shoucangmanager.jsp">我的收藏夹</a>
			</li>
			
			
			
		</ul>
	</div>
	

	<div class="menu-group">
		<h2>
			<i class="fa fa-info"></i>账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>

			<li id="203">
				<a href="${pageContext.request.contextPath}/e/huiyuan/modifypw.jsp?seedid=203" target="_self">登录密码修改</a>
			</li>
			<li id="104">
				<a href="${pageContext.request.contextPath}/e/huiyuan/yue.jsp?seedid=104" >账户余额</a>
			</li>
			
			<li id="103">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
         
		</ul>
	</div>




</div>