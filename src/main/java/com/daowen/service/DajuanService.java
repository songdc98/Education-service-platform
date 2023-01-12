package com.daowen.service;
import com.daowen.entity.Dajuan;
import com.daowen.entity.Shijuan;
import com.daowen.vo.DajuanVo;
import com.daowen.vo.PaperModule;
import com.daowen.vo.PaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.daowen.mapper.DajuanMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class DajuanService extends SimpleBizservice<DajuanMapper>{


    @Autowired
    private CeshitiService ceshitiSrv=null;
    @Autowired
    private PanduanService panduanSrv=null;
    @Autowired
    private TiankongService tiankongSrv=null;

    @Autowired
    private JiandaService  jiandaSrv=null;
    /**
     *
     * @param id
     * @return
     */
    public DajuanVo getInfo(int  id){
        List<PaperModule> listPaperModule=new ArrayList<>();
        String sql= MessageFormat.format("select c.*,dji.fenshu, dji.defen,dji.daan as result from  ceshiti c ,dajuan dj,dajuanitem dji where  dji.tihao=c.id and dj.id=dji.dajuanid and dji.qtype=1 and dj.id={0,number,#} order by dji.id asc ",id);
        List<HashMap<String,Object>> listCeshiti= ceshitiSrv.queryToMap(sql);
        if(listCeshiti!=null)
            listPaperModule.add(new PaperModule(1,listCeshiti));

        sql= MessageFormat.format(" select j.*,dji.fenshu, dji.defen,dji.daan as result from  panduan j ,dajuan dj,dajuanitem dji where  dji.tihao=j.id and dj.id=dji.dajuanid and dji.qtype=2 and dj.id={0,number,#} order by dji.id asc ",id);
        List<HashMap<String,Object>> listPanduan= panduanSrv.queryToMap(sql);
        if(listPanduan!=null)
            listPaperModule.add(new PaperModule(2,listPanduan));

        sql= MessageFormat.format(" select tk.*,dji.fenshu, dji.defen,dji.daan as result from  tiankong tk ,dajuan dj,dajuanitem dji where  dji.tihao=tk.id and dj.id=dji.dajuanid and dji.qtype=3 and dj.id={0,number,#} order by dji.id asc ",id);
        List<HashMap<String,Object>> listTiankong= tiankongSrv.queryToMap(sql);
        if(listTiankong!=null)
            listPaperModule.add(new PaperModule(3,listTiankong));

        sql= MessageFormat.format(" select jd.*,dji.fenshu, dji.defen,dji.daan as result from  jianda jd ,dajuan dj,dajuanitem dji where  dji.tihao=jd.id and dj.id=dji.dajuanid and  dji.qtype=4 and dj.id={0,number,#} order by dji.id asc ",id);
        List<HashMap<String,Object>> listJianda= jiandaSrv.queryToMap(sql);
        if(listJianda!=null)
            listPaperModule.add(new PaperModule(4,listJianda));

        Dajuan dajuan=load("where id="+id);
        if(dajuan==null)
            return null;
        DajuanVo dajuanVo=new DajuanVo(dajuan,listPaperModule);
        return dajuanVo;
    }

}
