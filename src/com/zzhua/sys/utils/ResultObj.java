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
    public static final ResultObj CHECK_TRUE_IDENTITY = new ResultObj(SysContast.CODE_ERROR, SysContast.IDENTITY_TRUE);
    public static final ResultObj CHECK_FALSE_IDENTITY = new ResultObj(SysContast.CODE_SUCCESS, SysContast.IDENTITY_FALSE);
    public static final ResultObj NOT_EMPTY_IDENTITY = new ResultObj(SysContast.CODE_ERROR, SysContast.NOT_EMPTY_IDENTITY);;
    public static final ResultObj SERVER_ERROR = new ResultObj(SysContast.CODE_ERROR, SysContast.SERVER_ERROR);
    public static final ResultObj CHECK_TRUE_RENTID = new ResultObj(SysContast.CODE_SUCCESS, SysContast.RENTID_TRUE);
    public static final ResultObj CHECK_FALSE_RENTID = new ResultObj(SysContast.CODE_ERROR, SysContast.RENTID_FALSE);
    public static final ResultObj RENT_FINISH_TRUE = new ResultObj(SysContast.CODE_ONE, SysContast.RENT_FINISH_TRUE);;
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
