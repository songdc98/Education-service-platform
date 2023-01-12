package com.daowen.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.daowen.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daowen.entity.Playrecord;
import com.daowen.service.IPlayService;
import com.daowen.service.PlayrecordService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;


/**************************
 *  
 * 播放记录控制
 *
 */
@Controller
public class PlayrecordController extends SimpleController {
	@Autowired
	private PlayrecordService playrecordSrv = null;
	@Autowired
    private IPlayService playSrv=null;
	@Override
	@RequestMapping("/admin/playrecordmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}
	
	@ResponseBody
	@RequestMapping("/e/huiyuan/play")
    public JsonResult savePlayrecord(HttpServletRequest request, HttpServletResponse response) {

    	String accountname = request.getParameter("accountname");
		String name = request.getParameter("name");
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		SimpleDateFormat sdfplayrecord = new SimpleDateFormat("yyyy-MM-dd");
		Playrecord playrecord = new Playrecord();
		playrecord.setAccountname(accountname == null ? "" : accountname);
		playrecord.setName(name == null ? "" : name);
		playrecord.setMid(mid == null ? 0 : new Integer(mid));
		playrecord.setMname(mname == null ? "" : mname);
		playrecord.setCreatetime(new Date());
    	//
		Boolean res=playSrv.prePlay(playrecord.getMid(), accountname);
		if(!res) {
			return JsonResult.error(-2,"亲,你没有足够余额");
		}
		
		playrecordSrv.save(playrecord);
		//播放结束
		playSrv.playOver(playrecord.getMid());
		return JsonResult.success(1,"成功更新播放记录");

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
		playrecordSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String accountname = request.getParameter("accountname");
		String name = request.getParameter("name");
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		String createtime = request.getParameter("createtime");
		SimpleDateFormat sdfplayrecord = new SimpleDateFormat("yyyy-MM-dd");
		Playrecord playrecord = new Playrecord();
		playrecord.setAccountname(accountname == null ? "" : accountname);
		playrecord.setName(name == null ? "" : name);
		playrecord.setMid(mid == null ? 0 : new Integer(mid));
		playrecord.setMname(mname == null ? "" : mname);
		if (createtime != null) {
			try {
				playrecord.setCreatetime(sdfplayrecord.parse(createtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			playrecord.setCreatetime(new Date());
		}
		playrecordSrv.save(playrecord);
		if (forwardurl == null) {
			forwardurl = "/admin/playrecordmanager.do?actiontype=get";
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
			Playrecord playrecord = playrecordSrv.load("where id=" + id);
			if (playrecord != null) {
				request.setAttribute("playrecord", playrecord);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/playrecordadd.jsp";
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
		List<Playrecord> listplayrecord = playrecordSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = playrecordSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listplayrecord", listplayrecord);
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
			forwardurl = "/admin/playrecordmanager.jsp";
		}
		forward(forwardurl);
	}
}
