package com.daowen.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Downrecord;
import com.daowen.service.DownrecordService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 下载记录控制
 *
 */
@Controller
public class DownrecordController extends SimpleController {
	@Autowired
	private DownrecordService downrecordSrv = null;

	@Override
	@RequestMapping("/admin/downrecordmanager.do")
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
		downrecordSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String gno = request.getParameter("gno");
		String gname = request.getParameter("gname");
		String zytitle = request.getParameter("zytitle");
		String zyid = request.getParameter("zyid");
		String createtime = request.getParameter("createtime");
		SimpleDateFormat sdfdownrecord = new SimpleDateFormat("yyyy-MM-dd");
		Downrecord downrecord = new Downrecord();
		downrecord.setGno(gno == null ? "" : gno);
		downrecord.setGname(gname == null ? "" : gname);
		downrecord.setZytitle(zytitle == null ? "" : zytitle);
		downrecord.setZyid(zyid == null ? 0 : new Integer(zyid));
		if (createtime != null) {
			try {
				downrecord.setCreatetime(sdfdownrecord.parse(createtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			downrecord.setCreatetime(new Date());
		}
		downrecordSrv.save(downrecord);
		if (forwardurl == null) {
			forwardurl = "/admin/downrecordmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Downrecord downrecord = downrecordSrv.load(new Integer(id));
		if (downrecord == null)
			return;
		String gno = request.getParameter("gno");
		String gname = request.getParameter("gname");
		String zytitle = request.getParameter("zytitle");
		String zyid = request.getParameter("zyid");
		String createtime = request.getParameter("createtime");
		SimpleDateFormat sdfdownrecord = new SimpleDateFormat("yyyy-MM-dd");
		downrecord.setGno(gno);
		downrecord.setGname(gname);
		downrecord.setZytitle(zytitle);
		downrecord.setZyid(zyid == null ? 0 : new Integer(zyid));
		if (createtime != null) {
			try {
				downrecord.setCreatetime(sdfdownrecord.parse(createtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		downrecordSrv.update(downrecord);
		if (forwardurl == null) {
			forwardurl = "/admin/downrecordmanager.do?actiontype=get";
		}
		redirect(forwardurl);
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
			Downrecord downrecord = downrecordSrv.load("where id=" + id);
			if (downrecord != null) {
				request.setAttribute("downrecord", downrecord);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/downrecordadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String gno = request.getParameter("gno");
		if (gno != null)
			filter += "  and gno like '%" + gno + "%'  ";
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
		List<Downrecord> listdownrecord = downrecordSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = downrecordSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listdownrecord", listdownrecord);
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
			forwardurl = "/admin/downrecordmanager.jsp";
		}
		forward(forwardurl);
	}
}
