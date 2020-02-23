package com.zzhua.sys.controller;

import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.LogInfo;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.service.LogInfoService;
import com.zzhua.sys.service.UserService;
import com.zzhua.sys.utils.WebUtils;
import com.zzhua.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private LogInfoService logInfoService;

    @RequestMapping("toLogin")
    public String toLogin(){
        return "sys/main/login";
    }

    @RequestMapping("login")
    public String login(UserVo userVo,Model model){
        User user = userService.login(userVo);
        if(user!=null){
            WebUtils.getHttpSession().setAttribute("user",user);
            LogInfo logInfo = new LogInfo();
            logInfo.setLoginname(user.getLoginname());
            logInfo.setLoginip(WebUtils.getHttpServletRequest().getRemoteAddr());
            logInfo.setLogintime(new Date());
            return "sys/main/index";
        }else{
            model.addAttribute("error", SysContast.USER_LOGIN_ERROR_MSG);
            return "sys/main/login";
        }
    }


}
