package com.admin.statistic;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class VisitorListener implements HttpSessionListener {
	private StatisticDAO dao;

	public void sessionCreated(HttpSessionEvent arg0)  {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(c.getTime());
		dao = new StatisticDAO();
		if(dao.isToday(day)) {
			dao.updateStats(day);
		} else {
			VisitDTO dto = new VisitDTO();
			dto.setDay(day);
			dto.setCount(1);
			dao.insertStats(dto);
		}
	}

	public void sessionDestroyed(HttpSessionEvent arg0)  {
		// TODO Auto-generated method stub
	}

}

