package com.voting.util.ip;

public class Ip {
	private int[] ips;

	public Ip(String ip) {
		String[] ipStrings = ip.split("\\.");
		ips = new int[ipStrings.length];
		for (int i = 0; i < ipStrings.length; i++) {		
			String dealedIp = removeIpHeadZero(ipStrings[i]);
			ips[i] = Integer.parseInt(dealedIp);
		}
	}

	private String removeIpHeadZero(String ip) {
		String noHeadIp = ip.trim();
		if (noHeadIp.length()>1 && noHeadIp.startsWith("0")){
			noHeadIp = noHeadIp.substring(1);
			removeIpHeadZero(noHeadIp);
		}
				
		return noHeadIp;
	}

	public int compareTo(Ip other) {
		for (int i = 0; i < ips.length; i++) {
			if (ips[i] > other.ips[i])
				return 1;
			else if (ips[i] < other.ips[i])
				return -1;
		}
		return 0;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < ips.length; i++) {
			sb.append(ips[i]);
			if (i < ips.length - 1)
				sb.append(".");
		}
		return sb.toString();
	}
}
