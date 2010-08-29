package com.voting.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.voting.javabean.Work;
import com.voting.logic.WorksOperate;
import com.voting.util.CommonTool;
import com.voting.util.Constant;
import com.voting.util.VotePeriod;

public class WorkVoteServlet extends HttpServlet {
	WebApplicationContext applicationContext;
	WorksOperate workOperate;
	VotePeriod votePeriod;

	private static final long serialVersionUID = -2731450177616406834L;

	@Override
	public void init() throws ServletException {
		applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(getServletContext());
		workOperate = (WorksOperate) applicationContext.getBean("workOperate");
		votePeriod = new VotePeriod();
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		HttpSession session =  request.getSession();
		request.setAttribute("votePeriod", votePeriod);

		if ("vote".equals(method)) {//投票
			
			String remoteIp = CommonTool.getIpAddress(request);
			LinkedHashMap<String, String> votedWorkIdsMap = (LinkedHashMap<String, String>)session.getAttribute("jpgVoteDatas");

			HashMap<Object, Object> map = workOperate.saveCheckedWorks(votedWorkIdsMap, remoteIp);
			boolean insertFlay = (Boolean)map.get("flag");
			if (insertFlay == true) {
				String prePageNo = request.getParameter("pageNo");
				String workType = getWorkType(request, session);
				
				List<Work> works = workOperate.findWorks(workType, prePageNo, votedWorkIdsMap);
				request.setAttribute("works", works);
			}
			
			response.setCharacterEncoding("utf-8");
			PrintWriter writer = response.getWriter();
			writer.write((String)map.get("msg"));
		} else if ("templateSaveVotes".equals(method)){//添加选择的作品
			LinkedHashMap<String, String> voteWorkIds = (LinkedHashMap<String, String>)session.getAttribute("jpgVoteDatas");
			if (voteWorkIds == null) voteWorkIds = new LinkedHashMap<String, String>();
			voteWorkIds.put(request.getParameter("workId"),request.getParameter("workId"));
			session.setAttribute("jpgVoteDatas", voteWorkIds);
			System.out.println(((LinkedHashMap<String, String>)session.getAttribute("jpgVoteDatas")).size());
			
		}else if ("templateDeleteVotes".equals(method)){//删除选择的作品
			
			LinkedHashMap<String, String> workIdMap = (LinkedHashMap<String, String>)session.getAttribute("jpgVoteDatas");
			workIdMap.remove(request.getParameter("workId"));
			session.setAttribute("jpgVoteDatas", workIdMap);
			System.out.println(((LinkedHashMap<String, String>)session.getAttribute("jpgVoteDatas")).size());
			
		}else if ("goToDiscuss".equals(method)) {//到评论页面
			String workId = request.getParameter("workId");
			//String workType = getWorkType(request, session);

			HashMap<Object, Object> workAndRecommondInfo = 
				workOperate.findWorkAndRecommondInfo(workId);
			
			Work work = (Work)workAndRecommondInfo.get("oneWork");
			combineWorkImagePath(work);
			request.setAttribute("work", work);
			request.setAttribute("discussList", workAndRecommondInfo.get("disusses"));

			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/pages/discuss.jsp");
			requestDispatcher.forward(request, response);

		} else if ("discuss".equals(method)) {//评论
			String username = request.getParameter("username");
			String discussCommond = request.getParameter("discussCommond");
			String workId = request.getParameter("workId");
			
			String msg = workOperate.saveDisuss(workId, username, discussCommond);
			
			response.setCharacterEncoding("utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(msg);
			
		} else {// select jpg works as default\
			LinkedHashMap<String, String> map = (LinkedHashMap<String, String>)session.getAttribute("jpgVoteDatas");
			
			String workType = getWorkType(request, session);
			String prePageNo = getCurrentPageNo(request.getParameter("pageNo"));

			List<Work> articals = workOperate.findWorks(workType, prePageNo, map);
			combineWorkListImagePath(articals);
			
			int totalCount = workOperate.findTotalCount(workType);
			
			List<Work> simpleVoteWorks = workOperate.findTempWorks(map);
			combineWorkListImagePath(simpleVoteWorks);

			request.setAttribute("works", articals);
			request.setAttribute("pageSize", Constant.WORK_PAGE_SIZE);
			request.setAttribute("count", totalCount);
			request.setAttribute("currentNo", prePageNo);
			request.setAttribute("simpleWorks", simpleVoteWorks);
			request.setAttribute("workTypeValue", workType);
			
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/pages/workvote.jsp");
			requestDispatcher.forward(request, response);

		}
	}

	
	private void combineWorkListImagePath(List<Work> workList) {
		for(int i = 0; i < workList.size(); i++){
			String path;
			Work work = workList.get(i);
			combineWorkImagePath(work);
		}
	}

	private void combineWorkImagePath(Work work) {
		String path;
		if (Constant.WORK_TYPE_JPG.equals(work.getWorkType())){
			path = Constant.JPG_SMALL_PATH;
		}else{
			path = Constant.FLV_SMALL_PATH;
		}
		work.setImageUrl(path+work.getWorkFileName());
	}

	private String getWorkType(HttpServletRequest request, HttpSession session) {
		String workType = request.getParameter("workType");
		String seWorkType = (String)session.getAttribute("workType");
		if (seWorkType == null && workType == null){
			workType = Constant.WORK_TYPE_JPG;
			session.setAttribute("workType", workType);
		}else if (workType != null){
			session.setAttribute("workType", workType);
		}
		
		return (String)session.getAttribute("workType");
	}

	private String getCurrentPageNo(String pageNo) {
		if (pageNo == null) return "0";
		
		return pageNo;
	}
}
