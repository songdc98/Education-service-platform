package com.daowen.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.daowen.entity.Yingpian;
import com.daowen.vo.SearchVo;
import org.springframework.stereotype.Service;

import com.daowen.entity.Courseware;
import com.daowen.entity.Downrecord;
import com.daowen.mapper.CoursewareMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
@Service
public class CoursewareService extends SimpleBizservice<CoursewareMapper> implements IDownloadService{

	
	@Override
	public Downrecord buildRecord(int id) {
		
		Courseware cw=load("where id="+id);
		if(cw==null)
			return null;
		
		Downrecord dc=new Downrecord();
		dc.setCreatetime(new Date());
		dc.setZyid(id);
		dc.setZytitle(cw.getTitle());
		
		return dc;
	}

	@Override
	public int afteredDownload(int id, boolean result) {
		if(result)
		  return this.executeUpdate("update courseware set dwcount=dwcount+1 where id="+id);
		return 0;
	}

	public List<SearchVo> search(String title){
		List<Courseware> listCoureware= getEntity(" where title like '%"+title+"%'");
		if(listCoureware==null)
			return null;
		List<SearchVo> listSearch=new ArrayList<>();
		for(Courseware courseware :listCoureware){
			SearchVo searchVo=new SearchVo();
			searchVo.setId(courseware.getId());
			searchVo.setName(courseware.getTitle());
			searchVo.setHref("/e/coursewareinfo.jsp?id="+ courseware.getId());
			searchVo.setTupian(courseware.getTupian());
			searchVo.setXtype(4);
			listSearch.add(searchVo);
		}
		return  listSearch;
	}



}
