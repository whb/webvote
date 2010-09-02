package com.voting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.voting.javabean.Discuss;
import com.voting.javabean.Work;

public class WorksOperate {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		WorkDao workDao = (WorkDao) context.getBean("workDao");
		/*
		 * List<Work> workData = workDao.findWorks("jpg", 1, 10);
		 * 
		 * System.out.println("workDataList size:  "+ workData.size());
		 */
		int count = workDao.findVoteTime("234");
		System.out.println("count: " + count);

		Map<Object, Object> map = new HashMap<Object, Object>();
		String[] ids = { "1", "6", "8", "9", "10" };
		String ip = "255.255.255.255";
		map.put("votedWorkIds", ids);
		map.put("ip", ip);
		/*count = workDao.saveVotes(map);
		System.out.println(count);*/

		/*Work oneWork = workDao.findWork("jpg", "3");
		List<Discuss> recommondList = workDao.findDisusses("3");
		
		System.out.println(oneWork.getWorkFileName());
		
		System.out.println(recommondList.size());*/
		
/*		workDao.saveDisuss("3","测试评论测试评论3");
		workDao.saveDisuss("4","测试评论测试评论4");*/
		
	}
}
