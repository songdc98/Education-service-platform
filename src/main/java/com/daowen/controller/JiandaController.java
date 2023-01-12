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
 * 简答控制
 *
 */
@Controller
public class JiandaController extends SimpleController {
	@Autowired
	private JiandaService jiandaSrv = null;
	@Autowired
	private KechengService kechengSrv = null;

	@Override
	@RequestMapping("/admin/jiandamanager.do")
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
		jiandaSrv.delete(SQL);
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
		Jianda jianda = new Jianda();
		jianda.setTitle(title == null ? "" : title);
		jianda.setDaan(daan == null ? "" : daan);
		jianda.setKemu(kemu == null ? "" : kemu);
		jianda.setKmid(kmid == null ? 0 : Integer.parseInt(kmid));
		if(difffact!=null)
			jianda.setDifffact(Double.parseDouble(difffact));
		else
			jianda.setDifffact(0.5);
		// 产生验证
		Boolean validateresult = jiandaSrv.isExist("where title='" + title + "'");
		if (validateresult) {
			try {
				request.setAttribute("errormsg",
						"<label class='error'>已经存在的题目</label>");
				request.setAttribute("jianda", jianda);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		jiandaSrv.save(jianda);
		if (forwardurl == null) {
			forwardurl = "/admin/jiandamanager.do?actiontype=get";
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
		Jianda jianda = jiandaSrv.load(new Integer(id));
		if (jianda == null)
			return;
		String title = request.getParameter("title");
		String daan = request.getParameter("daan");
		String kemu = request.getParameter("kemu");
		String kmid = request.getParameter("kmid");
		String difffact=request.getParameter("difffact");
		jianda.setTitle(title);
		jianda.setDaan(daan);
		if(difffact!=null)
			jianda.setDifffact(Double.parseDouble(difffact));
		else
			jianda.setDifffact(0.5);
		jianda.setKemu(kemu);
		jianda.setKmid(kmid == null ? 0 : Integer.parseInt(kmid));

		jiandaSrv.update(jianda);
		if (forwardurl == null) {
			forwardurl = "/admin/jiandamanager.do?actiontype=get";
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
			Jianda jianda = jiandaSrv.load("where id=" + id);
			if (jianda != null) {
				request.setAttribute("jianda", jianda);
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
			forwardurl = "/admin/jiandaadd.jsp";
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
		List<Jianda> listjianda = jiandaSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = jiandaSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listjianda", listjianda);
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
			forwardurl = "/admin/jiandamanager.jsp";
		}
		forward(forwardurl);
	}
}
