package com.house730.admin.mapper;

import com.house730.admin.pojo.User;
import com.house730.admin.pojo.UserOptionInfo;
import com.house730.admin.requestSearch.UserSearch;
import com.house730.admin.resultpojo.UserExcel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int insert(User record);

    int insertSelective(User record);

    List<User> query(Map<String,Object> paramMap);
    //查询会员详情
    User queryDetail(@Param("userid") Integer userid);

    UserOptionInfo queryByStatus(Integer userid);

    Integer updateStatus(@Param("id")Integer id,@Param("status")String status);

    Integer insertUserOptionInfo(@Param("id")Integer id, @Param("status") String status,@Param("empid") String empid,@Param("detail")String detail);

    Integer queryIdByuserCode(@Param("usercode")String usercode);
    //根据会员id查询查封解封理由
    String queryReasonByUserid(@Param("userid")Integer userid);

    Integer checkapproval(@Param("userid") Integer userid, @Param("status") String status);

    Integer changesore(@Param("useid") Integer userid, @Param("score") Integer score);

    //根据userid集合查询usercode集合
    List<User> queryByIdList(List<Integer> idList);
    //下载Excel表格
    List<UserExcel> downExcel(UserSearch search);
    
    int changePropertycoin(User user);
    
    Map<String,Object> querydetailAll(@Param("userid") Integer userid);
}