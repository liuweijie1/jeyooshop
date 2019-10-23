package com.house730.admin.vo;


import com.house730.admin.Exception.HouseException;
import lombok.Data;
import lombok.Getter;
import org.joda.time.DateTime;

/**
 * vo:view Object 视图对象 专门返回给页面的视图
 */
@Data
public class ExceptionResult {
    private String message;
    private int status;
    private String timeStamp;

    public ExceptionResult(HouseException e) {
        this.status = e.getStatus();
        this.message = e.getMessage();
        this.timeStamp = DateTime.now().toString("yyyy-MM-dd"); //导入joda-time依赖，用这个来获取时间戳
    }
}
