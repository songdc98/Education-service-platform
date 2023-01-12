package com.daowen.entity;

import java.util.Date;
import javax.persistence.*;

@Entity
public class Panduan {
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

	private String daan;

	public String getDaan() {
		return daan;
	}

	public void setDaan(String daan) {
		this.daan = daan;
	}

	private String kemu;

	public String getKemu() {
		return kemu;
	}

	public void setKemu(String kemu) {
		this.kemu = kemu;
	}

	private double difffact;

	public double getDifffact() {
		return difffact;
	}

	public void setDifffact(double difffact) {
		this.difffact = difffact;
	}
	private int kmid;

	public int getKmid() {
		return kmid;
	}

	public void setKmid(int kmid) {
		this.kmid = kmid;
	}
}
