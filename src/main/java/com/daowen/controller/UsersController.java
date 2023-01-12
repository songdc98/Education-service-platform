package com.daowen.controller;

import com.daowen.entity.Users;
import com.daowen.service.SysroleService;
import com.daowen.service.UsersService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
@Qualifier("value=usersController")
public class UsersController extends SimpleController {

	@Autowired
	private UsersService usersService;
	@Autowired
	private SysroleService sysroleSrv;

	@RequestMapping("/admin/usersmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		this.mappingMethod(request, response);
	}

	public void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Users users = usersService.load(new Integer(id));
		if (users != null) {
			if (!users.getPassword().equals(password1)) {
				request.setAttribute("errormsg", "<label class='error'>原始密码不正确，不能修改</label>");
				forward(forwardurl);

			} else {
				users.setPassword(repassword1);
				usersService.update(users);
				request.getSession().setAttribute("users", users);
				redirect(forwardurl);
			}
		}
	}

	public void save() {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String creator = request.getParameter("creator");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String rolename = request.getParameter("rolename");
		String roleid = request.getParameter("roleid");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		Users users = new Users();
		users.setUsername(username == null ? "" : username);
		users.setPassword(password == null ? "" : password);
		users.setCreator(creator == null ? "" : creator);
		users.setCreatetime(new Date());
		users.setEmail(email == null ? "" : email);
		users.setTel(tel == null ? "" : tel);
		users.setLogtimes(0);
		users.setRolename(rolename == null ? "部门管理员" : rolename);
		users.setRoleid(roleid == null ? 0 : Integer.parseInt(roleid));
		users.setRealname(realname == null ? "" : realname);
		users.setNickname(nickname == null ? "" : nickname);
		users.setSex(sex == null ? "" : sex);
		users.setXiangpian(xiangpian == null ? "" : xiangpian);
		usersService.save(users);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/usersmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	public void updatewage() {
		String id = request.getParameter("id");
		String basicwage = request.getParameter("basicwage");
		String forwardurl = request.getParameter("forwardurl");
		String jixiao = request.getParameter("jixiao");
		if (id == null)
			return;
		Users users = (Users) usersService.load(new Integer(id));
		if (users == null)
			return;
		users.setBasicwage(basicwage == null ? 0 : new Integer(basicwage));
		users.setJixiao(jixiao == null ? (double) 0 : new Double(jixiao));
		usersService.update(users);
		if (forwardurl == null) {
			forwardurl = "/admin/usersmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Users users = (Users) usersService.load(new Integer(id));
		if (users == null)
			return;
		String username = request.getParameter("username");
		String creator = request.getParameter("creator");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String realname = request.getParameter("realname");
		String roleid = request.getParameter("roleid");
		String rolename = request.getParameter("rolename");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfusers = new SimpleDateFormat("yyyy-MM-dd");
		users.setUsername(username);
		users.setEmail(email);
		users.setTel(tel);
		users.setRealname(realname);
		users.setRoleid(roleid == null ? 1 : Integer.parseInt(roleid));
		users.setRolename(rolename == null ? "" : rolename);
		users.setNickname(nickname);
		users.setSex(sex);
		users.setXiangpian(xiangpian);
		usersService.update(users);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/usersmanager.do?actiontype=get";
		}
		redirect(forwardurl);

	}

	public void load() {
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Users users = (Users) usersService.load(new Integer(id));
			if (users != null) {
				request.setAttribute("users", users);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		List<Object> roleid_datasource = sysroleSrv.getEntity("");
		request.setAttribute("roleid_datasource", roleid_datasource);
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/usersadd.jsp";
		}
		forward(forwardurl);
	}

	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids)
				+ ")";
		System.out.println("sql=" + SQL);
		usersService.delete(SQL);
	}

	public void get() {
		int pageindex = 1;
		int pagesize = 10;
		String filter = "where 1=1 ";
		String username=request.getParameter("username");
		if(username!=null)
			filter+=" and username like '%"+username+"%' ";
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

		List<Users> usersList = usersService.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = usersService.getRecordCount(filter);
		request.setAttribute("listusers", usersList);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/usersmanager.jsp";
		}
		forward(forwardurl);
	}

}
