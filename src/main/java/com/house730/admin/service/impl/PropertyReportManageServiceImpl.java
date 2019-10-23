package com.house730.admin.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.mapper.PropertyReportMapper;
import com.house730.admin.pojo.PropertyReport;
import com.house730.admin.pojo.User;
import com.house730.admin.requestSearch.UserSearch;
import com.house730.admin.service.PropertyReportManageService;
import com.house730.admin.utils.ExcelUtils;
import com.house730.admin.utils.StringResourceUtils;
@Service("PropertyReportManageService")
public class PropertyReportManageServiceImpl implements PropertyReportManageService {
	
	@Autowired
	private PropertyReportMapper propertyReportMapper;
	
	
	@Override
	public PageInfo<PropertyReport>  findPropertyReport(Map<String, String> paramMap) {
		//如果是第一进入页面，默认第一页
		//获取参数
		Integer pageNum=Integer.parseInt(paramMap.get("page"));
		Integer pageSize=Integer.parseInt(paramMap.get("limit"));
		//1、设置分页信息，包括当前页数和每页显示的总计数
		PageHelper.startPage(pageNum, pageSize);
		//2、分页查询
    	List<PropertyReport> propertyReportList=propertyReportMapper.queryPropertyReportList(paramMap);
    	//3、包装分页数据
    	PageInfo<PropertyReport> pagelist= new PageInfo<PropertyReport>(propertyReportList);
    	
		return pagelist;
	}
	
	
	
	//下載Excel表格
    @Override
    public void downExcel(Map<String,String> search, HttpServletResponse response) {
        //条件查询结果
        List<PropertyReport> list=propertyReportMapper.queryPropertyReportList(search);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        //判断查询结果是否为空
        if (!list.isEmpty()) {
            String []title = new String[]{ "樓盤編號", "檢舉渠道", "檢舉內容", "檢舉時間"};
            String [][]values = new String[list.size()][];
            for (int i = 0; i < list.size(); i++) {
                values[i] = new String[title.length];
                PropertyReport uis = list.get(i);
                values[i][0]=uis.getPropertyid()==null?"":uis.getPropertyid().toString();
                values[i][1]=uis.getSource()==null?"":uis.getSource();
                /*if( uis.getSource()==null){
                    values[i][1] = "";
                }else if("1".equals(uis.getSource())){
                    values[i][1]="官網";
                }else if("2".equals(uis.getSource())){
                    values[i][1]="APP";
                }else if("3".equals(uis.getSource())){
                    values[i][1]="WAP";
                }*/
                values[i][2]=uis.getContent()==null?"":uis.getContent();
                if (uis.getCreatetime() == null) {
                    values[i][3] = "";
                }else{
                    String format = sdf.format(uis.getCreatetime());
                    values[i][3] = format;
                }
                
            }
            SimpleDateFormat df = new SimpleDateFormat(StringResourceUtils.DFTYPETEXT);//设置日期格式
            HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(df.format(new Date()), title, values, null);
            ExcelUtils.closeOutputStream(response, "檢舉列表", wb);
                    
            }else {
                String[] title = new String[]{"暫無數據"};
                String[][] values = new String[1][];
                values[0] = new String[title.length];
                values[0][0] = "當前查詢條件沒有數據";
                SimpleDateFormat df = new SimpleDateFormat(StringResourceUtils.DFTYPETEXT);//设置日期格式
                HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(df.format(new Date()), title, values, null);
                ExcelUtils.closeOutputStream(response, "檢舉列表", wb);



        }

    }




}
