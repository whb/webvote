package com.voting.util;

import java.text.SimpleDateFormat;

public class Constant {
	public static final int WORK_PAGE_SIZE = 3;
	public static final int VOTE_WORKS_SIZE = 5;

	public static final String WORK_TYPE_JPG = "jpg";
	public static final String WORK_TYPE_FLV = "flv";
	public static final String JPG_SMALL_PATH = "image/small/jpg/";
	public static final String FLV_SMALL_PATH = "image/small/flv/";

	public static final String START_DATE = "2010-08-10";
	public static final String END_DATE = "2010-10-10";
	public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(
			"yyyy-MM-dd");
	public static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
}
