<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %> 
 <%   
   
      String gcommentbelongid=request.getParameter("id");
      
      String commenttype=request.getParameter("commenttype");
 
 
  %>
  
   


   <div class="comment-box">
			<div class="comment-list">
				
				<%=new FcommentBuilder(request).build(commenttype,gcommentbelongid) %>
				 
			</div> 
 
			
			


	</div>
    