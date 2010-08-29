package com.voting.logic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.voting.dao.WorkDao;
import com.voting.javabean.Discuss;
import com.voting.javabean.Work;
import com.voting.util.Constant;

public class WorksOperate {
	private WorkDao workDao;
	
	public void setWorkDao(WorkDao workDao) {
		this.workDao = workDao;
	}

	public List<Work> findWorks(String flag, String prePageNo, HashMap<String, String>map) {
		int pageSize = Constant.WORK_PAGE_SIZE;
		int startLineNo = getStartLineNo(prePageNo, pageSize);
		
		List<Work> worksList  = workDao.findWorks(flag, startLineNo, pageSize);
		if (Constant.WORK_TYPE_FLV.equals(flag)){
			for (int m = 0; m < worksList.size(); m++){
				Work work = worksList.get(m);
				List urlList = workDao.findVideoUrl(work.getWorkId());
				if (urlList.size() > 0){
					work.setVideoUrl(((Work)urlList.get(0)).getVideoUrl());
				}else{
					work.setVideoUrl("");
				}
			}
		}
		
		for (int i = 0; i < worksList.size(); i++){
			Work work = worksList.get(i);
			int workId = work.getWorkId();
			if (map != null && map.containsKey(String.valueOf(workId))){
				work.setReadyVoted(true);
			}
		}
		return worksList;
	}
	
	public int findTotalCount(String type) {
		int totalCount = workDao.findTotalCount(type);
		return totalCount;
	}
	
	
	public HashMap<Object, Object> saveCheckedWorks(HashMap<String, String> worksMap, String ip) {
		boolean fail = false;
		String msg;
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		if (worksMap == null || worksMap.size() == 0){
			//message?  no works to vote
			map.put("msg", "请选择投票作品");
			map.put("flag", fail);
		}else if(workDao.findVoteTime(ip) != 0){// check if the same ip vote again in 3 minute could not vote
			//message? step time < 3 minute wait next time
			map.put("msg", "您已投票，请等候3分钟方可继续投票");
			map.put("flag", fail);
		}else if (worksMap.size() > Constant.VOTE_WORKS_SIZE){
			//message? select to vote works more than 5
			map.put("msg", "您选择的作品超过5件");
			map.put("flag", fail);
		}else{
			int votedCount = workDao.saveVotes(worksMap, ip);
			if (votedCount == 0){
				//message insert fail
				map.put("msg", "投票失败");
				map.put("flag", fail);
			}else{
				//message insert success
				map.put("msg", "投票成功");
				map.put("flag", !fail);
			}
		}
		
		return map;
	}
	
	
	public HashMap<Object, Object> findWorkAndRecommondInfo(String workId) {
		HashMap<Object, Object> infos = new HashMap<Object, Object>();
		Work oneWork = workDao.findWork(workId);
		List<Discuss> discussList = workDao.findDisusses(workId);
		infos.put("oneWork", oneWork);
		infos.put("disusses", discussList);
		return infos;
	}

///////////////////method//////////////////////////////////////////////////////////////////	
	private int getStartLineNo(String prePageNo, int pageSize) {
		if (prePageNo != null){
			int preLineNo = Integer.valueOf(prePageNo).intValue()*pageSize;
			return preLineNo;
		}
		return 0;
	}

	public String saveDisuss(String workId, String username, String discussCommond) {
		String msg;
		int count = workDao.saveDisuss(workId, username, discussCommond);
		if (count != 0){
			msg = "评论成功";
		}else{
			msg = "评论失败";
		}
		return msg;
	}

	public List<Work> findTempWorks(Map<String, String> map) {
		List<Work> workList = new ArrayList<Work>();
		if (map == null) return workList;
		
		Iterator<String> it = map.keySet().iterator();

		while(it.hasNext()){
			Work work = workDao.findWork(it.next());
			workList.add(work);
		}
		return workList;
	}

}
