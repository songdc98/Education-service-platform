<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.daowen.vo.PaperVo" %>
<%@ page import="com.daowen.vo.DajuanVo" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="law.jsp" %>
<%

    DajuanService dajuanSrv = BeansUtil.getBean("dajuanService", DajuanService.class);
    String id = request.getParameter("id");
    DajuanVo dajuanVo = null;
    if (id != null) {
        dajuanVo = dajuanSrv.getInfo(Integer.parseInt(id));
        request.setAttribute("dajuan", dajuanVo);
        request.setAttribute("pmCeshiti", dajuanVo.paperModule(1));
        request.setAttribute("pmPanduan", dajuanVo.paperModule(2));
        request.setAttribute("pmTiankong", dajuanVo.paperModule(3));
        request.setAttribute("pmJianda",  dajuanVo.paperModule(4));

    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>试卷信息查看</title>

    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery.jqprint-0.3.js"></script>
    <script type="text/javascript">


        $(function () {


            $("#btnPrint").click(function () {

                $("#printView").jqprint();


            });

        });
    </script>
</head>
<body>

<div class="search-title">
    <h2>
        ${requestScope.dajuan.title} 得分:(${requestScope.dajuan.defen}分)
    </h2>
    <div class="description">
        测试人:${requestScope.dajuan.testername}
        <span id="btnPrint" class="orange-href"><i class="fa fa-print"></i>打印</span>
    </div>
</div>
<div id="printView">
    <table border="0" cellspacing="1" class="grid" cellpadding="0"
           width="100%">
        <tr>
            <td height="30">一.单选题</td>
        </tr>


        <c:forEach varStatus="status" var="ceshiti" items="${pmCeshiti.questions}">


            <tr>

                <td>

                        ${status.index+1}
                        ${ceshiti.title}
                        ${ceshiti.fenshu}分
                </td>
            </tr>

            <tr>
                <td>

                    A:
                        ${ceshiti.choicea}


                </td>
            </tr>
            <tr>
                <td>

                    B:
                        ${ceshiti.choiceb}


                </td>
            </tr>
            <tr>
                <td>


                    C:
                        ${ceshiti.choicec}


                </td>
            </tr>
            <tr>
                <td>


                    D:
                        ${ceshiti.choiced}


                </td>
            </tr>

            <tr>
                <td>
                    作答:${ceshiti.result}
                    <br/>
                    参考答案:${ceshiti.daan}
                    <br/>


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
                    <input name="tihaolist" type="hidden" value="${panduan.id}"/>
                        ${status.index+1} ${panduan.title}
                        ${panduan.fenshu}分

                </td>
            </tr>
            <tr>
                <td>
                    作答:${panduan.result}
                    <br/>
                    参考答案:${panduan.daan}
                    <br/>


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
                        ${status.index+1} ${tiankong.title}
                        ${tiankong.fenshu}分


                </td>
            </tr>
            <tr>
                <td>
                    作答:${tiankong.result}
                    <br/>
                    参考答案:${tiankong.daan}
                    <br/>


                </td>
            </tr>

        </c:forEach>

        <!-- 填空题结束 -->


        <!-- 简答题开始 -->
        <tr>
            <td height="30">四.简答题


            </td>
        </tr>


        <c:forEach varStatus="status" var="jianda" items="${pmJianda.questions}">


            <tr>

                <td>

                        ${status.index+1} ${jianda.title}
                        ${jianda.fenshu}分


                </td>
            </tr>

            <tr>
                <td>
                    作答:${jianda.result}

                </td>
            </tr>
            <tr>
                <td>

                    参考答案:${jianda.daan}
                    <br/>


                </td>
            </tr>


        </c:forEach>

        <!-- 简答题结束 -->


    </table>

</div>


</body>
</html>
