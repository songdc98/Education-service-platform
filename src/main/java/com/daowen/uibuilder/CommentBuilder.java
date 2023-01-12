package com.daowen.uibuilder;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.daowen.entity.Huiyuan;
import com.daowen.jdbc.simplecrud.DataRow;
import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.util.BeansUtil;

public class CommentBuilder {

	private HttpServletRequest request=null;
	SimpleJdbc jdbc=null;
	public CommentBuilder(HttpServletRequest request){
		this.request=request;
		jdbc=BeansUtil.getSimpleJdbcBean();
	}
	public String build(String type, String belongid) {

		StringBuffer sb = new StringBuffer();
		sb.append("<h4>评论信息</h4>");
		sb.append("<ul>");
		String sql=MessageFormat.format(" select c.*,hy.accountname,hy.touxiang from comment c,huiyuan hy where c.commentren=hy.accountname and c.xtype=''{0}'' and belongid=''{1}'' and istopic=1 and topicid=0 ",
				type, belongid);
		DataTable dt=null;
		try {
			dt = jdbc.query(sql,null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(dt==null)
			return "";
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
				"<a href=\"{0}/e/spaceindex.jsp?accountname={1}\"><img width=\"48\" height=\"48\" src=\"{0}{2}\" /></a>",
				request.getContextPath(),dr.getString("accountname"),dr.getString("photo")));

		sb.append("</div>");
		sb.append("<div style='width:80px;' class=\"fn-left\">");
		String times = "";
		Date commentTime = dr.getDate("commenttime");
		int hour = (int) (new Date().getTime() - commentTime.getTime())
				/ (60 * 60 * 1000);
		long minuter = (int) (new Date().getTime() - commentTime.getTime())
				/ (60 * 1000);
		long seconds = (new Date().getTime() - commentTime.getTime()) / 1000;
		if (hour > 0)
			times = hour + "小时前";
		else if (minuter > 0)
			times = minuter + "分钟前";
		else
			times = seconds + "秒前";

		sb.append(MessageFormat.format("<div>{0}</div>", times));
		sb.append(MessageFormat.format("<div>{0}</div>",
				dr.getString("commentren")));
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
		sb.append(dr.getString("commentcontent"));
		//构建回复列表
		sb.append(buildReplyPanel(dr,xtype));

		// 评论内容结束
		sb.append("</div>");
		return sb.toString();
	}
	/*
	 * 构建回复列表
	 *
	 */
	private String buildReplyList(int id,String type){
		StringBuilder sb = new StringBuilder();
		String sql=MessageFormat.format(" select c.*,hy.accountname,hy.touxiang from comment c,huiyuan hy where c.commentren=hy.accountname and c.xtype=''{0}'' and istopic=0 and topicid={1}",
				type, id);
		System.out.println("sql="+sql);
		DataTable dt=null;
		try {
			dt = jdbc.query(sql,null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("获取到回复记录"+dt.getRows().size());
		// 回复列表 reply-list开始
		if(dt.getRows().size()>0)
			sb.append("<div class=\"reply-box-list\">");
		for(DataRow dr : dt.getRows()){
			//构建内容
			sb.append(dr.getString("accountname")+"说:"+dr.getString("commentcontent"));
			//构建回复面板
			sb.append(buildReplyPanel(dr,type));
		}
		// 回复列表 reply-list结束
		if(dt.getRows().size()>0)
			sb.append("</div>");
		return sb.toString();
	}
	/*
	 * 构建回复面板
	 */
	private String buildReplyPanel(DataRow dr, String xtype) {
		StringBuilder sb = new StringBuilder();
		int id=dr.getInt("id");
		// 回复按钮面板开始
		sb.append("<div class=\"action-row\">");
		//sb.append("<span class=\"small-btn\"><i class=\"fa fa-thumbs-up\"></i>赞<span class=\"agree-count\">10</span></span>");
		// 操作面板
		sb.append(MessageFormat.format("<span class=\"small-btn\"><i class=\"fa fa-comment reply-btn\" data-comment-id=\"{0}\">回复</i></span>",
				id));
		// end action-row
		sb.append("</div>");
		// begin reply-form-box
		sb.append(MessageFormat.format(
				"<div data-comment-id=\"{0}\" class=\"reply-form-box\">", id));
		sb.append(MessageFormat.format(
				"<form action=\"{0}/admin/commentmanager.do\" method=\"post\">",
				request.getContextPath()));
		sb.append("<input type=\"hidden\" name=\"actiontype\" value=\"save\"/>");
		sb.append(MessageFormat.format(
				"<input type=\"hidden\"   name=\"belongid\"  value=\"{0}\"/>",
				0));
		sb.append(MessageFormat.format(
				"<input type=\"hidden\"   name=\"xtype\"  value=\"{0}\"/>",
				xtype));
		sb.append("<input type=\"hidden\"   name=\"istopic\"  value=\"0\"/>");
		sb.append(MessageFormat.format("<input type=\"hidden\"   name=\"topicid\"  value=\"{0}\"/>",dr.getInt("id")));
		Huiyuan hy=(Huiyuan)request.getSession().getAttribute("huiyuan");
		if(hy!=null)
			sb.append(MessageFormat.format("<input type=\"hidden\"  name=\"currenthy\" value=\"{0}\"/>",hy.getAccountname()));
		else
			sb.append("<input type=\"hidden\"  name=\"currenthy\" value=\"\"/>");
		sb.append(MessageFormat.format(
				"<input type=\"hidden\"  name=\"forwardurl\" value=\"\"/>", ""));
		// 是回复
		sb.append("<input type=\"hidden\"  name=\"isreply\" value=\"1\"/>");
		sb.append("<textarea name=\"commentcontent\" class=\"textarea\"></textarea>");
		sb.append("<button class=\"submit-comment btn\" type='submit'>回复</button>");
		// end form
		sb.append("</form>");
		// end reply-form-box
		sb.append("</div>");
		//构建回复列表
		sb.append(buildReplyList(id,xtype));

		return sb.toString();
	}

}
