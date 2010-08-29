package com.voting.util;

import java.text.ParseException;
import java.util.Date;

public class VotePeriod {
	private Date startDate;
	private Date endDate;

	public VotePeriod() {
		try {
			startDate = Constant.DATE_FORMAT.parse(Constant.START_DATE);
			endDate = Constant.DATE_FORMAT.parse(Constant.END_DATE);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	public boolean isActive() {
		Date date = new Date();
		return (date.after(startDate) && date.before(endDate));
	}
}
