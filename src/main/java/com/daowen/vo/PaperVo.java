package com.daowen.vo;

import com.daowen.entity.Ceshiti;
import com.daowen.entity.Shijuan;

import java.util.List;
import java.util.Optional;

public class PaperVo {

    private int id;
    private double difffact;
    private int kmid;
    private String kemu;
    private String title;
    private int zongfen;
    private String zujuanren;
    private int state;

    public PaperVo(Shijuan shijuan,List<PaperModule> paperModules){
        this.paperModules=paperModules;
        this.id=shijuan.getId();
        this.difffact=shijuan.getDifffact();
        this.title=shijuan.getTitle();
        this.kmid=shijuan.getKmid();
        this.kemu=shijuan.getKemu();
        this.state=shijuan.getState();
        this.zongfen=shijuan.getZongfen();
        this.zujuanren=shijuan.getZujuanren();

    }

    public PaperModule paperModule(int type){
        if(paperModules==null)
            return null;
       Optional<PaperModule> pmOptional= paperModules.stream().filter(pm->pm.getType()==type).findFirst();
       if(pmOptional.isPresent())
          return pmOptional.get();
       return null;
    }

    private List<PaperModule> paperModules;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getDifffact() {
        return difffact;
    }

    public void setDifffact(double difffact) {
        this.difffact = difffact;
    }

    public int getKmid() {
        return kmid;
    }

    public void setKmid(int kmid) {
        this.kmid = kmid;
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

    public int getZongfen() {
        return zongfen;
    }

    public void setZongfen(int zongfen) {
        this.zongfen = zongfen;
    }

    public String getZujuanren() {
        return zujuanren;
    }

    public void setZujuanren(String zujuanren) {
        this.zujuanren = zujuanren;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<PaperModule> getPaperModules() {
        return paperModules;
    }


}
