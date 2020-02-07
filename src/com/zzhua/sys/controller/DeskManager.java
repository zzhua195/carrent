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
@RequestMapping("desk")
public class DeskManager {

    @RequestMapping("toDeskManager")
    public String main(){
        return "sys/main/deskManager";
    }

}
