<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>简答</title>
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
   <script type="text/javascript">
      
        $(function (){
           
        	let   editor = KindEditor.create('textarea[name="daan"]', {
	             uploadJson : '../plusin/upload_json.jsp',
		         fileManagerJson : '../plusin/file_manager_json.jsp',
	            resizeType: 1,
		        allowFileManager: true
		       });
			let titleed = KindEditor.create('textarea[name="title"]', {
				uploadJson: '../plusin/upload_json.jsp',
				fileManagerJson: '../plusin/file_manager_json.jsp',
				resizeType: 1,
				allowFileManager: true
			});

			$("#kmid").change(function(){
				$("[name=kemu]").val($("#kmid option:selected").text());
			});
			$("[name=kemu]").val($("#kmid option:selected").text());
        	$("[name=difffact]").val("${jianda.difffact}");
            $.metadata.setType("attr","validate");
            $("#jiandaForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建简答</h2>
		<div class="description"></div>
	</div>
	<form name="jiandaform" method="post"
		action="${pageContext.request.contextPath}/admin/jiandamanager.do"
		id="jiandaForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/jiandaadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/jiandamanager.do?actiontype=get&forwardurl=/admin/jiandamanager.jsp" />
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
				<td colspan="3"><textarea name="title" rows="4" id="txtTitle"
						style="width: 98%; height: 200px;" validate="{required:true}">${requestScope.jianda.title}</textarea>
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
				<td align="right">答案:</td>
				<td colspan="3"><textarea name="daan" rows="4" id="txtDaan"
						style="width: 98%; height: 100px;" validate="{required:true}">${requestScope.jianda.daan}</textarea>
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
