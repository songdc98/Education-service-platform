package com.daowen.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daowen.service.KechengService;
import com.daowen.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Yingpian;
import com.daowen.service.YingpianService;

import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.web.bind.annotation.ResponseBody;

/**************************
 * 
 * 视频控制
 *
 */
@Controller
public class YingpianController extends SimpleController {
	@Autowired
	private YingpianService yingpianSrv = null;
	@Autowired
	private KechengService ypcateSrv = null;
	
	@Override
	@RequestMapping("/admin/yingpianmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	public void shenpi() {
		String id = request.getParameter("id");
		String forwardurl = request.getParameter("forwardurl");
		String state = request.getParameter("state");
		String reply = request.getParameter("reply");
		String shenpiren = request.getParameter("shenpiren");
		int stateCode = 3;
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		if (id == null)
			return;
		Yingpian yingpian = yingpianSrv.load(" where id=" + id);
		if (yingpian == null)
			return;
		if (state != null)
			stateCode = Integer.parseInt(state);
		yingpian.setState(stateCode);
		yingpianSrv.update(yingpian);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpianmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	@ResponseBody
	@PostMapping("/admin/yingpian/agree")
	public JsonResult agree() {
		String id = request.getParameter("id");
		if (id == null)
			return JsonResult.error(-1,"请输入id 参数");
		Yingpian yingpian = yingpianSrv.load(new Integer(id));
		if (yingpian == null)
			return JsonResult.error(-2,"参数异常");
		yingpian.setAgreecount(yingpian.getAgreecount() + 1);
		yingpianSrv.update(yingpian);
		return JsonResult.success(1,"成功点赞",yingpian.getAgreecount());

	}
	@ResponseBody
	@PostMapping("/admin/yingpian/against")
	public JsonResult against() {
		String id = request.getParameter("id");
		if (id == null)
			return JsonResult.error(-1,"请输入id 参数");
		Yingpian yingpian = yingpianSrv.load(new Integer(id));
		if (yingpian == null)
			return JsonResult.error(-2,"参数异常");
		yingpian.setAgainstcount(yingpian.getAgainstcount() + 1);
		yingpianSrv.update(yingpian);
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		return JsonResult.success(1,"成功点赞",yingpian.getAgainstcount());

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
		yingpianSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String ypcatename = request.getParameter("ypcatename");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String clickcount = request.getParameter("clickcount");
		String alphabetindex = request.getParameter("alphabetindex");
		String des = request.getParameter("des");
		String xshowtype = request.getParameter("xshowtype");
		String remoteurl = request.getParameter("remoteurl");
		String localurl = request.getParameter("localurl");
		String tupian = request.getParameter("tupian");
		String ypcateid = request.getParameter("ypcateid");
		String subtitle = request.getParameter("subtitle");
		String tags = request.getParameter("tags");
		String state = request.getParameter("state");
		String sftype=request.getParameter("sftype");
		String jifen=request.getParameter("jifen");
		SimpleDateFormat sdfyingpian = new SimpleDateFormat("yyyy-MM-dd");
		Yingpian yingpian = new Yingpian();
		yingpian.setTitle(title == null ? "" : title);
		yingpian.setYpcatename(ypcatename == null ? "" : ypcatename);
		yingpian.setPubren(pubren == null ? "" : pubren);
		yingpian.setPubtime(new Date());
		yingpian.setAgainstcount(0);
		yingpian.setAgreecount(0);
		yingpian.setDlcount(0);
		yingpian.setPlaycount(0);
		if (state != null)
			yingpian.setState(Integer.parseInt(state));
		else
			yingpian.setState(1);
		yingpian.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		yingpian.setDes(des == null ? "" : des);
		yingpian.setXshowtype(xshowtype == null ? 0 : new Integer(xshowtype));
		if (yingpian.getXshowtype() == 1)
			yingpian.setRemoteurl(remoteurl == null ? "" : remoteurl);
		else
			yingpian.setRemoteurl(localurl == null ? "" : localurl);
		yingpian.setTupian(tupian == null ? "" : tupian);
		yingpian.setYpcateid(ypcateid == null ? 0 : new Integer(ypcateid));
		yingpian.setSubtitle(subtitle == null ? "" : subtitle);
		yingpian.setAlphabetindex(alphabetindex == null ? "" : alphabetindex);
		
		yingpian.setTags(tags == null ? "" : tags);
		if(sftype!=null&&sftype.equals("1")) {
			yingpian.setJifen(0);
		}
		if(sftype!=null&&sftype.equals("2")) {
			yingpian.setJifen(Integer.parseInt(jifen));
		}
		yingpianSrv.save(yingpian);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpianmanager.do?actiontype=get";
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
		Yingpian yingpian = yingpianSrv.load(new Integer(id));
		if (yingpian == null)
			return;
		String xshowtype = request.getParameter("xshowtype");
		String remoteurl = request.getParameter("remoteurl");
		String localurl = request.getParameter("localurl");
		String title = request.getParameter("title");
		String ypcatename = request.getParameter("ypcatename");
		String ypcateid = request.getParameter("ypcateid");
		String pubren = request.getParameter("pubren");
		String alphabetindex = request.getParameter("alphabetindex");
		String pubtime = request.getParameter("pubtime");
		String des = request.getParameter("des");
		String tupian = request.getParameter("tupian");
		String subtitle = request.getParameter("subtitle");
		
		String tags = request.getParameter("tags");
		String sftype=request.getParameter("sftype");
		String jifen=request.getParameter("jifen");
		SimpleDateFormat sdfyingpian = new SimpleDateFormat("yyyy-MM-dd");
		yingpian.setTitle(title);
		yingpian.setXshowtype(xshowtype == null ? 0 : new Integer(xshowtype));
		if (yingpian.getXshowtype() == 1)
			yingpian.setRemoteurl(remoteurl == null ? "" : remoteurl);
		else
			yingpian.setRemoteurl(localurl == null ? "" : localurl);
		yingpian.setYpcatename(ypcatename);
		yingpian.setAlphabetindex(alphabetindex == null ? "" : alphabetindex);
		yingpian.setYpcateid(ypcateid == null ? 0 : new Integer(ypcateid));
		yingpian.setSubtitle(subtitle == null ? "" : subtitle);

		yingpian.setDes(des);
		yingpian.setTupian(tupian);
		yingpian.setTags(tags == null ? "" : tags);
		if(sftype!=null&&sftype.equals("1")) {
			yingpian.setJifen(0);
		}
		if(sftype!=null&&sftype.equals("2")) {
			yingpian.setJifen(Integer.parseInt(jifen));
		}
		yingpianSrv.update(yingpian);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpianmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}


	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Yingpian yingpian = yingpianSrv.load("where id=" + id);
			if (yingpian != null) {
				request.setAttribute("yingpian", yingpian);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> ypcateid_datasource = ypcateSrv.getEntity("");
		request.setAttribute("ypcateid_datasource", ypcateid_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/yingpianadd.jsp";
		}
		forward(forwardurl);
	}


	public void get() {
		String filter = "where 1=1 ";
		String pubren = request.getParameter("pubren");
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		//
		if (pubren != null)
			filter += " and pubren='" + pubren + "'";
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
		List<Yingpian> listyingpian = yingpianSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = yingpianSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listyingpian", listyingpian);
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
			forwardurl = "/admin/yingpianmanager.jsp";
		}
		forward(forwardurl);
	}
}
