package com.daowen.controller;

import java.text.MessageFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.daowen.util.JsonResult;
import com.daowen.util.MailUtil;
import com.daowen.util.MimeMessageDescription;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Huiyuan;
import com.daowen.service.HuiyuanService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HuiyuanController extends SimpleController {

	@Autowired
	private HuiyuanService huiyuanSrv=null;
	
	@RequestMapping("/admin/huiyuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		this.mappingMethod(request, response);
	}

	@ResponseBody
	@PostMapping("/admin/huiyuan/forgetpw")
	public JsonResult  forgetpw(){
		String accountname=request.getParameter("accountname");
		Huiyuan h=huiyuanSrv.load("where accountname='"+accountname+"'");
		if(h==null)
			return JsonResult.error(-1,"不存在的账号");
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("url","/forgetpwnext.jsp?id="+h.getId());
		return JsonResult.success(1,"",jsonObject);
	}

	@ResponseBody
	@PostMapping("/admin/huiyuan/sendpwemail")
	public JsonResult  sendpwemail(){
		String id=request.getParameter("id");
		Huiyuan h=huiyuanSrv.load("where id="+id);
		if(h==null)
			return JsonResult.error(-1,"不存在的账号");
		MimeMessageDescription mmd=new MimeMessageDescription();
		mmd.setReceAccount(h.getEmail());
		mmd.setReceAccountRemark(h.getName());
		mmd.setSubject("忘记密码-密码重置邮件");
		mmd.setContent(MessageFormat.format("亲忘记密码<a href=\"http://localhost:8080{0}/e/resetpw.jsp?id={1,number,#}\">重置密码</a>",request.getContextPath(),h.getId()));
		boolean res=MailUtil.send(mmd);
		if(res)
		  return JsonResult.success(1,"");
		else
			return JsonResult.error(-2,"发送失败,请检查邮箱是否正常");
	}

	public void resetpw() {
		String repassword1 = request.getParameter("repassword1");
		String repassword2 = request.getParameter("repassword2");
		String forwardurl = request.getParameter("forwardurl");
		String errorurl = request.getParameter("errorurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Huiyuan huiyuan = huiyuanSrv.load(new Integer(id));
		if (huiyuan == null) {
			request.setAttribute("errormsg", "<label class='error'>账户不成立</label>");
			forward(errorurl);
			return;
		}
		huiyuan.setPassword(repassword1);
		huiyuanSrv.update(huiyuan);
		request.getSession().setAttribute("huiyuan", huiyuan);
		forward(forwardurl);


	}

	@RequestMapping("/admin/ajaxlogin")
	@ResponseBody
	public JsonResult ajaxLogin(HttpServletRequest request, HttpServletResponse response) {
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		if (accountname != null)
			accountname = accountname.trim();
		if (password != null)
			password = password.trim();
		String filter = MessageFormat.format("where accountname=''{0}'' and password=''{1}''", accountname, password);
		Huiyuan huiyuan = (Huiyuan) huiyuanSrv.load(filter);
		if (huiyuan == null) {
			return JsonResult.error(-1, "账户不存在");
		}
		if (password != null && !password.equals(huiyuan.getPassword()))
			return JsonResult.error(-2, "用户密码不正确");
		request.getSession().setAttribute("huiyuan", huiyuan);
		return JsonResult.success(1, "用户登录成功");

	}
   
	public void modifyPaypw() {

		String paypwd=request.getParameter("paypwd");
		String errorurl=request.getParameter("errorurl");
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");
		String id = request.getParameter("id");
		if (id == null||id=="")
			return;
		Huiyuan huiyuan =huiyuanSrv.load(new Integer(id));
		if(huiyuan!=null)
		{
			if(!huiyuan.getPaypwd().equals(paypwd)){
				request.setAttribute("errormsg",
						"<label class='error'>原始支付密码不正确</label>");
				
				forward(errorurl);
				return ;
			}
			huiyuan.setPaypwd(repassword1);
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			redirect(forwardurl);
		}
		

	}

	
	public void chongzhi() {
		String jine = request.getParameter("jine");
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Huiyuan huiyuan = huiyuanSrv.load(new Integer(id));
		if (huiyuan != null) {
			huiyuan.setYue(huiyuan.getYue() + Float.parseFloat(jine));
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			redirect(forwardurl);
		}

	}

	@ResponseBody
	@RequestMapping("/admin/huiyuan/exit")
	public JsonResult exit() {

		if (request.getSession().getAttribute("huiyuan") != null) {

			System.out.println("系统退出");
			request.getSession().removeAttribute("huiyuan");

		}

		return JsonResult.success(1,"成功退出");


	}

	private void login() {

		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");

		String filter = MessageFormat.format("where accountname=''{0}'' and password=''{1}''", accountname,
				password);
		Huiyuan huiyuan = (Huiyuan) huiyuanSrv.load(filter);
		String errorurl = request.getParameter("errorurl");
		String forwardurl = request.getParameter("forwardurl");
		if (huiyuan == null) {
			dispatchParams(request, response);
			request.setAttribute("errormsg", "<label class='error'>系统账户和密码不匹配</label>");
			forward(errorurl);
			return;
		}

		if (huiyuan.getPassword().equals(password)) {
			huiyuan.setLogtimes(huiyuan.getLogtimes() + 1);
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			if (forwardurl == null || "".equals(forwardurl))
				forwardurl = "/e/huiyuan/accountinfo.jsp";
			redirect(forwardurl);
		}

	}



	public void save() {
		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
        String idcardno=request.getParameter("idcardno");
		String email = request.getParameter("email");
		String  mobile=request.getParameter("mobile");
		String  address=request.getParameter("address");
		String  touxiang=request.getParameter("touxiang");
		String  sex=request.getParameter("sex");
        String  des=request.getParameter("des");
		if (huiyuanSrv.isExist("where accountname='" + accountname
				+ "'")) {
				request.setAttribute("errormsg",
						"<label class='error'>用户名已经存在</label>");
				dispatchParams(request, response);

				forward("/e/register.jsp");
				return;
		}

		Huiyuan huiyuan = new Huiyuan();
		huiyuan.setAccountname(accountname == null ? "" : accountname);
		huiyuan.setPassword(password == null ? "" : password);
		huiyuan.setPaypwd(huiyuan.getPassword());
		if(mobile!=null)
		   huiyuan.setMobile(mobile);
		else
			huiyuan.setMobile(accountname);
		if(address!=null)
		   huiyuan.setAddress(address);
		if(sex!=null)
			huiyuan.setSex(sex);
		else
			huiyuan.setSex("男");
		huiyuan.setNickname(accountname);
        huiyuan.setName(name);
		huiyuan.setRegdate(new Date());
        huiyuan.setIdcardno(idcardno==null?"":idcardno);
		huiyuan.setLogtimes(0);
		if(touxiang!=null)
			huiyuan.setTouxiang(touxiang);
		else
		    huiyuan.setTouxiang("/upload/nopic.jpg");
		huiyuan.setEmail(email == null ? "" : email);
		huiyuan.setStatus(1);
		huiyuan.setYue(0);
		huiyuan.setDes(des==null?"":des);
		huiyuanSrv.save(huiyuan);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/huiyuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String where = " where id in(" + join(",", ids) + ")";
		huiyuanSrv.delete(where);
	}
	
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Huiyuan huiyuan = huiyuanSrv.load(new Integer(id));
		if (huiyuan == null)
			return;
		String accountname = request.getParameter("accountname");
		String nickname = request.getParameter("nickname");
		String forwardurl = request.getParameter("forwardurl");
		String touxiang = request.getParameter("touxiang");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
	    String idcardno=request.getParameter("idcardno");
	    if(accountname!=null)
		   huiyuan.setAccountname(accountname);
		huiyuan.setNickname(nickname==null?"":nickname);
		huiyuan.setTouxiang(touxiang==null?"":touxiang);
		huiyuan.setEmail(email==null?"":email);
		huiyuan.setMobile(mobile==null?"":mobile);
		huiyuan.setIdcardno(idcardno==null?"":idcardno);
		huiyuan.setSex(sex==null?"":sex);
		huiyuan.setAddress(address==null?"":address);
		huiyuan.setName(name==null?"":name);
		huiyuanSrv.update(huiyuan);
		request.getSession().setAttribute("huiyuan", huiyuan);
		if (forwardurl == null) {
			forwardurl = "/admin/huiyuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}
	
	public void modifyPw() {

		String password=request.getParameter("password");
		String errorurl=request.getParameter("errorurl");
		String  forwardurl=request.getParameter("forwardurl");
		String repassword1=request.getParameter("repassword1");
		String id = request.getParameter("id");
		if (id == null||id=="")
			return;
		Huiyuan huiyuan =huiyuanSrv.load(new Integer(id));
		if(huiyuan!=null){
			if(!huiyuan.getPassword().equals(password)){
				request.setAttribute("errormsg",
						"<label class='error'>原始密码不正确</label>");
				dispatchParams(request, response);
				forward(errorurl);
				return ;
			}
			huiyuan.setPassword(repassword1);
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			redirect(forwardurl);
		}

	}
	
	
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null){
			Huiyuan huiyuan = huiyuanSrv.load("where id="+ id);
			if (huiyuan != null) {
				request.setAttribute("huiyuan", huiyuan);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		forward(forwardurl);
		
	}
	public void  get(){
		String filter = "";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String accountname = request.getParameter("accountname");
		if (accountname != null)
			filter = "  where accountname like '%" + accountname + "%'  ";
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Huiyuan> listhuiyuan = huiyuanSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = huiyuanSrv.getRecordCount(filter);
		request.setAttribute("listhuiyuan", listhuiyuan);
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
			forwardurl = "/admin/huiyuanmanager.jsp";
		}
		forward(forwardurl);
	}
	
	

}
