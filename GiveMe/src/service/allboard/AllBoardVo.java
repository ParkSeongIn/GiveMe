package service.allboard;

import java.sql.Date;
import java.sql.Timestamp;

public class AllBoardVo {

	private String abtype;
	private int abidx;
	private String abtitle;
	private int abhit;
	private Date abwdate;
	private String abcontent;
	private String abimage;
	private Date abmdate;
	private Timestamp abdbdate;
	private String abdeletest;
	private int midx;
	private String fileFullPath;
	
	public String getAbtype() {
		return abtype;
	}
	public void setAbtype(String abtype) {
		this.abtype = abtype;
	}
	public int getAbidx() {
		return abidx;
	}
	public void setAbidx(int abidx) {
		this.abidx = abidx;
	}
	public String getAbtitle() {
		return abtitle;
	}
	public void setAbtitle(String abtitle) {
		this.abtitle = abtitle;
	}
	public int getAbhit() {
		return abhit;
	}
	public void setAbhit(int abhit) {
		this.abhit = abhit;
	}
	public Date getAbwdate() {
		return abwdate;
	}
	public void setAbwdate(Date abwdate) {
		this.abwdate = abwdate;
	}
	public String getAbcontent() {
		return abcontent;
	}
	public void setAbcontent(String abcontent) {
		this.abcontent = abcontent;
	}
	public String getAbimage() {
		return abimage;
	}
	public void setAbimage(String abimage) {
		this.abimage = abimage;
	}
	public Date getAbmdate() {
		return abmdate;
	}
	public void setAbmdate(Date abmdate) {
		this.abmdate = abmdate;
	}
	public Timestamp getAbdbdate() {
		return abdbdate;
	}
	public void setAbdbdate(Timestamp abdbdate) {
		this.abdbdate = abdbdate;
	}
	public String getAbdeletest() {
		return abdeletest;
	}
	public void setAbdeletest(String abdeletest) {
		this.abdeletest = abdeletest;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getFileFullPath() {
		return fileFullPath;
	}
	public void setFileFullPath(String fileFullPath) {
		this.fileFullPath = fileFullPath;
	}
	
}
