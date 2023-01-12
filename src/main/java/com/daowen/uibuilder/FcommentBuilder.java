package com.daowen.uibuilder;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.daowen.jdbc.simplecrud.DataRow;
import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.util.BeansUtil;

public class FcommentBuilder {

	private HttpServletRequest request=null;
	private SimpleJdbc jdbc=null;
	public FcommentBuilder(HttpServletRequest request){
		this.request=request;
		this.jdbc=BeansUtil.getSimpleJdbcBean();
	}
	public String build(String type, String belongid) {

		StringBuffer sb = new StringBuffer();
		sb.append("<h4>评论信息</h4>");
		sb.append("<ul>");
		String sql=MessageFormat.format(" select c.*,hy.accountname,hy.name,hy.touxiang from fcomment c,huiyuan hy where c.commentor=hy.accountname and c.tablename=''{0}'' and belongid=''{1}''  ",
				type, belongid);
		DataTable dt=null;
		try {
			dt = jdbc.query(sql,null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(dt!=null)
			for (DataRow dr : dt.getRows()) {
	            //构建一条评论信息
				sb.append(buildItem(dr,type));
	
			}
		sb.append("</ul>");
		return sb.toString();
	}
	
	private String buildItem(DataRow dr,String xtype){
		StringBuilder sb=new StringBuilder();
		sb.append("<li>");
		sb.append("<div class='comment-item'>");
		sb.append("<div class=\"comment-user\">");
		sb.append("<div class='pic fn-left'>");
		sb.append(MessageFormat.format(
				"<img width=\"48\" height=\"48\" src=\"{2}{1}\" />{0}",
				dr.getString("name"),dr.getString("touxiang"),request.getContextPath()));

		sb.append("</div>");
		sb.append("<div style='width:80px;' class=\"fn-left\">");
		String times = "";
		Date commentTime = dr.getDate("commenttime");
        times=toDatetimeTip(commentTime);
		sb.append(MessageFormat.format("<div>{0}</div>", times));
		sb.append(MessageFormat.format("<div>{0}</div>",
				dr.getString("commentor")));
		sb.append("</div>");
		// comment-user
		sb.append("</div>");
        sb.append(buildItemContent(dr,xtype));
		// comment-item
		sb.append("</div>");
		sb.append("</li>");
		return sb.toString();
	}
	private String buildItemContent(DataRow dr,String xtype){
		StringBuilder sb=new StringBuilder();
		int id=dr.getInt("id");
		// 评论开始
		sb.append("<div class='item-content'>");
		
		sb.append(MessageFormat.format("<div>总体得分:{0}分</div>",dr.getDouble("totalscore")));
		sb.append(dr.getString("dcontent"));
		
		// 评论内容结束
		sb.append("</div>");
		return sb.toString();
	}
	
    private  String toDatetimeTip(Date timestamp){
		
		String times="";
		long lpubtime=timestamp.getTime();
        long day=(long)(new Date().getTime()- lpubtime)/(60 * 60 * 1000*24);
        long hour=(long)(new Date().getTime()-lpubtime)/(60 * 60 * 1000);
        long minuter=(long)(new Date().getTime()- lpubtime)/(60 * 1000);
        long seconds=(new Date().getTime()- lpubtime)/1000;
        if(day>0)
       	 times=day+"天前";
        else
        if(hour>0)
       	 times=hour+"小时前";
        else
       	 if(minuter>0)
       	   times=minuter+"分钟前";
       	 else
       		 times=seconds+"秒前";
        
        return times;
	}

}
