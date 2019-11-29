package com.jeyoo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jeyoo.mapper.UserLeaveMessageMapper;
import com.jeyoo.mapper.UserMapper;
import com.jeyoo.pojo.User;
import com.jeyoo.pojo.UserLeaveMessage;
import com.jeyoo.requestSearch.LeaveMessageSearch;
import com.jeyoo.resultpojo.UserExcel;
import com.jeyoo.service.LeaveMessage;
import com.jeyoo.utils.ExcelUtils;
import com.jeyoo.utils.StringResourceUtils;

import javafx.print.Collation;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class LeaveMessageImpl implements LeaveMessage {
    @Autowired
    private UserLeaveMessageMapper mapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public void downLeaveMessage(Map<String, Object> parmMap, HttpServletResponse response) {

    }

    //下載excel
   /* @Override
    public void downLeaveMessage(Map<String,Object> parmMap, HttpServletResponse response) {
        List<UserLeaveMessage> list = mapper.selectLeaveMessage(parmMap);
        //判断查询结果是否为空
        if (!list.isEmpty()) {
            List<Integer> idList = list.stream().map(UserLeaveMessage::getUserid).collect(Collectors.toList());
            //根据id查询的userCode
            List<User> userList = userMapper.queryByIdList(idList);
            //把usercode set进list集合中 返回给前台
            for (int i = 0; i < userList.size(); i++) {
                for (int j = 0; j < list.size(); j++) {
                    if (userList.get(i).getUserid().equals(list.get(j).getUserid())) {
                        //item is not usercode
                        list.get(j).setItem(userList.get(i).getUsercode());
                    }
                }
            }
            String[] title = new String[]{"會員編號", "留言來源", "留言內容", "留言日期"};
            String[][] values = new String[list.size()][];
            for (int i = 0; i < list.size(); i++) {
                values[i] = new String[title.length];
                UserLeaveMessage userExcel = list.get(i);
                values[i][0] = userExcel.getItem() == null ? "" : userExcel.getItem();
                values[i][1] = userExcel.getSource() == null ? "" : userExcel.getSource();
                values[i][2] = userExcel.getLeavemessage() == null ? "" : userExcel.getLeavemessage();
                values[i][3] = userExcel.getCreatetime() == null ? "" : new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(userExcel.getCreatetime());
            }
            SimpleDateFormat df = new SimpleDateFormat(StringResourceUtils.DFTYPETEXT);//设置日期格式
            HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(df.format(new Date()), title, values, null);
            ExcelUtils.closeOutputStream(response, "留言详情", wb);
        } else {
            String[] title = new String[]{"暫無數據"};
            String[][] values = new String[1][];
            values[0] = new String[title.length];
            values[0][0] = "當前查詢條件沒有數據";
            SimpleDateFormat df = new SimpleDateFormat(StringResourceUtils.DFTYPETEXT);//设置日期格式
            HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(df.format(new Date()), title, values, null);
            ExcelUtils.closeOutputStream(response, "留言详情", wb);


        }
    }
*/
    @Override
    public PageInfo<Map<String, Object>> selectLeaveMessage(Map<String, Object> paramMap) {
        PageInfo<Map<String, Object>> pageInfo = null;
        if (null != paramMap) {

            //获取参数
            Integer pno = Integer.parseInt(String.valueOf(paramMap.get("page")));
            Integer pageSize = Integer.parseInt(String.valueOf(paramMap.get("limit")));
            PageHelper.startPage(pno, pageSize);
            List<Map<String, Object>> userLeaveMessageList = mapper.selectLeaveMessage(paramMap);
            pageInfo = new PageInfo<Map<String, Object>>(userLeaveMessageList);
        }
        return pageInfo;
    }
}
