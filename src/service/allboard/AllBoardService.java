package service.allboard;

import java.util.ArrayList;

public interface AllBoardService {

    AllBoardVo getAllBoard(int abidx);
    ArrayList<AllBoardVo> getAllBoardList(String abtype, String keyField, String keyWord);
    int updateAllBoardHit(int abidx);
    int getPaging(String abtype);
}
