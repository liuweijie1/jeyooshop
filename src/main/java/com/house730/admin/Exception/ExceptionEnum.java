package com.house730.admin.Exception;



import lombok.Getter;

@Getter
public enum ExceptionEnum {

    FILE_UPLOAD_ERROR(500, "文件上传异常"),
    INVALID_FILE_TYPE(400, "无效的文件类型"),
    SERVER_ERROR(500, "服务器异常"),
    BAD_REQUEST(400, "参数异常"),
    DATA_TYPE_ERROR(400, "数据类型错误"),
    INVALID_UN_OR_PW(400, "账号&密码不存在或者数据错误"),
    TOKEN_ERROR(400, "token解析错误"),
    
    ORDER_NOT_FOUND(404,"订单找不到" ),
    ORDERID_NOT_FOUND(404,"订单編號找不到" ),
    ORDER_UPDATE_ERROR(500,"订单更新失败" ),
    
    DATA_PARSE_FAIL(500,"时间转换错误"),
	USAGE_RECORD_UPDATE_ERROR(500,"储值屋币记录失败" ),
	PROPERTY_UPDATE_ERROR(500,"放盤下架失败" ),
	PROPERTY_APPROVAL_ERROR(500,"放盤審核失敗" ),
	PROPERTY_APPROVAL_NOPAMENT_ERROR(500,"樓盤未付款" ),
	PROPERTY_APPROVAL_BUILD_ERROR(500,"請選擇自建盤" ),
	PROPERTY_UNDER_APPROVAL_ERROR(500,"該樓盤已審核" ),
	PROPERTY_COINSET_INSERT_ERROR(500,"屋幣配置創建失敗"),
	PROPERTY_COINSET_LOWER_ERROR(500,"屋幣配置下架失败"),
	LABEL_MANAGE_NOT_FOUND(404,"標籤找不到" ),
	USER_LOGIN_OVERTIME(500,"登錄超時" ),
	USER_DEPARTMENT_COINSET_UPDATE_ERROR(500,"部門屋幣量更新失敗"),
	USER_AGENT_INFO_UPDATE_ERROR(500,"代理公司信息更新失敗"),
	TRADE_PROPERTY_ORDER_UPDATE_ERROR(500,"房源訂單儲值失敗"),
	ADD_ACCOUNT_EMAIL_REPEAT_ERROR(505,"賬戶登錄電郵重複"),
	REQUEST_SENDMASSGE_ERROR(505,"推送接口返回异常"),
	LABEL_COUNT_ERROR(500,"每個類型最多添加50條標簽詞，請刪除後再添加"),
	USER_NOTFOUND_ERROR(500,"該用戶不存在" );
	
    //定义成员变量
    private String message;
    private int status;
    //构造函数

    ExceptionEnum(int status, String message) {
        this.message = message;
        this.status = status;
    }
}
