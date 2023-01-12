package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 美食评价控制
 *
 */
@Controller
public class FcommentController extends SimpleController {
	@Autowired
	private FcommentService fcommentSrv = null;

	@Override
	@RequestMapping("/admin/fcommentmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		fcommentSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String tsstar = request.getParameter("tsstar");
		String commentor = request.getParameter("commentor");
		String tablename = request.getParameter("tablename");
		String belongid = request.getParameter("belongid");
	
		String dcontent = request.getParameter("dcontent");
		Fcomment fcomment = new Fcomment();
		fcomment.setTotalscore(getScore(Integer.parseInt(tsstar)));
		fcomment.setCommentor(commentor == null ? "" : commentor);
		fcomment.setCommenttime(new Date());
		fcomment.setTablename(tablename == null ? "" : tablename);
		fcomment.setBelongid(belongid == null ? "" : belongid);
		
		fcomment.setDcontent(dcontent == null ? "" : dcontent);
		fcommentSrv.save(fcomment);
		if (forwardurl == null) {
			forwardurl = "/admin/fcommentmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	
	private double getScore(int starCount){
		return starCount*10.0/5;
	}


	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Fcomment fcomment = fcommentSrv.load("where id=" + id);
			if (fcomment != null) {
				request.setAttribute("fcomment", fcomment);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/fcommentadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Fcomment> listfcomment = fcommentSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = fcommentSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listfcomment", listfcomment);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/fcommentmanager.jsp";
		}
		forward(forwardurl);
	}
}
