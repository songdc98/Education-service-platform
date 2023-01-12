package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Yingpian {
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

	private String tupian;

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	private String pubren;

	public String getPubren() {
		return pubren;
	}

	public void setPubren(String pubren) {
		this.pubren = pubren;
	}

	private Date pubtime;

	public Date getPubtime() {
		return pubtime;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	private String subtitle;

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	private String remoteurl;

	public String getRemoteurl() {
		return remoteurl;
	}

	public void setRemoteurl(String remoteurl) {
		this.remoteurl = remoteurl;
	}

	private int xshowtype;

	public int getXshowtype() {
		return xshowtype;
	}

	public void setXshowtype(int xshowtype) {
		this.xshowtype = xshowtype;
	}

	private int ypcateid;

	public int getYpcateid() {
		return ypcateid;
	}

	public void setYpcateid(int ypcateid) {
		this.ypcateid = ypcateid;
	}

	private String ypcatename;

	public String getYpcatename() {
		return ypcatename;
	}

	public void setYpcatename(String ypcatename) {
		this.ypcatename = ypcatename;
	}

	private int againstcount;

	public int getAgainstcount() {
		return againstcount;
	}

	public void setAgainstcount(int againstcount) {
		this.againstcount = againstcount;
	}

	private int agreecount;

	public int getAgreecount() {
		return agreecount;
	}

	public void setAgreecount(int agreecount) {
		this.agreecount = agreecount;
	}

	private String des;

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	private int clickcount;

	public int getClickcount() {
		return clickcount;
	}

	public void setClickcount(int clickcount) {
		this.clickcount = clickcount;
	}

	/**
	 * 字母索引
	 */
	private String alphabetindex;

	public String getAlphabetindex() {
		return alphabetindex;
	}

	public void setAlphabetindex(String alphabetindex) {
		this.alphabetindex = alphabetindex;
	}

	
	private String tags;

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
	
	public int getDlcount() {
		return dlcount;
	}

	public void setDlcount(int dlcount) {
		this.dlcount = dlcount;
	}

	public int getPlaycount() {
		return playcount;
	}

	public void setPlaycount(int playcount) {
		this.playcount = playcount;
	}

	private int dlcount;
	
	private int playcount;
	
	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	private int jifen;

	public int getJifen() {
		return jifen;
	}

	public void setJifen(int jifen) {
		this.jifen = jifen;
	}

}
