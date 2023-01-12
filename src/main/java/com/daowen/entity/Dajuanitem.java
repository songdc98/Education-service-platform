package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Dajuanitem {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private int shijuanid;

	public int getShijuanid() {
		return shijuanid;
	}

	public void setShijuanid(int shijuanid) {
		this.shijuanid = shijuanid;
	}

	private int dajuanid;

	public int getDajuanid() {
		return dajuanid;
	}

	public void setDajuanid(int dajuanid) {
		this.dajuanid = dajuanid;
	}


	private int defen;

	public int getDefen() {
		return defen;
	}

	public void setDefen(int defen) {
		this.defen = defen;
	}


	private String daan;

	public String getDaan() {
		return daan;
	}

	public void setDaan(String daan) {
		this.daan = daan;
	}

	private int tihao;

	public int getTihao() {
		return tihao;
	}

	public void setTihao(int tihao) {
		this.tihao = tihao;
	}

	private int qtype;

	public int getQtype() {
		return qtype;
	}

	public void setQtype(int qtype) {
		this.qtype = qtype;
	}
	private int fenshu;

	public int getFenshu() {
		return fenshu;
	}

	public void setFenshu(int fenshu) {
		this.fenshu = fenshu;
	}
}
