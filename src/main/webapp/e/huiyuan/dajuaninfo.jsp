<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.daowen.vo.DajuanVo" %>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>答卷信息查看</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <script type="text/javascript">
        $(function (){


        });
    </script>
</head>
<body >
	 <jsp:include page="head.jsp"></jsp:include>
		  <div class="wrap round-block">
			<div class="line-title">
				  当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>>>  ${requestScope.dajuan.title}  得分:(${dajuan.defen}分)
            </div>
    	
		   <div class="main">
		     <jsp:include  page="menu.jsp"></jsp:include>
	  <div  class="main-content">	

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



      </div>
	   </div>
	   </div>
</body>
</html>
