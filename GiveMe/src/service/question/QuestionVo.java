package service.question;

import java.sql.Date;
import java.sql.Timestamp;

public class QuestionVo {

	private int qidx;
	private String qcategory;
	private String qtitle;
	private String qcontnet;
	private Date qwdate;
	private String qstate;
	private Date qmdate;
	private Timestamp qdbdate;
	private String qdeletest;
	private String qrecontent;
	private int midx;
	
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getQcategory() {
		return qcategory;
	}
	public void setQcategory(String qcategory) {
		this.qcategory = qcategory;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontnet() {
		return qcontnet;
	}
	public void setQcontnet(String qcontnet) {
		this.qcontnet = qcontnet;
	}
	public Date getQwdate() {
		return qwdate;
	}
	public void setQwdate(Date qwdate) {
		this.qwdate = qwdate;
	}
	public String getQstate() {
		return qstate;
	}
	public void setQstate(String qstate) {
		this.qstate = qstate;
	}
	public Date getQmdate() {
		return qmdate;
	}
	public void setQmdate(Date qmdate) {
		this.qmdate = qmdate;
	}
	public Timestamp getQdbdate() {
		return qdbdate;
	}
	public void setQdbdate(Timestamp qdbdate) {
		this.qdbdate = qdbdate;
	}
	public String getQdeletest() {
		return qdeletest;
	}
	public void setQdeletest(String qdeletest) {
		this.qdeletest = qdeletest;
	}
	public String getQrecontent() {
		return qrecontent;
	}
	public void setQrecontent(String qrecontent) {
		this.qrecontent = qrecontent;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	
}
