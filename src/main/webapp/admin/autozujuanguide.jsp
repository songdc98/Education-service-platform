<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  sjid=request.getParameter("sjid");
    Shijuan temobjshijuan=null;
    ShijuanService shijuanSrv=BeansUtil.getBean("shijuanService",ShijuanService.class);
    if( sjid!=null){
       temobjshijuan=shijuanSrv.load(" where id="+ sjid);
       request.setAttribute("shijuan",temobjshijuan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>试卷信息查看</title>
  
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <script type="text/javascript">
   
   
       var init=function(){
        	
        	 var sum=0;
        	 var danxuanfen=$("#txtDanxuanCount").val()*$("#txtDanxuanFen").val();
            
             var tiankongfen=$("#txtTiankongCount").val()*$("#txtTiankongFen").val();
             var panduanfen=$("#txtPanduanCount").val()*$("#txtPanduanFen").val();
             var jiandafen=$("#txtZuowenCount").val()*$("#txtZuowenFen").val();
             
             sum=danxuanfen+tiankongfen+panduanfen+jiandafen;
         
            $("#hidSjzongfen").val(sum);
            $("#spZongfen").html("("+sum+"分)");
            return sum;
            
        	
        }
        $(function ()
        {
        	
        	  $.metadata.setType("attr", "validate");
              
              $("#form1").validate();
              
              init();
        	  $(".changefen").blur(function(){
                 
                  init();
           
              });
        	  $("#form1").submit(function(){
        		  
        		  var sum=init();
        		  if(sum!=100)
        			  {
        			    
        			    return false;
        			  }
        		  
        	  });
              
              
              
        	
        });  
    </script>
</head>
<body >
	
	          <div class="search-title">
	                <h2>
	                      ${requestScope.shijuan.title}  满分:(<%=temobjshijuan.getZongfen()%>分)  
	                      
	                                  难易程度:<c:if test="${requestScope.shijuan.difffact==0.8 }">
	                                                                             非常难
	                            </c:if> 
	                            <c:if test="${requestScope.shijuan.difffact==0.6 }">
	                                                                             较难
	                            </c:if> 
	                            <c:if test="${requestScope.shijuan.difffact==0.5 }">
	                                                                             一般
	                            </c:if> 
	                            <c:if test="${requestScope.shijuan.difffact==0.3 }">
	                                                                             容易
	                            </c:if>
							  <c:if test="${requestScope.shijuan.state==1}">
								  当前试卷总分: <span style="color:red;"  id="spZongfen">  </span>
							  </c:if>

	                </h2>
                <div class="description">
                                                           试卷状态:
					<c:if test="${requestScope.shijuan.state==1}">
						待组卷
					</c:if>
					<c:if test="${requestScope.shijuan.state==2}">
						组卷完成
					</c:if>
	                  
                </div>
              </div>
              <form  id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/admin/shijuanmanager.do">
				<input type="hidden" name="actiontype"  value="zujuanAuto"/>
				<input type="hidden" name="kmid"  value="${requestScope.shijuan.kmid }"/>
				<input type="hidden" name="kemu"  value="${requestScope.shijuan.kemu }"/>
				<input type="hidden" name="sjid"  value="${requestScope.shijuan.id}"/>
				<input type="hidden" name="difffact" value="${requestScope.shijuan.difffact}"/>
				<input type="hidden" name="sjzongfen" id="hidSjzongfen"  value=""/>
				<input type="hidden" name="manfen" id="hidManfen" validate="{equalTo:'#hidSjzongfen',messages:{equalTo:'试卷总分需要调整到${requestScope.shijuan.zongfen}分，亲继续组卷'}}"  value="${requestScope.shijuan.zongfen}"/>
				<input type="hidden" name="forwardurl" value="/admin/shijuaninfo.jsp?sjid=<%=sjid%>"  />
				<input type="hidden" name="errorurl" value="/admin/autozujuanguide.jsp?sjid=<%=sjid%>"  />
				
				<table border="0" cellspacing="1" class="grid" cellpadding="0"
					width="100%">

					<tr>
					  <td colspan="4">
					     ${errormsg}
					  </td>
					</tr>
					<tr>
						<td  height="30">
							单选题题数:
						</td>
						<td><input type="text"  name="danxuancount" id="txtDanxuanCount" value="${danxuancount}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'单选题数不能为空',digits:'请输入正确单选题数'}}" class="input-txt changefen"></td>
						<td  height="30">
							每题分数:
						</td>
						<td><input type="text" name="danxuanfen" id="txtDanxuanFen" value="${danxuanfen}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'分值不能为空',digits:'请输入正确分值'}}" class="input-txt changefen"></td>
					</tr>

					<tr>
						<td  height="30">
							判断题数:
						</td>
						<td><input type="text"  name="panduancount"  id="txtPanduanCount" value="${panduancount}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'判断题数不能为空',digits:'请输入正确判断题数'}}" class="input-txt changefen"></td>
						<td  height="30">
							每题分数:
						</td>
						<td><input type="text" name="panduanfen" id="txtPanduanFen" value="${panduanfen}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'分值不能为空',digits:'请输入正确分值'}}" class="input-txt changefen"></td>
					</tr>
					<tr>
						<td  height="30">
							填空题数:
						</td>
						<td><input type="text" name="tiankongcount" id="txtTiankongCount" value="${tiankongcount}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'填空题数不能为空',digits:'请输入正确填空题数'}}" class="input-txt changefen"></td>
						<td  height="30">
							每题分数:
						</td>
						<td><input type="text" name="tiankongfen" id="txtTiankongFen" value="${tiankongfen}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'分值不能为空',digits:'请输入正确分值'}}"  class="input-txt changefen"></td>
					</tr>
					<tr>
						<td  height="30">
							简单题数:
						</td>
						<td><input type="text"  name="zuowencount" id="txtZuowenCount" value="${zuowencount }" validate="{required:true,max:50,min:1,digits:true,messages:{required:'作文题数不能为空',digits:'请输入正确作文题数'}}" class="input-txt changefen"></td>
						<td  height="30">
							每题分数:
						</td>
						<td><input type="text"  name="zuowenfen" id="txtZuowenFen" value="${zuowenfen}" validate="{required:true,max:50,min:1,digits:true,messages:{required:'分值不能为空',digits:'请输入正确分值'}}"  class="input-txt changefen"></td>
					</tr>
					   
                     <tr>
                       
                          <td colspan="4">
                              
                              
                                  <input type="submit" name="bntOK" id="btnOK" class="orange-button" value="组卷"/>
                            
                          </td>
                       
                    </tr>    
                    
                       
                     
                      
                    
                      
                      
					
				</table>
				
				</form>
		
</body>
</html>
