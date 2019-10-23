package com.house730.admin.Exception;

import lombok.Getter;

@Getter
public class HouseException extends RuntimeException {//继承RuntimeException，添加构造方法，包含状态码status
    private int status;

    public HouseException(ExceptionEnum em) {
        super(em.getMessage());
        this.status = em.getStatus();
    }

    public HouseException(ExceptionEnum em, Throwable cause) {
        super(em.getMessage(), cause);
        this.status = em.getStatus();
    }
}
