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
    String ADD_ERROR = "添加成功";
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
}
