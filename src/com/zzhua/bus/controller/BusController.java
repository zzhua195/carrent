package com.zzhua.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/23
 * <p>
 * Description:
 */

@Controller
@RequestMapping("/bus")
public class BusController  {

    @RequestMapping("toCustomerManager")
    public String toMenuManager(){
        return "bus/customer/customerManager";
    }

    @RequestMapping("toCarManager")
    public String toCarManager(){
        return "bus/car/carManager";
    }

    @RequestMapping("toRentCarManager")
    public String toRentCarManager(){
        return "bus/rent/rentCarManager";
    }

    @RequestMapping("toRentManager")
    public String toRentManager(){
        return "bus/rent/rentManager";
    }

}
