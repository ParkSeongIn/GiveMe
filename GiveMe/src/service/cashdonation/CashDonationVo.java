package service.cashdonation;

import java.sql.Date;
import java.sql.Timestamp;

public class CashDonationVo {

	private int cidx;
	private String cway;
	private int cmoney;
	private String creceipt;
	private int cpaydate1;
	private Date cpaydate2;
	private String cpay;
	private String cstate;
	private int cpoint;
	private Timestamp cdbdate;
	private String capst;
	private int midx;
	private int dlidx;
	
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getCway() {
		return cway;
	}
	public void setCway(String cway) {
		this.cway = cway;
	}
	public int getCmoney() {
		return cmoney;
	}
	public void setCmoney(int cmoney) {
		this.cmoney = cmoney;
	}
	public String getCreceipt() {
		return creceipt;
	}
	public void setCreceipt(String creceipt) {
		this.creceipt = creceipt;
	}
	public int getCpaydate1() {
		return cpaydate1;
	}
	public void setCpaydate1(int cpaydate1) {
		this.cpaydate1 = cpaydate1;
	}
	public Date getCpaydate2() {
		return cpaydate2;
	}
	public void setCpaydate2(Date cpaydate2) {
		this.cpaydate2 = cpaydate2;
	}
	public String getCpay() {
		return cpay;
	}
	public void setCpay(String cpay) {
		this.cpay = cpay;
	}
	public String getCstate() {
		return cstate;
	}
	public void setCstate(String cstate) {
		this.cstate = cstate;
	}
	public int getCpoint() {
		return cpoint;
	}
	public void setCpoint(int cpoint) {
		this.cpoint = cpoint;
	}
	public Timestamp getCdbdate() {
		return cdbdate;
	}
	public void setCdbdate(Timestamp cdbdate) {
		this.cdbdate = cdbdate;
	}
	public String getCapst() {
		return capst;
	}
	public void setCapst(String capst) {
		this.capst = capst;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getDlidx() {
		return dlidx;
	}
	public void setDlidx(int dlidx) {
		this.dlidx = dlidx;
	}
	
	
}
