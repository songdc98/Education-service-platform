package com.daowen.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.daowen.util.JsonResult;
import com.daowen.vo.ExamResultDTO;
import com.daowen.vo.PaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Ceshiti;
import com.daowen.entity.Dajuan;
import com.daowen.entity.Dajuanitem;
import com.daowen.entity.Jianda;
import com.daowen.entity.Panduan;
import com.daowen.entity.Shijuan;
import com.daowen.entity.Shijuanitem;
import com.daowen.entity.Tiankong;

import com.daowen.service.CeshitiService;
import com.daowen.service.DajuanService;
import com.daowen.service.DajuanitemService;
import com.daowen.service.JiandaService;
import com.daowen.service.KechengService;
import com.daowen.service.PanduanService;
import com.daowen.service.ShijuanService;
import com.daowen.service.ShijuanitemService;

import com.daowen.service.TiankongService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ShijuanController extends SimpleController {

	@Override
	@RequestMapping("/admin/shijuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {

		mappingMethod(request, response);

	}
	@ResponseBody
	@PostMapping("/admin/shijuan/info")
	public JsonResult info(){
		String id=request.getParameter("id");
		if(id==null||id.equals(""))
			return JsonResult.error(-1,"id编号不存在");
		PaperVo paperVo=shijuanSrv.getPaper(Integer.parseInt(id));
		return JsonResult.success(1,"获取试卷信息",paperVo);

	}




	@ResponseBody
	@PostMapping("/admin/shijuan/list")
	public JsonResult list(){
		List<Shijuan> listShiuan=shijuanSrv.getEntity("");
		return JsonResult.success(1,"获取试卷信息",listShiuan);

	}

	@ResponseBody
	@PostMapping("/admin/shijuan/exam")
	public  JsonResult  examTest(){
		String payload=getRequestPayload(request);
		System.out.println("payload="+payload);
		ExamResultDTO er= JSONObject.parseObject(payload,ExamResultDTO.class);
		if(er==null)
			return JsonResult.error(-1,"获取数据失败");
		Shijuan shijuan=shijuanSrv.load("where id="+er.getPaperId());
		if(shijuan==null)
			return JsonResult.error(-2,"获取试卷失败");
		Dajuan dajuan = new Dajuan();
		dajuan.setKemu(shijuan.getKemu());
		dajuan.setShijuanid(shijuan.getId());
		dajuan.setState(1);
		dajuan.setTitle(shijuan.getTitle());
		dajuan.setState(1);
		dajuan.setTesterid(er.getHyid());
		dajuan.setTestername(er.getHyName());
		dajuan.setDefen(0);
		dajuan.setCreatetime(new Date());
		dajuanSrv.save(dajuan);
		int totalScore = 0;
		if (er.getAnswers() != null) {
			for (ExamResultDTO.AnswerItem ai : er.getAnswers()) {
				Dajuanitem dajuanitem = new Dajuanitem();
				dajuanitem.setDajuanid(dajuan.getId());
				dajuanitem.setShijuanid(shijuan.getId());
				dajuanitem.setDaan(ai.getResult());
				dajuanitem.setQtype(ai.getqType());
				dajuanitem.setTihao(ai.getId());
				dajuanitem.setFenshu(ai.getFenshu());
				if (ai.getStdaan()!=null&&ai.getStdaan().toUpperCase().equals(ai.getResult())) {
					dajuanitem.setDefen(ai.getFenshu());
					totalScore +=dajuanitem.getDefen();
				} else {
					dajuanitem.setDefen(0);
				}
				djiSrv.save(dajuanitem);

			}
		} // end if
		dajuan.setDefen(totalScore);
		dajuanSrv.update(dajuan);
		System.out.println(er.toString());
		return JsonResult.success(1,"测试完成");
	}

	public void test() {

		String shijuanid = request.getParameter("shijuanid");
		String kemu = request.getParameter("kemu");
		String title = request.getParameter("title");
		String testerid = request.getParameter("testerid");
		String zujuanren = request.getParameter("zujuanren");
		String testername = request.getParameter("testername");
		String forwardurl = request.getParameter("forwardurl");
		String[] shitiids = request.getParameterValues("tihaolist");
		Dajuan dajuan = new Dajuan();
		dajuan.setKemu(kemu);
		dajuan.setShijuanid(Integer.parseInt(shijuanid));
		dajuan.setTesterid(Integer.parseInt(testerid));
		dajuan.setTitle(title);
		dajuan.setState(1);
		dajuan.setTestername(testername);
		dajuan.setDefen(0);
		dajuan.setCreatetime(new Date());
		dajuanSrv.save(dajuan);
		int djtataldefen = 0;
		if (shitiids != null) {
			for (String shitiid : shitiids) {
				Dajuanitem dajuanitem = new Dajuanitem();
				// 获取试题分数
				String fenshu = request.getParameter("fenshu" + shitiid);
				// 答案
				String daan = request.getParameter("daan" + shitiid);
				// 题号
				String tihao = request.getParameter("tihao" + shitiid);
				// 参考答案
				String stdaan = request.getParameter("stdaan" + shitiid);
				String qtype = request.getParameter("qtype" + shitiid);
				dajuanitem.setDajuanid(dajuan.getId());
				dajuanitem.setShijuanid(Integer.parseInt(shijuanid));
				dajuanitem.setDaan(daan);
				dajuanitem.setQtype(Integer.parseInt(qtype));

				if (tihao != null)
					dajuanitem.setTihao(Integer.parseInt(tihao));
				if (stdaan!=null&&stdaan.toUpperCase().equals(daan)) {
					dajuanitem.setDefen(Integer.parseInt(fenshu));
					djtataldefen += Integer.parseInt(fenshu);
				} else {
					dajuanitem.setDefen(0);
				}
				djiSrv.save(dajuanitem);
			}
		} // end if
		dajuan.setDefen(djtataldefen);
		dajuanSrv.update(dajuan);
		request.setAttribute("dajuan",dajuan);
		if(forwardurl==null)
			forwardurl="/e/testres.jsp";
		forward(forwardurl);

	}

	private void yuejuan() {

		String djid = request.getParameter("id");

		String[] djids = request.getParameterValues("djids");

		Dajuan dajuan = (Dajuan) dajuanSrv.load("where id=" + djid);

		int djtataldefen = 0;
		if (djids != null) {
			for (String dji : djids) {

				Dajuanitem dajuanitem = djiSrv.load("where id=" + dji);
				// 获取试题分数
				String defen = request.getParameter("defen" + dji);

				dajuanitem.setDefen(Integer.parseInt(defen));
				// 答卷总分
				djtataldefen += dajuanitem.getDefen();
				// 答案
				djiSrv.update(dajuanitem);

			}
		} // end if

		dajuan.setDefen(djtataldefen);
		dajuan.setState(2);
		dajuanSrv.update(dajuan);
		String forwardurl = request.getParameter("forwardurl");
		redirect(forwardurl);

	}

	/*
	 * 移除试卷上面试题
	 */
	public void removeShiti() {

		String shijuanid = request.getParameter("sjid");
		String tihao = request.getParameter("tihao");
		String forwardurl = request.getParameter("forwardurl");
		Shijuanitem sji = new Shijuanitem();

		String tixing = request.getParameter("tixing");

		if (tixing != null && tixing.equals("1")) {

			tixing = "单选题";
		}

		if (shijuanid != null && tihao != null) {

			sjiSrv.delete(MessageFormat.format("where tihao={0} and shijuanid={1} and tixing=''{2}'' ", tihao,
					shijuanid, tixing));

		}
		redirect(forwardurl);

	}

	/**
	 * 组卷 完成
	 * 
	 */
	public void zujuanOver() {

		String sjid = request.getParameter("sjid");
		String forwardurl = request.getParameter("forwardurl");
		Shijuan shijuan = shijuanSrv.load("where id=" + sjid);
		String[] shitiids = request.getParameterValues("tihaolist");

		if (shijuan != null) {

			if (shitiids != null) {
				for (String shitiid : shitiids) {

					Shijuanitem shijuanitem = sjiSrv.load(MessageFormat.format("where id={0} ", shitiid));
					// 获取试题分数
					String fenshu = request.getParameter(shitiid);
					if (shijuanitem != null) {
						shijuanitem.setFenshu(Integer.parseInt(fenshu));
						sjiSrv.update(shijuanitem);

					}

				}
			}
			shijuan.setState(2);
			shijuanSrv.update(shijuan);

		}

		redirect(forwardurl);

	}

	private String getRequestPayload(HttpServletRequest request){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		BufferedReader br=null;
		try {
			br = new BufferedReader(new InputStreamReader(request.getInputStream(),"utf-8"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		String line="";
		StringBuilder sb = new StringBuilder();
		try {
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
		}catch (IOException e){

		}
		return sb.toString();
	}

	public void zujuanAuto() {

		String sjid = request.getParameter("sjid");
		String forwardurl = request.getParameter("forwardurl");
		String errorurl = request.getParameter("errorurl");
		Shijuan shijuan = shijuanSrv.load("where id=" + sjid);
		String danxuancount = request.getParameter("danxuancount");
		String panduancount = request.getParameter("panduancount");
		String tiankongcount = request.getParameter("tiankongcount");
		String zuowencount = request.getParameter("zuowencount");
		String danxuanfen = request.getParameter("danxuanfen");
		String panduanfen = request.getParameter("panduanfen");
		String tiankongfen = request.getParameter("tiankongfen");
		String zuowenfen = request.getParameter("zuowenfen");
		String kmid = request.getParameter("kmid");
		String kemu = request.getParameter("kemu");
		String difffact = request.getParameter("difffact");
		String filter = MessageFormat.format("where kmid=''{0}'' and difffact={1} ", kmid, difffact);
		String nandu = "一般难度";
		if (difffact != null && difffact.equals("0.8")) {
			nandu = "非常难";
		}
		if (difffact != null && difffact.equals("0.6")) {
			nandu = "较难";
		}
		if (difffact != null && difffact.equals("0.5")) {
			nandu = "一般";
		}
		if (difffact != null && difffact.equals("0.3")) {
			nandu = "容易";
		}

		int totaldanxuancount = ceshitiSrv.getRecordCount(filter);
		if (totaldanxuancount < Integer.parseInt(danxuancount)) {
			request.setAttribute("errormsg", MessageFormat.format(
					"<label class='error'>题库中{0}的单选题难度系数为:{1}只有{2}道,请加入试题</label>", kemu, nandu, totaldanxuancount));
			dispatchParams(request, response);
			forward(errorurl);
			return;
		}

		int totalpanduancount = panduanSrv.getRecordCount(filter);
		if (totalpanduancount < Integer.parseInt(panduancount)) {
			request.setAttribute("errormsg", MessageFormat.format(
					"<label class='error'>题库中{0}的判断题难度系数为:{1}只有{2}道,请加入试题</label>", kemu, nandu, totalpanduancount));
			dispatchParams(request, response);
			forward(errorurl);
			return;
		}
		int totaltiankongcount = tiankongSrv.getRecordCount(filter);
		if (totaltiankongcount < Integer.parseInt(tiankongcount)) {
			request.setAttribute("errormsg", MessageFormat.format(
					"<label class='error'>题库中{0}的填空题难度系数为:{1}只有{1}道,请加入试题</label>", kemu, nandu, totaltiankongcount));
			dispatchParams(request, response);
			forward(errorurl);
			return;
		}

		int totaljiandacount = jiandaSrv.getRecordCount(filter);
		if (totaljiandacount < Integer.parseInt(zuowencount)) {
			request.setAttribute("errormsg", MessageFormat.format(
					"<label class='error'>题库中{0}的简单题难度系数为:{1}只有{2}道,请加入试题</label>", kemu, nandu, totaljiandacount));
			dispatchParams(request, response);
			forward(errorurl);
			return;
		}

		// 加入测试题
		randomCeshitiToPaper(danxuancount, danxuanfen, sjid);
		// 加入判断题
		randomPanduanToPaper(panduancount, panduanfen, sjid);
		// 加入填空题
		randomTiankongToPaper(tiankongcount, tiankongfen, sjid);
		// 加入简答题
		randomJiandaToPaper(zuowencount, zuowenfen, sjid);
		shijuan.setState(2);
		shijuanSrv.update(shijuan);
		redirect(forwardurl);

	}

	/**
	 * 把单选题加入试卷
	 * 
	 * @param danxuancount
	 *            单选题数目
	 * @param fenzhi
	 *            分值
	 * @param sjid
	 *            试卷编号
	 */
	private void randomCeshitiToPaper(String danxuancount, String fenzhi, String sjid) {

		System.out.println("danxuancount=" + danxuancount);
		System.out.println("fenzhi=" + fenzhi);
		List<Ceshiti> danxuanlist = getRandomCeshiti(Integer.parseInt(danxuancount));
		System.out.println("danxuanlit.size=" + danxuanlist.size());
		for (Ceshiti ceshiti : danxuanlist) {

			Shijuanitem sji = new Shijuanitem();
			sji.setFenshu(Integer.parseInt(fenzhi));
			sji.setTihao(ceshiti.getId());
			sji.setShijuanid(Integer.parseInt(sjid));
			//单选题
			sji.setTixing(1);
			sjiSrv.save(sji);
		}

	}

	/**
	 * 把判断题加入试卷
	 * 
	 * @param ticount
	 * @param fenzhi
	 * @param sjid
	 */
	private void randomPanduanToPaper(String ticount, String fenzhi, String sjid) {

		List<Panduan> panduanlist = getRandomPanduan(Integer.parseInt(ticount));

		for (Panduan panduan : panduanlist) {

			Shijuanitem sji = new Shijuanitem();
			sji.setFenshu(Integer.parseInt(fenzhi));
			sji.setTihao(panduan.getId());
			sji.setShijuanid(Integer.parseInt(sjid));
			//判断题
			sji.setTixing(2);
			sjiSrv.save(sji);
		}

	}

	/**
	 * 把填空题加入试卷
	 * 
	 * @param ticount
	 * @param fenzhi
	 * @param sjid
	 */
	private void randomTiankongToPaper(String ticount, String fenzhi, String sjid) {

		List<Tiankong> tiankonglist = getRandomTiankong(Integer.parseInt(ticount));

		for (Tiankong tiankong : tiankonglist) {

			Shijuanitem sji = new Shijuanitem();
			sji.setFenshu(Integer.parseInt(fenzhi));
			sji.setTihao(tiankong.getId());
			sji.setShijuanid(Integer.parseInt(sjid));
			//填空题
			sji.setTixing(3);
			sjiSrv.save(sji);
		}

	}

	/**
	 * 把简答题加入试卷
	 * 
	 * @param ticount
	 *            题数
	 * @param fenzhi
	 *            分值
	 * @param sjid
	 *            试卷编号
	 */
	private void randomJiandaToPaper(String ticount, String fenzhi, String sjid) {

		List<Jianda> jiandalist = getRandomJianda(Integer.parseInt(ticount));

		for (Jianda jianda : jiandalist) {

			Shijuanitem sji = new Shijuanitem();
			sji.setFenshu(Integer.parseInt(fenzhi));
			sji.setTihao(jianda.getId());
			sji.setShijuanid(Integer.parseInt(sjid));
			//简单题
			sji.setTixing(4);
			sjiSrv.save(sji);
		}

	}

	/**
	 * 随机选择单选题
	 * 
	 * @param count
	 * @return
	 */
	private List<Ceshiti> getRandomCeshiti(int count) {

		List<Ceshiti> chooselist = new ArrayList<Ceshiti>();
		List<Ceshiti> danxuanlist = ceshitiSrv.getEntity("");
		if (danxuanlist.size() <= count)
			return danxuanlist;

		int[] seqarr = randomCommon(1, danxuanlist.size(), count);

		int j = 1;
		for (Ceshiti ceshiti : danxuanlist) {

			if (hasInAarray(j, seqarr))
				chooselist.add(ceshiti);
			j++;

		}
		System.out.println("抽取试题总数:" + chooselist.size());
		return chooselist;

	}

	/**
	 * 随机选择判断题
	 * 
	 * @param count
	 * @return
	 */
	private List<Panduan> getRandomPanduan(int count) {

		List<Panduan> chooselist = new ArrayList<Panduan>();
		List<Panduan> panduanlist = panduanSrv.getEntity("");
		if (panduanlist.size() <= count)
			return panduanlist;

		int[] seqarr = randomCommon(1, panduanlist.size(), count);
		System.out.println("seqarr.length=" + seqarr.length);

		int j = 1;
		for (Panduan panduan : panduanlist) {

			if (hasInAarray(j, seqarr))
				chooselist.add(panduan);
			j++;
		}

		return chooselist;

	}

	/*
	 * 随机选择填空题
	 */
	private List<Tiankong> getRandomTiankong(int count) {

		List<Tiankong> chooselist = new ArrayList<Tiankong>();
		List<Tiankong> tiankonglist = tiankongSrv.getEntity("");
		if (tiankonglist.size() <= count)
			return tiankonglist;

		int[] seqarr = randomCommon(1, tiankonglist.size(), count);
		int index = 0;
		int j = 1;
		for (Tiankong tiankong : tiankonglist) {

			if (hasInAarray(j, seqarr))
				chooselist.add(tiankong);

			j++;

		}

		return chooselist;

	}

	private List<Jianda> getRandomJianda(int count) {

		List<Jianda> chooselist = new ArrayList<Jianda>();
		List<Jianda> jiandalist = jiandaSrv.getEntity("");
		if (jiandalist.size() <= count)
			return jiandalist;

		int[] seqarr = randomCommon(1, jiandalist.size(), count);
		int index = 0;
		int j = 1;
		for (Jianda jianda : jiandalist) {

			if (hasInAarray(j, seqarr))
				chooselist.add(jianda);

			index++;
			j++;

		}

		return chooselist;

	}

	private boolean hasInAarray(int ele, int[] arr) {

		for (int x : arr) {
			if (x == ele)
				return true;
		}
		return false;

	}

	public static void main(String[] args) {

	}

	private int[] randomCommon(int min, int max, int n) {
		if (n > (max - min + 1) || max < min) {
			return null;
		}
		int[] result = new int[n];
		int count = 0;
		while (count < n) {
			int num = (int) (Math.random() * (max - min)) + min;
			boolean flag = true;
			for (int j = 0; j < n; j++) {
				if (num == result[j]) {
					flag = false;
					break;
				}
			}
			if (flag) {
				result[count] = num;
				count++;
			}
		}
		return result;
	}

	/**
	 * 添加试题
	 */
	public void addShiti() {

		String shijuanid = request.getParameter("shijuanid");
		String tihao = request.getParameter("tihao");
		String tixing = request.getParameter("tixing");
		String forwardurl = request.getParameter("forwardurl");
		Shijuanitem sji = new Shijuanitem();

		if (shijuanid != null && tihao != null) {

			sji.setShijuanid(Integer.parseInt(shijuanid));
			sji.setTihao(Integer.parseInt(tihao));
			sji.setFenshu(2);
			sji.setTixing(Integer.parseInt(tixing));
			sjiSrv.save(sji);

		}
		redirect(forwardurl);

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {

		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;

		for (String id : ids) {
			// 删除试卷
			shijuanSrv.delete(" where id=" + id);
			// 删除试卷内容
			sjiSrv.delete("where shijuanid=" + id);
		}
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String zujuanren = request.getParameter("zujuanren");
		String zongfen = request.getParameter("zongfen");
		String kemu = request.getParameter("kemu");
		String tupian = request.getParameter("tupian");
		String kmid = request.getParameter("kmid");
		String des = request.getParameter("des");
		String difffact = request.getParameter("difffact");
		SimpleDateFormat sdfshijuan = new SimpleDateFormat("yyyy-MM-dd");
		Shijuan shijuan = new Shijuan();
		shijuan.setTitle(title == null ? "" : title);
		shijuan.setZujuanren(zujuanren == null ? "" : zujuanren);
		shijuan.setZongfen(zongfen == null ? 0 : new Integer(zongfen));
		shijuan.setKemu(kemu == null ? "" : kemu);
		shijuan.setKmid(kmid==null?0:Integer.parseInt(kmid));
		// 试卷入库后进入待组卷状态
		if (difffact != null)
			shijuan.setDifffact(Double.parseDouble(difffact));
		else
			// 一般难度系数
			shijuan.setDifffact(0.5);
		shijuan.setState(1);
        shijuan.setTupian(tupian==null?"":tupian);
		shijuan.setDes(des == null ? "" : des);
		shijuanSrv.save(shijuan);

		if (forwardurl == null) {
			forwardurl = "/admin/shijuanmanager.do?actiontype=get";
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
		Shijuan shijuan = shijuanSrv.load(new Integer(id));
		if (shijuan == null)
			return;
		String title = request.getParameter("title");
		String zujuanren = request.getParameter("zujuanren");
		String zongfen = request.getParameter("zongfen");
		String kmid = request.getParameter("kmid");
		String kemu = request.getParameter("kemu");
		String des = request.getParameter("des");

		String tupian = request.getParameter("tupian");
		SimpleDateFormat sdfshijuan = new SimpleDateFormat("yyyy-MM-dd");
		shijuan.setTitle(title);
		shijuan.setZujuanren(zujuanren);
		shijuan.setZongfen(zongfen == null ? 0 : new Integer(zongfen));
		shijuan.setKemu(kemu);
		shijuan.setDes(des);

		shijuan.setKmid(kmid==null?0:Integer.parseInt(kmid));
		shijuanSrv.update(shijuan);

		if (forwardurl == null) {
			forwardurl = "/admin/shijuanmanager.do?actiontype=get";
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
			Shijuan shijuan = shijuanSrv.load("where id=" + id);
			if (shijuan != null) {
				request.setAttribute("shijuan", shijuan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> kemu_datasource = kechengSrv.getEntity("");
		request.setAttribute("kmid_datasource", kemu_datasource);

		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shijuanadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String state=request.getParameter("state");
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		if(state!=null)
			filter+=" and state="+state;

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
		List<Shijuan> listshijuan = shijuanSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = shijuanSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listshijuan", listshijuan);
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
			forwardurl = "/admin/shijuanmanager.jsp";
		}
		forward(forwardurl);
	}


	
	public void query() {
		String sql=" select sj.* from shijuan sj,ksbaoming bm where sj.kmid=bm.kcid and bm.state=2 and sj.status='组卷完成' ";
		String hyaccount=request.getParameter("hyaccount");
		if(hyaccount!=null)
			sql+=" and bm.hyaccount='"+hyaccount+"'";
		List<HashMap<String,Object>> listShijuan=shijuanSrv.queryToMap(sql);
		request.setAttribute("listShijuan", listShijuan);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shijuanmanager.jsp";
		}
		forward(forwardurl);
	} 
	

	@Autowired
	private ShijuanService shijuanSrv = null;
	@Autowired
	private DajuanService dajuanSrv = null;
	@Autowired
	private DajuanitemService djiSrv = null;
	@Autowired
	private CeshitiService ceshitiSrv = null;
	@Autowired
	private PanduanService panduanSrv = null;
	@Autowired
	private TiankongService tiankongSrv = null;
	@Autowired
	private JiandaService jiandaSrv = null;

	@Autowired
	private ShijuanitemService sjiSrv = null;
	@Autowired
	private KechengService kechengSrv = null;

}
