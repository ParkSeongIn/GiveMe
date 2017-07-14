package service.allpay;

import java.sql.Date;
import java.sql.Timestamp;

public class AllPayVo {

	private int apidx;
	private Date aptoday;
	private String apstate;
	private Timestamp apdbdate;
	private Date apwdate;
	private int midx;
	private int cidx;
	
	public int getApidx() {
		return apidx;
	}
	public void setApidx(int apidx) {
		this.apidx = apidx;
	}
	public Date getAptoday() {
		return aptoday;
	}
	public void setAptoday(Date aptoday) {
		this.aptoday = aptoday;
	}
	public String getApstate() {
		return apstate;
	}
	public void setApstate(String apstate) {
		this.apstate = apstate;
	}
	public Timestamp getApdbdate() {
		return apdbdate;
	}
	public void setApdbdate(Timestamp apdbdate) {
		this.apdbdate = apdbdate;
	}
	public Date getApwdate() {
		return apwdate;
	}
	public void setApwdate(Date apwdate) {
		this.apwdate = apwdate;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	
}