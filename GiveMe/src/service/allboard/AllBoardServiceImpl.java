package service.allboard;

import java.util.ArrayList;

import common.DBConnect;

public class AllBoardServiceImpl implements AllBoardService{

    DBConnect dbconnect = null; //dbconnect 값을 초기화함.
    String sql="";	//sql 값을 공백으로 설정.
    
    public AllBoardServiceImpl(){
	dbconnect = new DBConnect();	//dbconnect 객체를 생성 dbconnect 찾는 곳이 있으면 객체를 생성해서 사용하겠다는 것
    }
    
    
    @Override
    public AllBoardVo getAllBoard() {
	// TODO Auto-generated method stub
	return null;
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

    
    
}
