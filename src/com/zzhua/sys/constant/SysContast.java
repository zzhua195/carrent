package com.zzhua.sys.constant;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface SysContast {
    String USER_LOGIN_ERROR_MSG = "用户名或密码不正确";
    Integer AVAILABLE_TRUE = 1; //可用
    Integer AVAILABLE_FALSE = 0;//不可用
    Integer USER_TYPE_SUPER = 1;//超级用户
    Integer USER_TYPE_NORMAL = 2;//普通用户
    Integer SPREAD_TRUE = 1; //展开
    Integer MENU_TOP_ID = 1; //顶级菜单


    Integer CODE_SUCCESS = 0;//操作成功码
    Integer CODE_ERROR = -1 ;//操作失败码

    String ADD_SUCCESS = "添加成功";
    String ADD_ERROR = "添加失败";
    String DELETE_SUCCESS = "删除成功";
    String DELETE_ERROR = "删除失败";
    String UPDATE_SUCCESS = "修改成功";
    String UPDATE_ERROR = "修改失败";
    String DISPATCHER_SUCCESS = "分配成功";
    String DISPATCHER_ERROR = "分配失败";
    String CHECKED_TRUE = "1"; //复选框勾选
    String CHECKED_FALSE = "0"; //复选框不勾选
    boolean TRUE = true;
    boolean FALSE = false;


    int ZERO = 0;
    String IDENTITY_TRUE = "该身份证已被使用";
    String IDENTITY_FALSE = "改身份证可以使用";
    String NOT_EMPTY_IDENTITY = "身份证不能为空";
    String SERVER_ERROR = "暂时无法添加，请联系管理员";
    String UPLOAD_ERROR = "上传失败呀";
    String DEFAULT_TEMP_SUFFIX = "_temp";
    String DEFAULT_CAR_IMG = "/images/defaultcarimage.jpg";
    String DEFAULT_RENT_PREFIX = "CZ";
    Integer RETURN_BACK_FALSE = 0;// 未归还
    Integer RETURN_BACK_TRUE = 1;// 已归还
    Integer RENTED_TRUE = 1; //已出租
    Integer RENTED_FALSE = 0; //未出租
    String RENTID_TRUE = "出租单存在";
    String RENTID_FALSE = "出租单不存在";
    String DEFAULT_CHECK_PREFIX = "JC";
    String RENT_FINISH_TRUE = "出租单已完结";
    Integer CODE_ONE = 1;
}
