<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>后台用户信息</title>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
	 <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	 <link href="${pageContext.request.contextPath}/webui/bstable/bootstrap-table.css" rel="stylesheet" type="text/css"/>
	 <link href="${pageContext.request.contextPath}/admin/css/table1.css" rel="stylesheet" type="text/css"/>
	 <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css"/>
	 <script src="${pageContext.request.contextPath}/webui/echarts/echarts-all.js"></script>

 </head>
<body >
	<div class="search-title">
		<h2>舆情统计</h2>

	</div>


	<div class="charts l_left">
		<p class="charts_p">网站舆情</p>
		<div id="container7" style="height:250px;width: 100%"></div>
		<div style="width: 100%;margin-top: 0px">
			<table class="annyTable" border="1">
				<tr>
					<td class="first_td">舆情栏目</td>
					<td>点击量</td>

				</tr>

				<c:forEach items="${requestScope.listXinxi}"  var="map">
					<tr>
						<td class="first_td">${map["lanmuming"]}</td>
						<td>${map["totalcount"]}</td>
					</tr>
				</c:forEach>

			</table>
		</div>

	</div>


	<div class="charts l_left last_charts">
		<p class="charts_p">信息分布图<span class="r_right">更多></span></p>
		<div id="container5" style="height:250px;width: 100%;"></div>
<%--		<table class="annyTable" border="1">--%>
<%--			<tr>--%>
<%--				<td class="first_td">栏目</td>--%>
<%--				<td>数量</td>--%>

<%--			</tr>--%>
<%--			<tr>--%>
<%--				<td class="first_td">点击量</td>--%>
<%--				<td>1502</td>--%>

<%--			</tr>--%>


<%--		</table>--%>

	</div>

</body>
</html>
<script type="text/javascript">

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/xinxi/clickcount",
		method:"POST",
		dataType:"json",
		success(res){
			var xdata=[];
			var ydata=[];
			console.log(res.data);
			xdata=res.data.map(c=>c.lanmuming);
			ydata=res.data.map(c=>c.totalcount);
			var myChart = echarts.init($("#container7")[0]);
			var option = {
				tooltip : {
					trigger: 'axis',
					axisPointer : {            // 坐标轴指示器，坐标轴触发有效
						type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend: {
					data:[]
				},
				calculable : true,
				xAxis : [
					{
						type : 'category',
						data:xdata,
						rotate:40,interval:0
					}
				],
				yAxis : [
					{
						type : 'value'
					}
				],
				series : [
					{
						name:'网站舆情点击量',
						type:'bar',
						barWidth:'30',
						data:ydata,
						itemStyle: {
							normal: {
								color:"#269fec"
							}
						}

					}
				]
			};
			myChart.setOption(option);
		}
	});

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/xinxi/count",
		method:"POST",
		dataType:"json",
		success(res){
			console.log(res.data);
			let pieData=[];
			let legendData=res.data.map(c=>c.lanmuming);
			res.data.forEach(c=>{
				pieData.push({name:c.lanmuming,value:c.count});
			});
			let myChart = echarts.init($("#container5")[0]);
			option = {
				tooltip : {
					trigger: 'item',
					formatter: "{a} {b} : {c} ({d}%)"
				},
				legend: {
					orient : 'vertical',
					x : 'left',
					data:legendData
				},
				calculable : false,
				series : [
					{
						name:'点击量',
						type:'pie',
						radius : '55%',
						center: ['50%', '60%'],
						data:pieData
					}
				]
			};
			myChart.setOption(option);
		}
	});


</script>
