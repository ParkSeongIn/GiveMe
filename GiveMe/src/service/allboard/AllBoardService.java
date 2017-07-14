package service.allboard;

import java.util.ArrayList;

public interface AllBoardService {

    AllBoardVo getAllBoard();
    ArrayList<AllBoardVo> getAllBoardList();
    int updateAllBoardHit();
    int getPaging();
}
