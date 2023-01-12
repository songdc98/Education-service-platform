package com.daowen.service;
import com.daowen.entity.*;
import com.daowen.vo.PaperModule;
import com.daowen.vo.PaperVo;
import org.apache.commons.collections4.list.PredicatedList;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.daowen.mapper.ShijuanMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ShijuanService extends SimpleBizservice<ShijuanMapper>{

    @Autowired
    private CeshitiService ceshitiSrv=null;
    @Autowired
    private PanduanService panduanSrv=null;
    @Autowired
    private TiankongService tiankongSrv=null;

    @Autowired
    private JiandaService  jiandaSrv=null;

    /**
     * 获取试卷信息
     * @param id
     * @return
     */
    public PaperVo getPaper(int id){
        List<PaperModule> listPaperModule=new ArrayList<>();
        String sql= MessageFormat.format("select c.*,sji.fenshu,sji.id as sjiid from  ceshiti c,shijuan sj ,shijuanitem sji where sji.shijuanid=sj.id and sji.tihao=c.id and sji.tixing=1 and sj.id={0,number,#} order by sji.id asc ",id);
        List<HashMap<String,Object>> listCeshiti= ceshitiSrv.queryToMap(sql);
        if(listCeshiti!=null)
           listPaperModule.add(new PaperModule(1,listCeshiti));

        sql= MessageFormat.format("select j.*,sji.fenshu,sji.id as sjiid from  panduan j,shijuan sj ,shijuanitem sji where sji.shijuanid=sj.id and sji.tihao=j.id and sji.tixing=2 and sj.id={0,number,#} order by sji.id asc ",id);
        List<HashMap<String,Object>> listPanduan= panduanSrv.queryToMap(sql);
        if(listPanduan!=null)
            listPaperModule.add(new PaperModule(2,listPanduan));

        sql= MessageFormat.format("select tk.*,sji.fenshu,sji.id as sjiid from  tiankong tk,shijuan sj ,shijuanitem sji where sji.shijuanid=sj.id and sji.tihao=tk.id and sji.tixing=3 and sj.id={0,number,#} order by sji.id asc ",id);
        List<HashMap<String,Object>> listTiankong= tiankongSrv.queryToMap(sql);
        if(listTiankong!=null)
            listPaperModule.add(new PaperModule(3,listTiankong));

        sql= MessageFormat.format("select jd.*,sji.fenshu,sji.id as sjiid from  jianda jd,shijuan sj ,shijuanitem sji where sji.shijuanid=sj.id and sji.tihao=jd.id and sji.tixing=4 and sj.id={0,number,#} order by sji.id asc ",id);
        List<HashMap<String,Object>> listJianda= jiandaSrv.queryToMap(sql);
        if(listJianda!=null)
            listPaperModule.add(new PaperModule(4,listJianda));

        Shijuan sj=this.load("where id="+id);
        if(sj==null)
            return null;
        PaperVo paperVo=new PaperVo(sj,listPaperModule);
        return paperVo;
    }






}
