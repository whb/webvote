package com.voting.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voting.javabean.Discuss_info;
import com.voting.javabean.Works_info;
import com.voting.logic.DiscussInfoLogic;
import com.voting.logic.WorksInfoLogic;
import com.voting.util.ip.National;

public class GetDiscussInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetDiscussInfo() {
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
		response.setContentType("text/xml; charset=UTF-8");
		PrintWriter out = response.getWriter();
		DiscussInfoLogic discussInfo=new DiscussInfoLogic();
		String works_id=request.getParameter("works_id");
		WorksInfoLogic worksInfoLogic=new WorksInfoLogic();
		Works_info works_info=(Works_info)worksInfoLogic.getWorksInfoMsgByID(Integer.parseInt(works_id));
		ArrayList list=discussInfo.getDiscussInfo(Integer.parseInt(works_id));
		StringBuffer sb=new StringBuffer("<table style=\"width: 545px;\" id=\"picInfo\">");
		if(list.size()>0){
		for(int i=0;i<list.size();i++){
			Discuss_info discuss_info=(Discuss_info)list.get(i);
			sb.append("<tr>");
			sb.append("<td style=\"width:100px\" align=\"left\"><img src=\"images/avataronline.gif\" width=\"16\" height=\"16\" />"+discuss_info.getDiscuss_username()+"</td>");
			sb.append("<td style=\"width:180px\" align=\"center\">"+National.parse(discuss_info.getDiscuss_ip())+"</td>");
			sb.append("<td style=\"width:180px\" align=\"right\">"+discuss_info.getDiscuss_time().substring(0,19)+"</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan=\"3\" align=\"left\">"+discuss_info.getDiscuss_commond()+"</td>");
			sb.append("</tr>");
		}
		}else{
			sb.append("<tr><td cal align=\"center\">暂无评论</td></tr>");
		}
		sb.append("</table>");
		out.write(sb.toString());
		out.close();
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

		doGet(request,response);
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
