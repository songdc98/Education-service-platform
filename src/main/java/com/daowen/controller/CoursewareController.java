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

import com.daowen.entity.Courseware;
import com.daowen.service.CoursewareService;
import com.daowen.service.KechengService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 学习资料控制
 *
 */
@Controller
public class CoursewareController extends SimpleController {
	@Autowired
	private CoursewareService coursewareSrv = null;
	@Autowired
	private KechengService kechengSrv = null;

	@Override
	@RequestMapping("/admin/coursewaremanager.do")
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
		coursewareSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String tupian = request.getParameter("tupian");
		String typeid = request.getParameter("typeid");
		String typename = request.getParameter("typename");
		String clickout = request.getParameter("clickout");
		String dwcount = request.getParameter("dwcount");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String fileurl = request.getParameter("fileurl");
		String des = request.getParameter("des");
		SimpleDateFormat sdfcourseware = new SimpleDateFormat("yyyy-MM-dd");
		Courseware courseware = new Courseware();
		courseware.setTitle(title == null ? "" : title);
		courseware.setTupian(tupian == null ? "" : tupian);
		courseware.setTypeid(typeid == null ? 0 : new Integer(typeid));
		courseware.setTypename(typename == null ? "" : typename);
		courseware.setClickout(clickout == null ? 0 : new Integer(clickout));
		courseware.setDwcount(dwcount == null ? 0 : new Integer(dwcount));
		courseware.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				courseware.setPubtime(sdfcourseware.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			courseware.setPubtime(new Date());
		}
		courseware.setFileurl(fileurl == null ? "" : fileurl);
		courseware.setDes(des == null ? "" : des);
		coursewareSrv.save(courseware);
		if (forwardurl == null) {
			forwardurl = "/admin/coursewaremanager.do?actiontype=get";
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
		Courseware courseware = coursewareSrv.load(new Integer(id));
		if (courseware == null)
			return;
		String title = request.getParameter("title");
		String tupian = request.getParameter("tupian");
		String typeid = request.getParameter("typeid");
		String typename = request.getParameter("typename");
		String clickout = request.getParameter("clickout");
		String dwcount = request.getParameter("dwcount");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String fileurl = request.getParameter("fileurl");
		String des = request.getParameter("des");
		SimpleDateFormat sdfcourseware = new SimpleDateFormat("yyyy-MM-dd");
		courseware.setTitle(title);
		courseware.setTupian(tupian);
		courseware.setTypeid(typeid == null ? 0 : new Integer(typeid));
		courseware.setTypename(typename);
		courseware.setClickout(clickout == null ? 0 : new Integer(clickout));
		courseware.setDwcount(dwcount == null ? 0 : new Integer(dwcount));
		courseware.setPubren(pubren);
		if (pubtime != null) {
			try {
				courseware.setPubtime(sdfcourseware.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		courseware.setFileurl(fileurl);
		courseware.setDes(des);
		coursewareSrv.update(courseware);
		if (forwardurl == null) {
			forwardurl = "/admin/coursewaremanager.do?actiontype=get";
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
			Courseware courseware = coursewareSrv.load("where id=" + id);
			if (courseware != null) {
				request.setAttribute("courseware", courseware);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> typeid_datasource = kechengSrv.getEntity("");
		request.setAttribute("typeid_datasource", typeid_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/coursewareadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String pubren=request.getParameter("pubren");
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
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
		List<Courseware> listcourseware = coursewareSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = coursewareSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listcourseware", listcourseware);
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
			forwardurl = "/admin/coursewaremanager.jsp";
		}
		forward(forwardurl);
	}
}
