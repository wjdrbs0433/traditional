package com.event;

public class ReplyDTO {
	private long replyNum;
	private long num;
	private String mid;
	private String mname;
	private String content;
	private String reg_date;
	private long answer;
	private int answerCount;
	
	public long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(long replyNum) {
		this.replyNum = replyNum;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public long getAnswer() {
		return answer;
	}
	public void setAnswer(long answer) {
		this.answer = answer;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	
	
}