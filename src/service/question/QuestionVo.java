package service.question;

import java.sql.Date;
import java.sql.Timestamp;

public class QuestionVo {

	private int qidx;
	private String qcategory;
	private String qtitle;
	private String qcontent;
	private Timestamp qwdate;
	private Timestamp qrewdate;
	private String qstate;
	private Date qmdate;
	private Timestamp qdbdate;
	private int qdeletest;
	private String qrecontent;
	private int midx;
	private String mid;
	
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
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Timestamp getQwdate() {
		return qwdate;
	}
	public void setQwdate(Timestamp qwdate) {
		this.qwdate = qwdate;
	}
	public Timestamp getQrewdate() {
		return qrewdate;
	}
	public void setQrewdate(Timestamp qrewdate) {
		this.qrewdate = qrewdate;
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
	public int getQdeletest() {
		return qdeletest;
	}
	public void setQdeletest(int qdeletest) {
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
