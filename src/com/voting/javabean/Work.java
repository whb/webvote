package com.voting.javabean;

import java.util.Date;

public class Work {
	private int workId;
	private String workTitle;
	private String workAuthor;
	private String worksRecommond;
	private String workFileName;
	private Date workReleaseTime;
	private int voteCount;
	private boolean readyVoted;
	private String videoUrl;
	private String imageUrl;
	private String workType;

	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public void setWorksRecommond(String worksRecommond) {
		this.worksRecommond = worksRecommond;
	}

	public String getWorksRecommond() {
		return worksRecommond;
	}
	
	
}
