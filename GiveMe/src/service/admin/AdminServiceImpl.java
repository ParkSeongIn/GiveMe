package service.admin;

import java.sql.*; 
import java.util.ArrayList;

import common.DBConnect;
import service.allboard.AllBoardVo;
import service.cashdonation.CashDonationVo;
import service.member.MemberVo; 


public class AdminServiceImpl implements AdminService{
    
    DBConnect dbconnect = null; //dbconnect ���� �ʱ�ȭ��.
    String sql="";	//sql ���� �������� ����.
    
    public AdminServiceImpl(){	//������(Ŭ������� �����ϹǷ�)
	dbconnect = new DBConnect();	//dbconnect ��ü�� ���� dbconnect ã�� ���� ������ ��ü�� �����ؼ� ����ϰڴٴ� �� 
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
