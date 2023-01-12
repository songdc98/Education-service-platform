<%@ page import="com.daowen.vo.PaperVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="huiyuan/law.jsp" %>

<%
    ShijuanService shijuanSrv = BeansUtil.getBean("shijuanService", ShijuanService.class);
    ShijuanitemService sjiSrv = BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
    CeshitiService ceshitiSrv = BeansUtil.getBean("ceshitiService", CeshitiService.class);
    PaperVo paperVo = null;
    String id = request.getParameter("id");
    if (id != null) {
        paperVo = shijuanSrv.getPaper(Integer.parseInt(id));
        if (paperVo != null) {
            request.setAttribute("shijuan", paperVo);
            request.setAttribute("pmCeshiti", paperVo.paperModule(1));
            request.setAttribute("pmPanduan", paperVo.paperModule(2));
            request.setAttribute("pmTiankong", paperVo.paperModule(3));
            request.setAttribute("pmJianda", paperVo.paperModule(4));
        }
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>在线测试</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css"
          type="text/css"></link>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jquery.timer/jquery.timer1.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/student/js/StringEx.js"></script>

    <script type="text/javascript">


        $(function () {
            $("#form1").submit(function () {

                return confirm("确认定要提交答卷吗？");
            });
            $.metadata.setType("attr", "validate");
            $("#form1").validate();

        });
    </script>

</head>
<body>
<jsp:include page="/e/huiyuan/head.jsp"></jsp:include>

<div class="wrap round-block">


    <!--end text-box-->

    <div class="brief-title">${requestScope.shijuan.title}>>在线测试</div>
    <div class="brief-content">

        <form id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/admin/shijuanmanager.do">
            <input type="hidden" name="actiontype" value="test"/>
            <input type="hidden" name="shijuanid" value="${requestScope.shijuan.id}"/>
            <input type="hidden" name="title" value="${requestScope.shijuan.title }"/>
            <input type="hidden" name="testerid" value="${sessionScope.huiyuan.id }"/>
            <input type="hidden" name="kemu" value="${requestScope.shijuan.kemu}"/>
            <input type="hidden" name="zujuanren" value="${requestScope.shijuan.zujuanren}"/>
            <input type="hidden" name="testername" value="${sessionScope.huiyuan.name}"/>

            <input type="hidden" name="manfen" id="hidManfen" value="${requestScope.shijuan.zongfen}"/>
            <input type="hidden" name="forwardurl"
                   value="/e/testres.jsp"/>

            <table border="0" cellspacing="1" class="grid" cellpadding="0"
                   width="100%">

                <tr>

                    <td>
                        一.单选题
                    </td>
                </tr>


                <c:forEach varStatus="status" var="ceshiti" items="${pmCeshiti.questions}">


                    <tr>

                        <td>
                            <input name="tihaolist" type="hidden" value="${ceshiti.sjiid}"/>

                            <input name="tihao${ceshiti.sjiid}" type="hidden" value="${ceshiti.id}"/>
                            <input name="qtype${ceshiti.sjiid}" type="hidden" value="1"/>
                                 ${status.index+1} ${ceshiti.title}
                            <input name="fenshu${ceshi.sjiid}" type="hidden"
                                   value="${ceshiti.fenshu}"/>${ceshiti.fenshu}分
                            <input name="stdaan${ceshi.sjiid}" type="hidden" value="${ceshiti.daan}"/>

                        </td>
                    </tr>

                    <tr>
                        <td>

                            A:<input name="daan${ceshiti.sjiid}" type="radio" value="A"/>
                                ${ceshiti.choicea}

                        </td>
                    </tr>
                    <tr>
                        <td>


                            B: <input name="daan${ceshiti.sjiid}" type="radio" value="B"/>${ceshiti.choiceb}


                        </td>
                    </tr>
                    <tr>
                        <td>


                            C: <input name="daan${ceshiti.sjiid}" type="radio" value="C"/>${ceshiti.choicec}


                        </td>
                    </tr>
                    <tr>
                        <td>


                            D: <input name="daan${ceshiti.sjiid}" type="radio" value="D"/>${ceshiti.choiced}


                        </td>
                    </tr>


                </c:forEach>

                <tr>
                    <td height="30">二.判断题


                    </td>
                </tr>

                <c:forEach varStatus="status" var="panduan" items="${pmPanduan.questions}">


                    <tr>

                        <td>
                            <input name="tihaolist" type="hidden" value="${panduan.sjiid}"/>
                            <input name="tihao${panduan.sjiid}" type="hidden" value="${panduan.id}"/>
                            <input name="qtype${panduan.sjiid}" type="hidden" value="2"/>
                                ${status.index+1} ${panduan.title}
                            <input name="fenshu${panduan.sjiid}" type="hidden"
                                   value="${panduan.fenshu}"/>${panduan.fenshu}分
                            <input name="stdaan${panduan.sjiid}" type="hidden" value="${panduan.daan}"/>

                        </td>
                    </tr>

                    <tr>
                        <td>

                            <input name="daan${panduan.sjiid}" checked="checked" type="radio" value="正确"/>
                            正确

                            <input name="daan${panduan.sjiid}" type="radio" value="错误"/>
                            错误

                        </td>
                    </tr>

                </c:forEach>

                <!-- 填空题开始 -->
                <tr>
                    <td height="30">三.填空题


                    </td>
                </tr>


                <c:forEach varStatus="status" var="tiankong" items="${pmTiankong.questions}">


                    <tr>

                        <td>
                            <input name="tihaolist" type="hidden" value="${tiankong.sjiid}"/>
                            <input name="qtype${tiankong.sjiid}" type="hidden" value="3"/>
                            <input name="tihao${tiankong.sjiid}" type="hidden" value="${tiankong.id}"/>
                                ${status.index+1} ${tiankong.title}
                            <input name="fenshu${tiankong.sjiid}" type="hidden" value="${tiankong.id}"/>${tiankong.id}分
                            <input name="stdaan${tiankong.sjiid}" type="hidden" value="${tiankong.daan}"/>

                        </td>
                    </tr>

                    <tr>
                        <td>

                            答案: <input name="daan${tiankong.sjiid}" class="input-txt" type="text"/>


                        </td>
                    </tr>
                </c:forEach>

                <!-- 简答题开始 -->
                <tr>
                    <td height="30">四.简答题


                    </td>
                </tr>


                <c:forEach varStatus="status" var="jianda" items="${pmJianda.questions}">


                    <tr>

                        <td>
                            <input name="tihaolist" type="hidden" value="${jianda.sjiid}"/>
                            <input name="tihao${jianda.sjiid}" type="hidden" value="${jianda.id}"/>
                            <input name="qtype${jianda.sjiid}" type="hidden" value="4"/>
                                ${status.index+1} ${jianda.title}
                            <input name="fenshu${jianda.sjiid}" type="hidden" value="${jianda.fenshu}"/>${jianda.fenshu}分


                        </td>
                    </tr>

                    <tr>
                        <td>

                            答案: <textarea name="daan${jianda.sjiid}" style="width:58%;height:80px;">
                                       </textarea>


                        </td>
                    </tr>

                </c:forEach>
                <tr>

                    <td>


                        <input type="submit" name="bntOK" class="btn btn-default" value="提交测试"/>

                    </td>

                </tr>

            </table>

        </form>
    </div>

</div>


</div>
<div class="fn-clear"></div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
