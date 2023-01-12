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
 * 填空题控制
 *
 */
@Controller
public class TiankongController extends SimpleController {
	@Autowired
	private TiankongService tiankongSrv = null;
	@Autowired
	private KechengService kechengSrv = null;

	@Override
	@RequestMapping("/admin/tiankongmanager.do")
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
		tiankongSrv.delete(SQL);
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
		SimpleDateFormat sdftiankong = new SimpleDateFormat("yyyy-MM-dd");
		Tiankong tiankong = new Tiankong();
		tiankong.setTitle(title == null ? "" : title);
		tiankong.setDaan(daan == null ? "" : daan);
		tiankong.setKmid(kmid == null ? 0 : Integer.parseInt(kmid));
		tiankong.setKemu(kemu == null ? "" : kemu);
		if(difffact!=null)
			tiankong.setDifffact(Double.parseDouble(difffact));
		else
			tiankong.setDifffact(0.5);
		// 产生验证
		Boolean validateresult = tiankongSrv.isExist("where title='" + title + "'");
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>已经存在的填空题</label>");
				request.setAttribute("tiankong", tiankong);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		tiankongSrv.save(tiankong);
		if (forwardurl == null) {
			forwardurl = "/admin/tiankongmanager.do?actiontype=get";
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
		Tiankong tiankong = tiankongSrv.load(new Integer(id));
		if (tiankong == null)
			return;
		String title = request.getParameter("title");
		String daan = request.getParameter("daan");
		String kemu = request.getParameter("kemu");
		String kmid = request.getParameter("kmid");
		String difffact=request.getParameter("difffact");
		SimpleDateFormat sdftiankong = new SimpleDateFormat("yyyy-MM-dd");
		tiankong.setTitle(title);
		tiankong.setDaan(daan);
		tiankong.setKemu(kemu);
		tiankong.setKmid(kmid == null ? 0 : Integer.parseInt(kmid));
		if(difffact!=null)
			tiankong.setDifffact(Double.parseDouble(difffact));
		else
			tiankong.setDifffact(0.5);
		tiankongSrv.update(tiankong);
		if (forwardurl == null) {
			forwardurl = "/admin/tiankongmanager.do?actiontype=get";
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
			Tiankong tiankong = tiankongSrv.load("where id=" + id);
			if (tiankong != null) {
				request.setAttribute("tiankong", tiankong);
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
			forwardurl = "/admin/tiankongadd.jsp";
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
		List<Tiankong> listtiankong = tiankongSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = tiankongSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listtiankong", listtiankong);
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
			forwardurl = "/admin/tiankongmanager.jsp";
		}
		forward(forwardurl);
	}
}
