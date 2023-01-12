package com.daowen.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daowen.entity.Courseware;
import com.daowen.entity.Yingpian;
import com.daowen.service.CoursewareService;
import com.daowen.service.YingpianService;
import com.daowen.vo.SearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Xinxi;
import com.daowen.service.XinxiService;
import com.daowen.ssm.simplecrud.SimpleController;

@Controller
public class SitesearchController extends SimpleController {

    @Override
    @RequestMapping("/admin/sitesearch.do")
    public void mapping(HttpServletRequest req, HttpServletResponse resp) {
        mappingMethod(req, resp);

    }

    private void find() {

        String title = request.getParameter("title");
        if (title != null) {
			List<SearchVo> listXinxi=xinxiSrv.search(title);
			List<SearchVo> listYingpian=yingpianSrv.search(title);
			List<SearchVo> listCourseware=coursewareSrv.search(title);
			listXinxi.addAll(listYingpian);
            listXinxi.addAll(listCourseware);
            request.setAttribute("listSearch",listXinxi);
        }
        forward("/e/search.jsp");

    }

    @Autowired
    private YingpianService yingpianSrv=null;

    @Autowired
    private XinxiService xinxiSrv = null;

    @Autowired
    private CoursewareService coursewareSrv=null;

}
