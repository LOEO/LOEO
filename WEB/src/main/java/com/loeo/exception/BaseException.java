package com.loeo.exception;

/**
 * Created by LT on 2016/9/18 0018 22:55
 */
public class BaseException extends RuntimeException {
    public BaseException(String message) {
        super(message);
    }

    public BaseException(String message, Throwable cause) {
        super(message, cause);
    }
}
