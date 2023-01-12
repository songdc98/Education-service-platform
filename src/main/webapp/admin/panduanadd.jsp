<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>判断题</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
       <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        
        $(function (){
        	$("[name=difffact]").val("${panduan.difffact}");

			$("#kmid").change(function(){
				$("[name=kemu]").val($("#kmid option:selected").text());
			});
			$("[name=daan][value='${requestScope.panduan.daan}']").prop("checked","checked");
			$("[name=kemu]").val($("#kmid option:selected").text());
            $.metadata.setType("attr","validate");
            $("#panduanForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建判断题</h2>
		<div class="description"></div>
	</div>
	<form name="panduanform" method="post"
		action="${pageContext.request.contextPath}/admin/panduanmanager.do"
		id="panduanForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/panduanadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/panduanmanager.do?actiontype=get&forwardurl=/admin/panduanmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>

			<tr>
				<td align="right">课程:</td>
				<td><web:dropdownlist name="kmid" id="kmid" cssclass="dropdown"
									  value="${requestScope.panduan.kemu}"
									  datasource="${kemu_datasource}" textfieldname="mingcheng"
									  valuefieldname="id">
				</web:dropdownlist>
					<input  name="kemu" type="hidden"
							value="${requestScope.shijuan.kemu}" />
				</td>
			</tr>
			<tr>
				<td align="right">题目:</td>
				<td><input name="title" placeholder="题目"
					validate="{required:true,messages:{required:'请输入题目'}}"
					value="${requestScope.panduan.title}" class="input-txt" type="text"
					id="txtTitle" /></td>
			</tr>
			<tr>
				<td align="right">答案:</td>
				<td>
				    <input name="daan" value="正确"  checked="checked" type="radio" /> 正确
				    
				    <input name="daan" value="错误"   type="radio" /> 错误
				</td>
			</tr>
			<tr>
				<td align="right">难易程度:</td>
				<td>
				     <select style="width:120px;height:40px;" name="difffact" >
				          <option  selected="selected" value="0.5">一般</option>
				         <option value="0.8">非常难</option>
				         <option value="0.6">较难</option>
				        
				         <option value="0.3">容易</option>
				      </select>
				     
				</td>
			</tr>
			
			<tr>
				<td colspan="4">
						<button class="orange-button">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</td>
			</tr>
		</table>
	</form>
</body>
</html>
