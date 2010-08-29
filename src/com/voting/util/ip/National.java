package com.voting.util.ip;

public class National {
	private static IpRangeSource ipRangeSource;
	static {
		String ipClasspathName = "ip.csv";
		ipRangeSource = new IpRangeSource(ipClasspathName);
	}

	public static String parse(String discussIp) {
		return ipRangeSource.query(discussIp);
	}

}
