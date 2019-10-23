package com.house730.admin.service;

import com.github.pagehelper.PageInfo;
import com.house730.admin.pojo.User;
import com.house730.admin.pojo.UserLeaveMessage;
import com.house730.admin.requestSearch.LeaveMessageSearch;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface LeaveMessage {

   PageInfo<Map<String,Object>> selectLeaveMessage(Map<String,Object> parmMap);

    void downLeaveMessage(Map<String,Object> parmMap, HttpServletResponse response);
}
