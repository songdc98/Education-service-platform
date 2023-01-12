<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    TiankongService tiankongSrv=BeansUtil.getBean("tiankongService", TiankongService.class);
    if( id!=null)
    {
      Tiankong temobjtiankong=tiankongSrv.load(" where id="+ id);
      request.setAttribute("tiankong",temobjtiankong);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>填空题信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看填空题
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >答案:</td>
											   <td>
												   ${requestScope.tiankong.daan}
												</td>
											   </tr>
											   <tr>
											    <td align="right" >科目:</td>
											   <td>
												   ${requestScope.tiankong.kemu}
												</td>
											   </tr>
          <tr>
					                      <td align="right" >题目:</td>
					                       <td colspan="3">
											 ${requestScope.tiankong.title}
											   </td>
											  </tr>
				        </table>
</body>
</html>
