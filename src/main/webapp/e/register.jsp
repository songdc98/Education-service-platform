
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="import.jsp" %>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>


<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js"></script>
 <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
 <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
 <style type="text/css">
    label.error{
        position: absolute;
        top: 2px;
        left:388px;

    }
 </style>
<script type="text/javascript">
        $(function (){
            $.metadata.setType("attr","validate");
            $("#form1").validate();
        });  
 </script>
</head>
<body>
      <div class="reg-page">

          <div class="reg-box">
              <div class="hd">
                  在线注册
              </div>
              <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/huiyuanmanager.do">
                  <input type="hidden" name="actiontype" value="save" />
                  <input type="hidden" name="forwardurl" value="/e/regresult.jsp" />
              <div class="bd">

                  <div class="stdrow">
                      <div class="tb">用户名:</div>
                      <div class="ct">
                          <input name="accountname"  placeholder="账户名" value="${requestScope.accountanme}" validate="{required:true,mobile:true,messages:{required:'请输入账户名',mobile:'请输入正确的电话号码'}}"  class="input-cnt" type="text"/>
                      </div>
                  </div>
                  <div class="stdrow">
                      <div class="tb">密码:</div>
                      <div class="ct">
                          <input name="password" id="txtPassword" placeholder="密码"  value="${requestScope.password}" validate="{required:true,messages:{required:'请输入密码'}}" class="input-cnt" type="password"/>
                      </div>
                  </div>
                  <div class="stdrow">
                      <div class="tb">确认密码:</div>
                      <div class="ct">
                          <input name="password2" value="${requestScope.password2}" placeholder="确认密码" class="input-cnt" type="password"  validate="{required:true,equalTo:'#txtPassword',messages:{required:'请再次输入密码',equalTo:'两次密码不一致'}}"/>
                      </div>
                  </div>
                  <div class="stdrow">
                      <div class="tb">姓名:</div>
                      <div class="ct">
                          <input name="name"  placeholder="姓名" value="${requestScope.name}" class="input-cnt" type="text"  validate="{required:true,messages:{required:'请输入姓名'}}"/>
                      </div>
                  </div>
                  <div class="stdrow">
                      <div class="tb">身份证号:</div>
                      <div class="ct">
                          <input name="idcardno"  placeholder="身份证号" value="${requestScope.name}" class="input-cnt" type="text" validate="{required:true,idcardno:true,messages:{required:'请输入身份证号',idcardno:'请输入正确的身份证号'}}"/>
                      </div>
                  </div>

                  <div class="stdrow">
                      <div class="tb">邮箱:</div>
                      <div class="ct">
                          <input name="email"  placeholder="邮箱" value="${requestScope.email}" class="input-cnt" validate="{required:true,email:true,messages:{required:'请输入邮箱',email:'请输入正确邮箱'}}"  type="text"/>
                      </div>
                  </div>

                  <div class="stdrow">

                      <button class="reg-btn">注册</button>
                  </div>
                  <div class="stdrow">
                      ${requestScope.errmsg}
                      <a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
                  </div>

              </div>
              </form>
          </div>
      </div>
</body>
</html>