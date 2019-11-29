package com.jeyoo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.jeyoo.pojo.SysPropertyCoinset;

public interface SysPropertyCoinsetMapper {
    int insert(SysPropertyCoinset coinset);

    int insertSelective(SysPropertyCoinset coinset);
    
    List<SysPropertyCoinset> findCoinsetPage(Map<String, Object> paramMap);
    
    int upOrDownCoinset(SysPropertyCoinset coinset);
    
    SysPropertyCoinset findCoinsetBySetId(@Param("setid") Integer setid);
}