package com.jeyoo.mapper;

import com.jeyoo.pojo.UserTicket;

public interface UserTicketMapper {
    int insert(UserTicket record);

    int insertSelective(UserTicket record);
}