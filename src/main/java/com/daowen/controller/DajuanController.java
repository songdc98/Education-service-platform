package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daowen.entity.Shijuan;
import com.daowen.util.JsonResult;
import com.daowen.vo.DajuanVo;
import com.daowen.vo.PaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Dajuan;
import com.daowen.service.DajuanService;
import com.daowen.service.DajuanitemService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DajuanController extends SimpleController {

	@Override
	@RequestMapping("/admin/dajuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		
		mappingMethod(request,response);

	}


	@ResponseBody
	@PostMapping("/admin/dajuan/list")
	public JsonResult list(){
		String where=" where 1=1";
		String  testerid=request.getParameter("testerid");
		if(testerid!=null)
			where+=" and testerid="+testerid;
		List<Dajuan> listShiuan=dajuanSrv.getEntity(where);
		return JsonResult.success(1,"获取答卷信息",listShiuan);

	}

	@ResponseBody
	@PostMapping("/admin/dajuan/info")
	public JsonResult info(){
		String id=request.getParameter("id");
		if(id==null||id.equals(""))
			return JsonResult.error(-1,"id编号不存在");
		DajuanVo dajuanVo=dajuanSrv.getInfo(Integer.parseInt(id));
		return JsonResult.success(1,"获取答卷信息",dajuanVo);

	}
    @ResponseBody
	@PostMapping("/admin/dajuan/delete")
	public JsonResult ajaxdelete() {
		String id = request.getParameter("id");
		if(id==null||id=="")
			return JsonResult.error(-1,"");
		dajuanSrv.delete(" where id=" + id);
		//删除答卷记录
		djiSrv.delete("where dajuanid="+id);
		return JsonResult.success(1,"删除成功");


	}

	public void delete() {
		String []ids = request.getParameterValues("ids");
		for(String id :ids) {
			dajuanSrv.delete(" where id=" + id);
			djiSrv.delete("where dajuanid=" + id);
		}

	}


	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
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
		List<Dajuan> listdajuan = dajuanSrv.getPageEntitys(filter,pageindex, pagesize);
		int recordscount = dajuanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listdajuan", listdajuan);
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
			forwardurl = "/admin/dajuanmanager.jsp";
		}
		forward(forwardurl);
	}
	
	@Autowired
	private DajuanService dajuanSrv=null;
	@Autowired
	private DajuanitemService djiSrv=null;

}
