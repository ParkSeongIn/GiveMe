package service.admin;

import java.sql.Date;
import java.sql.Timestamp;

public class DonationListVo {

	private int dlidx;
	private String dlgroup1;
	private String dlgroup2;
	private String dlplace;
	private String dlarea;
	private Date dlwdate;
	private String dlimage;
	private String dlcontent;
	private Date dlmdate;
	private Timestamp dldbdate;
	private int midx;
	
	public int getDlidx() {
		return dlidx;
	}
	public void setDlidx(int dlidx) {
		this.dlidx = dlidx;
	}
	public String getDlgroup1() {
		return dlgroup1;
	}
	public void setDlgroup1(String dlgroup1) {
		this.dlgroup1 = dlgroup1;
	}
	public String getDlgroup2() {
		return dlgroup2;
	}
	public void setDlgroup2(String dlgroup2) {
		this.dlgroup2 = dlgroup2;
	}
	public String getDlplace() {
		return dlplace;
	}
	public void setDlplace(String dlplace) {
		this.dlplace = dlplace;
	}
	public String getDlarea() {
		return dlarea;
	}
	public void setDlarea(String dlarea) {
		this.dlarea = dlarea;
	}
	public Date getDlwdate() {
		return dlwdate;
	}
	public void setDlwdate(Date dlwdate) {
		this.dlwdate = dlwdate;
	}
	public String getDlimage() {
		return dlimage;
	}
	public void setDlimage(String dlimage) {
		this.dlimage = dlimage;
	}
	public String getDlcontent() {
		return dlcontent;
	}
	public void setDlcontent(String dlcontent) {
		this.dlcontent = dlcontent;
	}
	public Date getDlmdate() {
		return dlmdate;
	}
	public void setDlmdate(Date dlmdate) {
		this.dlmdate = dlmdate;
	}
	public Timestamp getDldbdate() {
		return dldbdate;
	}
	public void setDldbdate(Timestamp dldbdate) {
		this.dldbdate = dldbdate;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	
}
