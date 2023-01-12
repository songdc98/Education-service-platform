<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="law.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>首页</title>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
    <link href="${pageContext.request.contextPath}/webui/jquery-confirm/jquery-confirm.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/webui/jquery-confirm/jquery-confirm.min.js"></script>
    <link href="${pageContext.request.contextPath}/webui/jquery-toast/jquery.toast.css" rel="stylesheet" />
    <script  src="${pageContext.request.contextPath}/webui/jquery-toast/jquery.toast.js"></script>
    <script type="text/javascript">
        $(function () {

            $(".btn-exit").click(function () {


                $.confirm({
                    title: '系统提示',
                    icon: 'fa fa-warning',
                    content: '确定要离开系统吗?',
                    confirmButton: '确定',
                    confirmButtonClass: 'btn-primary',
                    cancelButton: '取消',
                    cancelButtonClass: 'btn-default btn',
                    closeIcon: true,
                    confirm: function () {

                        $.ajax({
                            url: "${pageContext.request.contextPath}/adminuser/exit",
                            method: 'POST',
                            dataType: 'json',
                            success: function (dataText) {
                                window.location.reload();
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(XMLHttpRequest.status + errorThrown);
                            }
                        });
                    }
                });//confirm end

            });//click end

            $("ul.nav-second-level>li").click(function () {
                if ($("#side-menu>li").hasClass("active"))
                    $("#side-menu>li").removeClass("active");
                if ($("#side-menu li>ul").hasClass("in"))
                    $("#side-menu li>ul").removeClass("in");
                let  $this=$(this);
                $this.parent("ul").closest("li").addClass("active");
                if(!$this.closest("ul").hasClass("in"))
                    $this.closest("ul").addClass("in");
                if ($(".nav-second-level li").hasClass("active"))
                    $(".nav-second-level li").removeClass("active");
                $(this).addClass("active");
            });


        });
</script>
    <style>
        body{
           overflow-y: hidden;
        }
    </style>
</head>
<body >
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                            <span>
                                <img alt="image" class="img-circle" src="${pageContext.request.contextPath}${sessionScope.users.xiangpian}" />
                            </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs">
                                        <strong class="font-bold">${sessionScope.users.username}</strong>
                                    </span> <span class="text-muted text-xs block">${sessionScope.users.realname}(${sessionScope.users.rolename})<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a target="main" href="${pageContext.request.contextPath}/admin/accountinfo.jsp">用户信息</a></li>
                            <li><a target="main" href="${pageContext.request.contextPath}/admin/modifypw.jsp">修改密码</a></li>
                            <li><a target="main" href="${pageContext.request.contextPath}/admin/modifyinfo.jsp">编辑账户</a></li>
                            <li class="divider"></li>
                            <li><a class="btn-exit" href="#">退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        英语
                    </div>
                </li>

                <li class="active">
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">测试管理</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">

                        <li><a href="${pageContext.request.contextPath}/admin/dajuanmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>答卷管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>试卷管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=load" target="main"><span class="icon-caret-right"></span>新增试卷</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/ceshitimanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>单选题管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/panduanmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>判断题管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/tiankongmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>填空题管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/jiandamanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>简答题管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/kechengmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>科目管理</a></li>

                    </ul>
                </li>
                <li >
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">资讯管理</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">


                        <li><a href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>资讯管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load" target="main"><span class="icon-caret-right"></span>发布资讯</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>栏目管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/yingpianmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>视频管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/yingpianmanager.do?actiontype=load" target="main"><span class="icon-caret-right"></span>发布视频</a></li>
                    </ul>
                </li>

                <li >
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>会员管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>后台用户管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/modifypw.jsp" target="main"><span class="icon-caret-right"></span>修改密码</a></li>

                    </ul>
                </li>

                <li >
                    <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">系统设置</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>轮播图管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>栏目管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=get" target="main">首页栏目设置</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/sysconfigmanager.do?actiontype=get" target="main"><span class="icon-caret-right"></span>网站信息设置</a></li>

                    </ul>
                </li>

            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="white-bg dashbard-1">
       <div style="height:100%;">
           <div style="height:8%;" class="row border-bottom">
               <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                   <div class="navbar-header">
                       <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>

                   </div>
                   <ul class="nav navbar-top-links navbar-right">


                       <li>
                           <a href="${pageContext.request.contextPath}/e/index.jsp" class="m-r-sm text-muted welcome-message">首页</a>
                       </li>

                       <li>
                          <span class="m-r-sm text-muted welcome-message">恒生金融科技教育服务平台</span>
                       </li>




                       <li>
                           <a href="#" class="btn-exit">
                               <i class="fa fa-sign-out"></i> 退出
                           </a>
                       </li>
                   </ul>

               </nav>
           </div>

           <iframe style="width: 100%;height:92%; " scrolling="auto"  frameborder="0" src="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get" name="main" ></iframe>
       </div>



    </div>
</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/webui/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/inspinia.js"></script>