package service.allboard;

import java.util.ArrayList;

import common.DBConnect;

public class AllBoardServiceImpl implements AllBoardService{

    DBConnect dbconnect = null; //dbconnect ���� �ʱ�ȭ��.
    String sql="";	//sql ���� �������� ����.
    
    public AllBoardServiceImpl(){
	dbconnect = new DBConnect();	//dbconnect ��ü�� ���� dbconnect ã�� ���� ������ ��ü�� �����ؼ� ����ϰڴٴ� ��
    }
    
    @Override
    public ArrayList<AllBoardVo> getAllBoardList() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int updateAllBoardHit() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int getPaging() {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public AllBoardVo getAllBoard() {
	// TODO Auto-generated method stub
	return null;
    }
    
}
