package com.daowen.vo;

import com.daowen.entity.Dajuan;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public class DajuanVo {

    private int id;

    private String kemu;
    private String title;
    private Date createtime;
    private int shijuanid;
    private int state;
    private int defen;
    private int testerid;
    private String testername;
    public DajuanVo(Dajuan dajuan,List<PaperModule> paperModules){
        this.paperModules=paperModules;
        this.id=dajuan.getId();
        this.defen=dajuan.getDefen();
        this.testerid= dajuan.getTesterid();
        this.testername=dajuan.getTestername();
        this.state=dajuan.getState();
        this.shijuanid= dajuan.getShijuanid();
        this.title=dajuan.getTitle();
        this.createtime=new Date();


    }

    public PaperModule paperModule(int type){
        if(paperModules==null)
            return null;
        Optional<PaperModule> pmOptional= paperModules.stream().filter(pm->pm.getType()==type).findFirst();
        if(pmOptional.isPresent())
            return pmOptional.get();
        return null;
    }


    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public int getShijuanid() {
        return shijuanid;
    }

    public void setShijuanid(int shijuanid) {
        this.shijuanid = shijuanid;
    }

    public int getTesterid() {
        return testerid;
    }

    public void setTesterid(int testerid) {
        this.testerid = testerid;
    }

    public String getTestername() {
        return testername;
    }

    public void setTestername(String testername) {
        this.testername = testername;
    }

    private List<PaperModule> paperModules;

    public List<PaperModule> getPaperModules(){
        return this.paperModules;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getKemu() {
        return kemu;
    }

    public void setKemu(String kemu) {
        this.kemu = kemu;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }



    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getDefen() {
        return defen;
    }

    public void setDefen(int defen) {
        this.defen = defen;
    }
}
