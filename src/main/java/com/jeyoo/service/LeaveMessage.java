package com.jeyoo.service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.User;
import com.jeyoo.pojo.UserLeaveMessage;
import com.jeyoo.requestSearch.LeaveMessageSearch;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface LeaveMessage {

   PageInfo<Map<String,Object>> selectLeaveMessage(Map<String,Object> parmMap);

    void downLeaveMessage(Map<String,Object> parmMap, HttpServletResponse response);
}
