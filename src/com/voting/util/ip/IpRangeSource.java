package com.voting.util.ip;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class IpRangeSource {
	private List<IpRange> ipRanges = new ArrayList<IpRange>();

	public IpRangeSource(String resouceClasspathName) {
		try {
			URL url = Thread.currentThread().getContextClassLoader()
					.getResource(resouceClasspathName);
			InputStream is = url.openStream();
			InputStreamReader in = new InputStreamReader(is, "GBK");
			BufferedReader br = new BufferedReader(in);

			String line;
			while ((line = br.readLine()) != null) {
				StringTokenizer st = new StringTokenizer(line, ",");
				IpRange ipRange = new IpRange();
				int tokenNumber = 0;
				while (st.hasMoreTokens()) {
					ipRange.setField(tokenNumber++, st.nextToken());
				}
				ipRanges.add(ipRange);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public String query(String ip) {
		for (int i = 0; i < ipRanges.size(); i++) {
			IpRange ipRange = ipRanges.get(i);
			if (ipRange.contain(ip)) {
				return ipRange.getDescription();
			}
		}
		return "未知位置";
	}
}
