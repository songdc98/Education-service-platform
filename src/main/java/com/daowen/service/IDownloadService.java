package com.daowen.service;

import com.daowen.entity.Downrecord;

public interface IDownloadService {


	Downrecord buildRecord(int id);
	
	/***
	 * 
	 * @param id
	 * @param result
	 * @return
	 * 下载之后动作
	 */
	int  afteredDownload(int id, boolean result);
	
	
}
