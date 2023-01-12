package com.daowen.service;

import java.util.List;

import com.daowen.entity.Xinxi;
import com.daowen.vo.LanmuContentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daowen.entity.Lanmu;
import com.daowen.mapper.LanmuMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

@Service
public class LanmuService extends SimpleBizservice<LanmuMapper>{
    @Autowired
    private XinxiService xinxiSrv=null;


    public List<Lanmu> getSublanmus(int lanmuId){

        Lanmu lanmu=null;
        List<Lanmu> listLanmu=null;
        if(lanmuId>0){

            listLanmu=getEntity("where parentid="+lanmuId);

        }

        return listLanmu;
    }

    public LanmuContentVo getContent(int lmId){
        Lanmu lanmu = load("where id=" + lmId);
        return getNewsContent(lanmu);
    }

    public LanmuContentVo  getContent(int lmId,int count){
        Lanmu lanmu = load("where id=" + lmId);
        return getNewsContent(lanmu);
    }

    public LanmuContentVo  getContent(int lmId,int pageIndex,int pageSize){
        Lanmu lanmu = load("where id=" + lmId);
        return getNewsContent(lanmu,pageIndex,pageSize);
    }

    private LanmuContentVo getNewsContent(Lanmu lanmu) {
        if(lanmu==null)
            return null;
        List<Xinxi> listXinxi= xinxiSrv.findXinxi(lanmu.getId());
        return new LanmuContentVo<Xinxi>(lanmu,listXinxi);
    }
    private LanmuContentVo getNewsContent(Lanmu lanmu,int count) {
        if(lanmu==null)
            return null;
        List<Xinxi> listXinxi= xinxiSrv.getTopXinxi(lanmu.getId(), count);
        return new LanmuContentVo<Xinxi>(lanmu,listXinxi);
    }

    private LanmuContentVo getNewsContent(Lanmu lanmu,int pageIndex,int pageSize) {
        if(lanmu==null)
            return null;
        List<Xinxi> listXinxi= xinxiSrv.findXinxi(lanmu.getId(), pageIndex,pageSize);
        return new LanmuContentVo<Xinxi>(lanmu,listXinxi);
    }

}
