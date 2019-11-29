package com.jeyoo.utils;


/**
 *  調用接口 -返回参数
 * @author wbqiutj
 * @2019年5月22日
 */
public class ResultDataF {
	private String code;
	
	private String message;
	
	private Boolean result;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Boolean getResult() {
		return result;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "ResultDataF [code=" + code + ", message=" + message + ", result=" + result + "]";
	}

	
}
