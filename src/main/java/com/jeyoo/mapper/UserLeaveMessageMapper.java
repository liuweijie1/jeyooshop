package com.jeyoo.mapper;

import com.jeyoo.pojo.UserLeaveMessage;
import com.jeyoo.requestSearch.LeaveMessageSearch;

import java.util.List;
import java.util.Map;

public interface UserLeaveMessageMapper {

    List<Map<String,Object>> selectLeaveMessage(Map<String,Object> paramMap);

}