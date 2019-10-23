package com.house730.admin.mapper;

import com.house730.admin.pojo.UserLeaveMessage;
import com.house730.admin.requestSearch.LeaveMessageSearch;

import java.util.List;
import java.util.Map;

public interface UserLeaveMessageMapper {

    List<Map<String,Object>> selectLeaveMessage(Map<String,Object> paramMap);

}