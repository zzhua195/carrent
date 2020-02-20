package com.zzhua.sys.utils;

import com.zzhua.sys.constant.SysContast;

import java.io.Serializable;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/20
 * <p>
 * Description:
 */


public class ResultObj {

    public static final ResultObj STATUS_ERROR = new ResultObj((SysContast.CODE_ERROR));
    public static final ResultObj STATUS_TRUE = new ResultObj((SysContast.CODE_SUCCESS));
    private Integer code;
    private String msg;

    public static final ResultObj ADD_SUCCESS = new ResultObj(SysContast.CODE_SUCCESS,SysContast.ADD_SUCCESS);
    public static final ResultObj ADD_ERROR = new ResultObj(SysContast.CODE_ERROR,SysContast.ADD_ERROR);
    public static final ResultObj DELETE_SUCCESS = new ResultObj(SysContast.CODE_SUCCESS,SysContast.DELETE_SUCCESS);
    public static final ResultObj DELETE_ERROR = new ResultObj(SysContast.CODE_ERROR,SysContast.DELETE_ERROR);
    public static final ResultObj UPDATE_SUCCESS = new ResultObj(SysContast.CODE_SUCCESS,SysContast.UPDATE_SUCCESS);
    public static final ResultObj UPDATE_ERROR = new ResultObj(SysContast.CODE_ERROR,SysContast.UPDATE_SUCCESS);
    public static final ResultObj DISPATCHER_SUCCESS = new ResultObj(SysContast.CODE_SUCCESS,SysContast.DISPATCHER_SUCCESS);
    public static final ResultObj DISPATCHER_ERROR = new ResultObj(SysContast.CODE_ERROR,SysContast.ADD_ERROR);

    private ResultObj() {
    }

    private ResultObj(Integer code) {
        this.code = code;
    }

    private ResultObj(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
