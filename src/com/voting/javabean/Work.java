package com.voting.javabean;

import java.util.Date;

import com.voting.util.Constant;

public class Work {
	private int workId;
	private String workTitle;
	private String workAuthor;
	private String worksRecommond;
	private String workFileName;
	private Date workReleaseTime;
	private int voteCount;
	private boolean readyVoted;
	private String preViewUrl;
	private String workType;

	public String getImageUrl() {
		String prefix = Constant.WORK_TYPE_JPG.equals(getWorkType()) ? Constant.JPG_SMALL_PATH
				: Constant.FLV_SMALL_PATH;
		return prefix + getWorkFileName();
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public boolean isReadyVoted() {
		return readyVoted;
	}

	public void setReadyVoted(boolean readyVoted) {
		this.readyVoted = readyVoted;
	}

	public int getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public String getWorkAuthor() {
		return workAuthor;
	}

	public void setWorkAuthor(String workAuthor) {
		this.workAuthor = workAuthor;
	}

	public String getWorkFileName() {
		return workFileName;
	}

	public void setWorkFileName(String workFileName) {
		this.workFileName = workFileName;
	}

	public Date getWorkReleaseTime() {
		return workReleaseTime;
	}

	public void setWorkReleaseTime(Date workReleaseTime) {
		this.workReleaseTime = workReleaseTime;
	}

	public String getPreViewUrl() {
		return preViewUrl;
	}

	public void setPreViewUrl(String preViewUrl) {
		this.preViewUrl = preViewUrl;
	}

	public void setWorksRecommond(String worksRecommond) {
		this.worksRecommond = worksRecommond;
	}

	public String getWorksRecommond() {
		return worksRecommond;
	}

}
