package com.voting.javabean;

import java.util.Date;

public class Vote {
	private int votIid;
	private String worksId;
	private String voteIp;
	private Date voteTime;
	
	public int getVotIid() {
		return votIid;
	}
	public void setVotIid(int votIid) {
		this.votIid = votIid;
	}
	public String getWorksId() {
		return worksId;
	}
	public void setWorksId(String worksId) {
		this.worksId = worksId;
	}
	public String getVoteIp() {
		return voteIp;
	}
	public void setVoteIp(String voteIp) {
		this.voteIp = voteIp;
	}
	public Date getVoteTime() {
		return voteTime;
	}
	public void setVoteTime(Date voteTime) {
		this.voteTime = voteTime;
	}
	

}
