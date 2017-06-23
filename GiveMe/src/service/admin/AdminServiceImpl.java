package service.admin;

import java.sql.*; 
import java.util.ArrayList;

import common.DBConnect;
import service.allboard.AllBoardVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo; 


public class AdminServiceImpl implements AdminService{
    
    DBConnect dbconnect = null; //dbconnect 값을 초기화함.
    String sql="";	//sql 값을 공백으로 설정.
    
    public AdminServiceImpl(){	//생성자(클래스명과 동일하므로)
	dbconnect = new DBConnect();	//dbconnect 객체를 생성 dbconnect 찾는 곳이 있으면 객체를 생성해서 사용하겠다는 것 
    }

    
    @Override
    public ArrayList<MemberVo> getMemberList() {
	// TODO Auto-generated method stub
	
	
	return null;
    }

    @Override
    public int deleteMember() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public CashDonationVo getCashDonation() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int insertAllBoard() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public AllBoardVo modifyAllBoard() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int deleteAllBoard() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int insertDonationList() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public DonationListVo getDonationList() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public ArrayList<DonationListVo> getDonationListLine() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public DonationListVo modifyDonationList() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int deleteDonationList() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int getPaging() {
	// TODO Auto-generated method stub
	return 0;
    }
    
    
    

}
