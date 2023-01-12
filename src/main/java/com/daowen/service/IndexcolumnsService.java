package com.daowen.service;

import com.daowen.entity.Indexcolumns;
import com.daowen.entity.Xinxi;
import com.daowen.vo.LanmuContentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.daowen.mapper.IndexcolumnsMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

import java.util.ArrayList;
import java.util.List;

@Service
@Scope("prototype")
public class IndexcolumnsService extends SimpleBizservice<IndexcolumnsMapper> {

     @Autowired
     private LanmuService lanmuSrv;
     public List<LanmuContentVo> getImageLanmu(int count){
         List<Indexcolumns>  textlist=getEntity("where showstyle='图片'");
         int i=1;
         List<LanmuContentVo> listLanmuContent=new ArrayList<LanmuContentVo>();
         for (Indexcolumns indexcolumns : textlist) {
           LanmuContentVo<Xinxi> lcv= lanmuSrv.getContent(indexcolumns.getColid(),count);
           listLanmuContent.add(lcv);
         }
         return listLanmuContent;
     }
    public List<LanmuContentVo> getTextLanmu(int count){
        List<Indexcolumns>  textlist=getEntity("where showstyle='文本'");
        int i=1;
        List<LanmuContentVo> listLanmuContent=new ArrayList<LanmuContentVo>();
        for (Indexcolumns indexcolumns : textlist) {
            LanmuContentVo<Xinxi> lcv= lanmuSrv.getContent(indexcolumns.getColid(),count);
            listLanmuContent.add(lcv);
        }
        return listLanmuContent;
    }


}
