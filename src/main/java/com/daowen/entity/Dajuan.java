package com.daowen.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Dajuan {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String title;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date  createtime;

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	private String kemu;

	public String getKemu() {
		return kemu;
	}

	public void setKemu(String kemu) {
		this.kemu = kemu;
	}


	private int shijuanid;

	public int getShijuanid() {
		return shijuanid;
	}

	public void setShijuanid(int shijuanid) {
		this.shijuanid = shijuanid;
	}

	private int defen;

	public int getDefen() {
		return defen;
	}

	public void setDefen(int defen) {
		this.defen = defen;
	}
	
    private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	private int testerid;
	private String testername;

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

}
