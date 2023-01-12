package com.daowen.service;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.daowen.entity.Xinxi;
import com.daowen.vo.SearchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daowen.entity.Billrecord;
import com.daowen.entity.Huiyuan;
import com.daowen.entity.Yingpian;
import com.daowen.mapper.YingpianMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
@Service
public class YingpianService extends SimpleBizservice<YingpianMapper> implements IPlayService{

	@Autowired
	private HuiyuanService huiyuanSrv=null;
	
	@Autowired
	private BillrecordService billrecordSrv=null;
	/**
	 * 视频播放完成
	 */
	@Override
	public int playOver(int id) {
		return this.executeUpdate("update yingpian set playcount=playcount+1 where id="+id);
	}
    /**
     * 播放预准备
     */
	@Override
	public boolean prePlay(int id, String accountname) {
		Huiyuan  huiyuan=huiyuanSrv.load("where accountname='"+accountname+"'");
		Yingpian yingpian=this.load("where id="+id);
		
		
		if(yingpian==null||huiyuan==null)
			return false;
		
		if(yingpian.getJifen()>0) {
			
			boolean hasIn=billrecordSrv.isExist(MessageFormat.format("where accountname=''{0}'' and zyid={1}",huiyuan.getAccountname(),yingpian.getId()));
			if(hasIn)
				return true;
		}
		
		if(yingpian.getJifen()>huiyuan.getYue())
			return false;
		
		huiyuan.setYue(huiyuan.getYue()-yingpian.getJifen());
		huiyuanSrv.update(huiyuan);
		Billrecord bc=new Billrecord();
		bc.setAccountname(huiyuan.getAccountname());
		bc.setName(huiyuan.getName());
        bc.setCreatetime(new Date());
        bc.setZyid(yingpian.getId());
        bc.setFee(yingpian.getJifen());
        bc.setZytitle(yingpian.getTitle());
        bc.setXtype(2);
        bc.setOperdes("视频扣款");
		billrecordSrv.save(bc);
		return true;
	}


	public List<SearchVo>  search(String title){
		List<Yingpian> listVideo= getEntity(" where title like '%"+title+"%'");
		if(listVideo==null)
			return null;
		List<SearchVo> listSearch=new ArrayList<>();
		for(Yingpian yingpian :listVideo){
			SearchVo searchVo=new SearchVo();
			searchVo.setId(yingpian.getId());
			searchVo.setName(yingpian.getTitle());
			searchVo.setHref("/e/yingpianinfo.jsp?id="+ yingpian.getId());
			searchVo.setTupian(yingpian.getTupian());
			searchVo.setXtype(3);
			listSearch.add(searchVo);
		}
		return  listSearch;
	}
	
	
	
	
}
