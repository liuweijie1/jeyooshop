package com.jeyoo.Exception;


import lombok.Getter;

@Getter
public class JeyooException extends RuntimeException {//继承RuntimeException，添加构造方法，包含状态码status
    private int status;

    public JeyooException(ExceptionEnum em) {
        super(em.getMessage());
        this.status = em.getStatus();
    }

    public JeyooException(ExceptionEnum em, Throwable cause) {
        super(em.getMessage(), cause);
        this.status = em.getStatus();
    }
}
