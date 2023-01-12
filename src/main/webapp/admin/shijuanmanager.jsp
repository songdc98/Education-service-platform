<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%@ include file="law.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>试卷信息</title>

    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
            type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript">
        $(function () {
            $("#btnDelete").click(function () {
                var ids = $(".check[type=checkbox]:checked").serialize();
                if ($(".check:checked").length < 1) {
                    $.dialog.alert("请选择需要删除条目");
                    return;
                }
                if (!confirm("你确定要删除吗")) {
                    return;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=delete",
                    method: 'post',
                    data: ids,
                    success: function (data) {
                        window.location.reload();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status + errorThrown);
                    }
                });
            });
            $("#btnCheckAll").click(function () {
                var ischeck = false;
                $(".check").each(function () {
                    if ($(this).is(":checked")) {
                        $(this).prop("checked", "");
                        ischeck = false;
                    } else {
                        $(this).prop("checked", "true");
                        ischeck = true;
                    }
                });
                if ($(this).text() == "选择记录")
                    $(this).text("取消选择");
                else
                    $(this).text("选择记录");
            })
        });
    </script>
</head>
<body style="overflow:auto;">

<div class="search-title">
    <h2>
        试卷管理
    </h2>
    <div class="description">
    </div>
</div>
<!-- 搜索控件开始 -->
<div class="search-options">
    <form id="searchForm"
          action="${pageContext.request.contextPath}/admin/shijuanmanager.do"
          method="post">
        <table cellspacing="1" width="100%">
            <tbody>
            <tr>
                <td>试卷名 <input name="title" value="${title}"
                               class="input-txt" type="text" id="title"/> <input
                        type="hidden" name="actiontype" value="search"/> <input
                        type="hidden" name="seedid" value="${seedid}"/> <input
                        type="hidden" name="forwardurl"
                        value="/admin/shijuanmanager.jsp"/>
                    <input type="submit" value="搜索" id="btnSearch"
                           class="orange-button"/>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<!-- 搜索控件结束 -->
<div class="clear"></div>
<div class="action-details">
    <div class="btn-group">
        <button id="btnCheckAll" class="btn btn-default btn-success btn-group-sm">
            <span class="fa fa-check"></span>
            选择
        </button>
        <button id="btnDelete" class="btn btn-default btn-success btn-group-sm">
            <span class="fa fa-remove"></span>
            删除
        </button>

    </div>
</div>
<table id="module" width="100%" border="0" cellspacing="0"
       cellpadding="0" class="ui-record-table">
    <thead>
    <tr>
        <th>选择</th>
        <th><b>试卷名</b>
        </th>
        <th><b>试卷状态</b>
        </th>
        <th><b>组卷人</b>
        </th>
        <th><b>难度系数</b>
        </th>
        <th><b>总分</b>
        </th>
        <th><b>科目</b>
        </th>


        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${fn:length(listshijuan) == 0}">
        <tr>
            <td colspan="20">没有相关试卷信息</td>
        </tr>
    </c:if>
    <c:forEach items="${listshijuan}" var="shijuan">


        <tr>
            <td>&nbsp<input class="check" name="ids" type="checkbox"
                            value='${shijuan.id}'/>
            </td>
            <td>${shijuan.title}</td>
            <td>

                <c:if test="${shijuan.state==1}">
                    组卷中
                </c:if>
                <c:if test="${shijuan.state==2}">
                    组卷完成
                </c:if>


            </td>
            <td>${shijuan.zujuanren}</td>

            <td>
                <c:if test="${shijuan.difffact==0.8}">
                    非常难
                </c:if>
                <c:if test="${shijuan.difffact==0.6}">
                    较难
                </c:if>
                <c:if test="${shijuan.difffact==0.5}">
                    一般
                </c:if>
                <c:if test="${shijuan.difffact==0.3}">
                    容易
                </c:if>


            </td>
            <td>${shijuan.zongfen}</td>
            <td>${shijuan.kemu}</td>
            <td>
                <c:if test="${shijuan.state==1}">
                    <a class="orange-href"
                       href="${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=load&id=${shijuan.id}&forwardurl=/admin/shijuanadd.jsp">修改试卷</a>

                    <a class="orange-href"
                       href="${pageContext.request.contextPath}/admin/autozujuanguide.jsp?sjid=${shijuan.id}">智能组卷</a>
                </c:if>
                <c:if test="${shijuan.state==2}">
                    <a class="orange-href"
                       href="${pageContext.request.contextPath}/admin/shijuaninfo.jsp?sjid=${shijuan.id}">查看试卷</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="clear"></div>
<daowen:pager id="pager1" attcheform="searchForm"/>

</body>
</html>
