package com.daowen.service;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.daowen.mapper.FcommentMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;
@Service
public class FcommentService extends SimpleBizservice<FcommentMapper>{
	private int score=10;
    public double getAvgTs(String xtype,String id){ 
		
		String sql=MessageFormat.format("select AVG(totalscore) avg from fcomment where belongid={0} and tablename=''{1}''",id,xtype);
		 
		List<HashMap<String,Object>> list=this.queryToMap(sql); 
		if(list==null)
			return score;
		if(list.size()==0)
			return score;
		if(list.get(0)==null)
			return score;
		return Double.parseDouble(list.get(0).get("avg").toString());
		
		
		
	}
	
	
}
