<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>用户登录</title>  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
     <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" type="text/javascript"></script>
     <script type="text/javascript"> 
  
      
       if(top.window!=window)
    	   top.location.href="login.jsp";
      
      $(function(){
      
    	  $("#btnReloadImage,#imgvc").on("click",function () {

              $("#imgvc").prop("src", "../plusin/image.jsp?time="+new Date().getMilliseconds());

          });
           $("#loginForm").submit(function(){
              
               if($("[name=username]").val()==""){
                  alert("用户名不能为空");
                  return false;
               }
               if($("[name=password]").val()==""){
                   alert("密码不能为空");
                   return false;
                }
               return true;
           
           });
          
      
      });
  
  </script>
				
    
</head>
<body>
<div id="div_background" >

    <div id="div_main">
        <div id="div_head"><p>恒生金融科技教育平台
            <span>后台登录</span></p></div>
        <div id="div_content">
            <img id="img_profile_picture"
                 src="${pageContext.request.contextPath}/admin/images/profile.jpg"/>
            <form id="loginForm" action="${pageContext.request.contextPath}/admin/login.do" method="post">
                <input type="hidden" name="actiontype" value="login" />
                <input name="usertype" value="0" type="hidden"/>
                <input type="text" class="form-control form_control" placeholder="用户名" value="${username}" name="username" title="请输入用户名" />
                <input type="password" class="form-control form_control" placeholder="密码" value="${password}" name="password" title="请输入密码" autocomplete="on">
                <div class="form-group">
                    <div class="field">
                        <input type="text" class="input input-big" name="validcode" value="${validcode }" placeholder="验证码" />
                        <img  id="imgvc" src="../plusin/image.jsp"  alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" >

                    </div>
                </div>
                <span  class="error-wrap"> ${errmsg}</span>
                <input type="submit" style="width: 280px;" class="dw-btn"  value="登录" />
            </form>
        </div>
    </div>
    <div id="div_foot">
        <span>© 2020</span>
        <span> ⋅ </span>
    </div>
</div>

</body>
</html>