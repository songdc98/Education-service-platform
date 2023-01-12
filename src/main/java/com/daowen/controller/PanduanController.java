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
 * 判断题控制
 *
 */
@Controller
public class PanduanController extends SimpleController {
	@Autowired
	private PanduanService panduanSrv = null;
	@Autowired
	private KechengService kechengSrv = null;

	@Override
	@RequestMapping("/admin/panduanmanager.do")
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
		panduanSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String daan = request.getParameter("daan");
		String kemu = request.getParameter("kemu");
		String kmid = request.getParameter("kmid");
		String difffact=request.getParameter("difffact");
		SimpleDateFormat sdfpanduan = new SimpleDateFormat("yyyy-MM-dd");
		Panduan panduan = new Panduan();
		panduan.setTitle(title == null ? "" : title);
		panduan.setDaan(daan == null ? "" : daan);
		if(difffact!=null)
			panduan.setDifffact(Double.parseDouble(difffact));
		else
			panduan.setDifffact(0.5);
		panduan.setKemu(kemu == null ? "" : kemu);
		panduan.setKmid(kmid == null ? 0 : Integer.parseInt(kmid));
		panduanSrv.save(panduan);
		if (forwardurl == null) {
			forwardurl = "/admin/panduanmanager.do?actiontype=get";
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
		Panduan panduan = panduanSrv.load(new Integer(id));
		if (panduan == null)
			return;
		String title = request.getParameter("title");
		String daan = request.getParameter("daan");
		String kemu = request.getParameter("kemu");
		String kmid = request.getParameter("kmid");
		String difffact=request.getParameter("difffact");
		SimpleDateFormat sdfpanduan = new SimpleDateFormat("yyyy-MM-dd");
		panduan.setTitle(title);
		panduan.setDaan(daan);
		if(difffact!=null)
			panduan.setDifffact(Double.parseDouble(difffact));
		else
			panduan.setDifffact(0.5);
		panduan.setKemu(kemu);
		panduan.setKmid(kmid == null ? 0 : Integer.parseInt(kmid));
		panduanSrv.update(panduan);
		if (forwardurl == null) {
			forwardurl = "/admin/panduanmanager.do?actiontype=get";
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
			Panduan panduan = panduanSrv.load("where id=" + id);
			if (panduan != null) {
				request.setAttribute("panduan", panduan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> kemu_datasource = kechengSrv.getEntity("");
		request.setAttribute("kemu_datasource", kemu_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/panduanadd.jsp";
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
		List<Panduan> listpanduan = panduanSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = panduanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listpanduan", listpanduan);
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
			forwardurl = "/admin/panduanmanager.jsp";
		}
		forward(forwardurl);
	}
}
