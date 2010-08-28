package com.voting.servlet;

import java.io.IOException;




import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;


import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.voting.javabean.Works_info;
import com.voting.logic.WorksInfoLogic;
import com.voting.util.ImageZoom;



public class AddWorks extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddWorks() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String newFileName="";
		SmartUpload mySmartUpload=new SmartUpload();
		mySmartUpload.initialize(this.getServletConfig(), request, response);
		
		try {
			mySmartUpload.upload();
			com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
			String tmpNm=myFile.getFileName();
			String myFileName = new String(myFile.getFileName().getBytes("GBK"), "UTF-8");
			int k=tmpNm.lastIndexOf(".");
			String fileType=tmpNm.substring(k+1,tmpNm.length());
			String saveImagePath=request.getRealPath("/") +"upload/images/";
			newFileName=System.currentTimeMillis()+"."+fileType;
			if(!new File(saveImagePath).exists())
				new File(saveImagePath).mkdirs();
			
			String saveImageMiniPath = request.getRealPath("/") + "upload/minimages/";
			if(!new File(saveImageMiniPath).exists())
				new File(saveImageMiniPath).mkdirs();
			
			String saveImageBigPath = request.getRealPath("/") + "upload/bigimages/";
			if(!new File(saveImageBigPath).exists())
				new File(saveImageBigPath).mkdirs();
			
			String saveImageUrl = "/upload/images/";
			String savaImageMinUrl = "/upload/minimages/";
			String savaImageBigUrl = "/upload/bigimages/";
			myFile.saveAs(saveImageUrl + newFileName);

			ImageZoom iz = new ImageZoom();
			iz.s_pic100(request.getRealPath("/") + saveImageUrl, request.getRealPath("/") + savaImageMinUrl, newFileName, newFileName, 80, 100, true);
			iz.s_pic300(request.getRealPath("/") + saveImageUrl, request.getRealPath("/") + savaImageBigUrl, newFileName, newFileName, 635, 520, true);
		    
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(newFileName!=null||!newFileName.equals("")){
			String workaddr="";
			String title=mySmartUpload.getRequest().getParameter("title").trim();
			String author=mySmartUpload.getRequest().getParameter("author").trim();
			String detail=mySmartUpload.getRequest().getParameter("detail").trim();
			String types=mySmartUpload.getRequest().getParameter("types").trim();
			if(types.equals("flv")){
			workaddr=mySmartUpload.getRequest().getParameter("workaddr");	
			}
			Works_info works=new Works_info();
			works.setWorks_author(author);
			works.setWorks_file_name(newFileName);
			works.setWorks_recommond(detail);
			works.setWorks_title(title);
			works.setWorks_type(types);
			works.setWorks_addr(workaddr);
			WorksInfoLogic worksInfoLogic=new WorksInfoLogic();
			//System.out.println("title::"+mySmartUpload.getRequest().getParameter("title"));
			//System.out.println("author::"+author);
			worksInfoLogic.addWorksInfo(works);
			response.sendRedirect(request.getContextPath()+"/manage/works_list.jsp");
		}
			
          
	}

	private HttpServletRequest getRequest() {
		// TODO Auto-generated method stub
		return this.getRequest();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
