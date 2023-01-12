package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Fcomment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private Double totalscore;

	public Double getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(Double totalscore) {
		this.totalscore = totalscore;
	}

	private String commentor;

	public String getCommentor() {
		return commentor;
	}

	public void setCommentor(String commentor) {
		this.commentor = commentor;
	}

	private Date commenttime;

	public Date getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(Date commenttime) {
		this.commenttime = commenttime;
	}

	private String tablename;

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	private String belongid;

	public String getBelongid() {
		return belongid;
	}

	public void setBelongid(String belongid) {
		this.belongid = belongid;
	}

	
	private String dcontent;

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
}
