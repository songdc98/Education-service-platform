package com.daowen.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Downrecord {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String gno;

	public String getGno() {
		return gno;
	}

	public void setGno(String gno) {
		this.gno = gno;
	}

	private String gname;

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	private String zytitle;

	public String getZytitle() {
		return zytitle;
	}

	public void setZytitle(String zytitle) {
		this.zytitle = zytitle;
	}

	private int zyid;

	public int getZyid() {
		return zyid;
	}

	public void setZyid(int zyid) {
		this.zyid = zyid;
	}

	private Date createtime;

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
}
