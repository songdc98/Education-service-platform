package com.daowen.controller;

import java.io.IOException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.daowen.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Shoucang;
import com.daowen.service.ShoucangService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ShoucangController extends SimpleController {

	@Autowired
	private ShoucangService scSrv=null;
	@Override
	@RequestMapping("/admin/shoucangmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}

	@ResponseBody
	@PostMapping("/admin/shoucang/delete")
	public JsonResult delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return JsonResult.error(-1,"参数异常");
		String spliter = ",";
		String sql = " where id in(" + join(spliter, ids)+ ")";
		scSrv.delete(sql);
		return JsonResult.success(1,"成功");

	}

	@RequestMapping("/admin/shoucang/ajaxsave")
	@ResponseBody
	public JsonResult ajaxsave(HttpServletRequest request,HttpServletResponse response) {
		// 验证错误url
		String targetid = request.getParameter("targetid");
		String targetname = request.getParameter("targetname");
		String tupian = request.getParameter("tupian");
		String hyid = request.getParameter("hyid");
		String xtype = request.getParameter("xtype");
		String href = request.getParameter("href");
		SimpleDateFormat sdfshoucang = new SimpleDateFormat("yyyy-MM-dd");
		Shoucang shoucang = new Shoucang();
		shoucang.setTargetid(targetid == null ? 0 : new Integer(targetid));
		shoucang.setTargetname(targetname == null ? "" : targetname);
		shoucang.setTupian(tupian == null ? "" : tupian);
		shoucang.setHyid(hyid == null ? 0 : Integer.parseInt(hyid));
		shoucang.setSctime(new Date());
		shoucang.setXtype(xtype);
		shoucang.setHref(href==null?"":href);
		// 产生验证
		Boolean validateresult = scSrv.isExist(MessageFormat.format("where targetid=''{0}'' and hyid=''{1}'' and xtype=''{2}'' ", targetid, hyid,xtype));
		if (validateresult) {
			return JsonResult.error(-2,"你已经收藏了");
		}
		scSrv.save(shoucang);
		return JsonResult.success(1,"成功收藏");

	}


	public void get() {
		String filter = "where 1=1 ";
		String hyid = request.getParameter("hyid");

		//
		if (hyid != null)
			filter += "  and hyid=" + hyid;
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
		List<Shoucang> listshoucang =scSrv.getPageEntitys(filter,pageindex, pagesize);
		int recordscount = scSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listshoucang", listshoucang);
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
			forwardurl = "/admin/shoucangmanager.jsp";
		}
		forward(forwardurl);
	}


}
