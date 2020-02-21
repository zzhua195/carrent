package com.zzhua.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@Controller
@RequestMapping("sys")
public class SysController {

    @RequestMapping("toMenuManager")
    public String toMenuManager(){
        return "sys/menu/menuManager";
    }

    @RequestMapping("toMenuLeft")
    public String toMenuLeft(){
        return "sys/menu/menuLeft";
    }

    @RequestMapping("toMenuRight")
    public String toMenuRight(){
        return "sys/menu/menuRight";
    }

    @RequestMapping("toRoleManager")
    public String toRoleManager(){
        return "sys/role/roleManager";
    }

    @RequestMapping("toUserManager")
    public String toUserManager(){
        return "sys/user/userManager";
    }

}
