package com.daowen.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Downrecord;
import com.daowen.entity.Huiyuan;
import com.daowen.service.DownrecordService;
import com.daowen.service.IDownloadService;

@Controller
public class SystemPlusController {

	private String loginurl = "/e/login.jsp";

	private HttpServletRequest request;
	
	private HttpServletResponse response;
	
	@RequestMapping("/admin/download")
	public void doDownload(HttpServletRequest request, HttpServletResponse response) {

		String filename = "";
		boolean state = true;
		this.request=request;
		this.response=response;
		String zyid = request.getParameter("zyid");
		String url = request.getParameter("url");
		Huiyuan curAccount = (Huiyuan) request.getSession().getAttribute("huiyuan");
		if (curAccount == null) {
			try {
				response.sendRedirect(request.getContextPath() + loginurl);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		Boolean isRemote = isUrl(url);
		if (url != null && !isRemote) {
			filename = url.substring(url.lastIndexOf("/") + 1);
			state = downLocalResource(filename);
		}
		if (url != null && isRemote) {
			state = downRemoteResource(url);
		}
		if(zyid!=null)
		  saveDownRecord(Integer.parseInt(zyid),state);
	}

	private boolean downRemoteResource(String resurl) {

		Huiyuan curAccount = (Huiyuan) request.getSession().getAttribute("huiyuan");
		if (curAccount == null)
			try {
				response.sendRedirect(request.getContextPath() + loginurl);
			} catch (IOException e) {
				e.printStackTrace();
		}
		boolean state=true;
		try {
			URL url = new URL(resurl);
			String filename = resurl.substring(resurl.lastIndexOf("/") + 1);
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(filename.getBytes("UTF-8"), "iso8859-1"));
			URLConnection connection = url.openConnection();
			HttpURLConnection httpURLConnection = (HttpURLConnection) connection;
			httpURLConnection.setRequestProperty("User-Agent",
					"Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
			// 取得输入流，并使用Reader读取
			int responseCode = ((HttpURLConnection) connection).getResponseCode();
			BufferedInputStream bis = null;
			bis = new BufferedInputStream(httpURLConnection.getInputStream());
			ServletOutputStream sos = response.getOutputStream();

			int b;
			while ((b = bis.read()) != -1) {
				sos.write(b);
			}
			sos.close();
			bis.close();
		} catch (Exception e) {
            state=false;
		}
		return state;

	}

	private boolean downLocalResource(String filename) {
		BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;

		Boolean dlstate = true;
		try {

			response.setContentType("application/x-msdownload");
			response.setHeader("Content-disposition",
					"attachment; filename=" + new String(filename.getBytes("UTF-8"), "iso8859-1"));

			bis = new BufferedInputStream(
					new java.io.FileInputStream(request.getServletContext().getRealPath("/upload/temp/" + filename)));

			bos = new java.io.BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
			dlstate = false;
		} finally {
			if (bis != null && bos != null)
				try {
					bis.close();
					bos.close();

				} catch (IOException e) {
					e.printStackTrace();
				}

		}
		return dlstate;
	}

	private void saveDownRecord(int zyid,boolean result) {

		
		Huiyuan curAccount = (Huiyuan) request.getSession().getAttribute("huiyuan");
		if (curAccount == null) {
			try {
				response.sendRedirect(request.getContextPath() + loginurl);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		
		Downrecord dc =downloadSrv.buildRecord(zyid) ;
		if(result) {
		   dc.setGno(curAccount.getAccountname());
		   dc.setGname(curAccount.getName());
		   downrecordSrv.save(dc);
		}
		//下载之后
		downloadSrv.afteredDownload(zyid, result);

	}

	private boolean isUrl(String url) {
		Pattern pattern = Pattern
				.compile("^([hH][tT]{2}[pP]://|[hH][tT]{2}[pP][sS]://)(([A-Za-z0-9-~]+).)+([A-Za-z0-9-~\\/])+$");
		return pattern.matcher(url).matches();
	}

	@Autowired
	private IDownloadService downloadSrv = null;
	@Autowired
	private DownrecordService downrecordSrv = null;

}
