package com.house730.admin.mapper;

import com.house730.admin.pojo.UserTicket;

public interface UserTicketMapper {
    int insert(UserTicket record);

    int insertSelective(UserTicket record);
}