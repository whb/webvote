package com.voting.util.ip;

public class IpRange {
	private Ip startIp;
	private Ip endIp;
	private String description;

	public void setField(int i, String nextToken) {
		if (i == 0)
			startIp = new Ip(nextToken);
		else if (i == 1)
			endIp = new Ip(nextToken);
		else
			description = nextToken;
	}

	public boolean contain(String ipString) {
		Ip ip = new Ip(ipString);
		if (ip.compareTo(startIp) >= 0 && ip.compareTo(endIp) <= 0)
			return true;
		else
			return false;
	}

	public String getDescription() {
		return description == null ? "未知位置" : description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
