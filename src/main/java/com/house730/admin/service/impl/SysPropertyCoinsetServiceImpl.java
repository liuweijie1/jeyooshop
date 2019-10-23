package com.house730.admin.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.mapper.SysPropertyCoinsetMapper;
import com.house730.admin.pojo.SysPropertyCoinset;
import com.house730.admin.service.ISysPropertyCoinsetService;

/**
 * 屋幣儲值
 * @author wbqiutj
 *	2019年4月20日
 */
@Service(value = "sysPropertyCoinsetService")
public class SysPropertyCoinsetServiceImpl implements ISysPropertyCoinsetService{
	
	@Autowired
	public SysPropertyCoinsetMapper sysPropertyCoinsetMapper;
	
	@Override
	public PageInfo<SysPropertyCoinset> findCoinsetPage(Map<String, Object> paramMap) {
		PageInfo<SysPropertyCoinset> pageInfo = null;
		if(null != paramMap) {
			try {
				//获取参数
				Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
				Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
				PageHelper.startPage(pno, pageSize);
				
				List<SysPropertyCoinset> list = sysPropertyCoinsetMapper.findCoinsetPage(paramMap);
				pageInfo = new PageInfo<SysPropertyCoinset>(list);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return pageInfo;
	}

	@Transactional
	@Override
	public int insertCoinset(List<SysPropertyCoinset> coinset) {
		if(null != coinset) {
			for (int i = 0; i < coinset.size(); i++) {
				if(null == coinset.get(i))return 0;
				coinset.get(i).setCreatetime(new Date());
				coinset.get(i).setUpdatetime(new Date());
				coinset.get(i).setIsshow(true);
				coinset.get(i).setDiscount(1f);
				coinset.get(i).setUpdateuser("");
				coinset.get(i).setCreateuser("");
				int num = sysPropertyCoinsetMapper.insertSelective(coinset.get(i));
				if(num == 0) {
					throw new HouseException(ExceptionEnum.PROPERTY_COINSET_INSERT_ERROR);
				}
			}
		}
		return 0;
	}

	@Override
	public void upOrDownCoinset(Integer setid) {
		if(null == setid) throw new HouseException(ExceptionEnum.BAD_REQUEST);
		SysPropertyCoinset coinset = sysPropertyCoinsetMapper.findCoinsetBySetId(setid);
		if(null != coinset) {
			coinset.setIsshow(false);
			int num = sysPropertyCoinsetMapper.upOrDownCoinset(coinset);
			if(num == 0) {
				throw new HouseException(ExceptionEnum.PROPERTY_COINSET_LOWER_ERROR);
			}
		}
	}

	

}
