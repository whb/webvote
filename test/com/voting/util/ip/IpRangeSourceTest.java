package com.voting.util.ip;

import com.voting.util.ip.IpRangeSource;

public class IpRangeSourceTest {
	public static void main(String[] args) {
		String resouceClasspathName = "ip.csv";

		IpRangeSource ipRangeSource = new IpRangeSource(resouceClasspathName);
		String description = ipRangeSource.query("194.208.69.1");
		System.out.println(description);    // 194.208.69.0	194.208.69.255	列支敦士登  


		System.out.println(ipRangeSource.query("218.200.194.106")); //218.200.194.106	218.200.194.106	四川省攀枝花市 攀枝花学院机房2楼

		System.out.println(ipRangeSource.query("144.193.255.255")); //144.193.0.0	144.193.255.255	荷兰  

		System.out.println(ipRangeSource.query("218.22.233.155")); //218.22.233.155	218.22.234.34	安徽省淮北市
		
		System.out.println(ipRangeSource.query("203.23.233.155")); //203.0.0.0,203.063.255.255,澳大利亚
		System.out.println(ipRangeSource.query("10.196.221.23"));  //010.196.221.0,010.196.221.255,新疆
		System.out.println(ipRangeSource.query("210.81.20.10")); //210.081.0.0,210.081.031.255,日本
	}
	
	
}
