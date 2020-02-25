package com.zzhua.bus.controller;

import com.zzhua.bus.domain.Car;
import com.zzhua.bus.domain.Check;
import com.zzhua.bus.domain.Customer;
import com.zzhua.bus.domain.Rent;
import com.zzhua.bus.service.CarService;
import com.zzhua.bus.service.CustomerService;
import com.zzhua.bus.service.RentService;
import com.zzhua.bus.vo.CarVo;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/23
 * <p>
 * Description:
 */

@RestController
@RequestMapping("checkCar")
public class CheckCarController {
    @Autowired
    private CarService carService;
    @Autowired
    private RentService rentService;
    @Autowired
    private CustomerService customerService;


    @RequestMapping("initCheckCarForm")
    public Map<String,Object> initCheckCarForm(String rentid){
        HashMap<String,Object> map = new HashMap<>();

        Check check = new Check();
        check.setCheckid(RandomUtils.generateCheckId());
        check.setRentid(rentid);
        check.setCheckdate(new Date());
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        check.setOpername(user.getLoginname());

        Rent rent = rentService.selectByPrimaryKey(rentid);

        Car car = carService.selectByPrimaryKey(rent.getCarnumber());

        Customer customer = customerService.selectByPrimaryKey(rent.getIdentity());

        map.put("check",check);
        map.put("rent",rent);
        map.put("car",car);
        map.put("customer",customer);

        return map;
    }

    @RequestMapping("checkRentExsit")
    public ResultObj checkRentExsit(String rentid){
        Rent rent = rentService.selectByPrimaryKey(rentid);
        if(rent!=null){
            if(SysContast.RETURN_BACK_TRUE.equals(rent.getRentflag())){
                return ResultObj.RENT_FINISH_TRUE;
            }
            return ResultObj.CHECK_TRUE_RENTID;
        }else{
            return ResultObj.CHECK_FALSE_RENTID;
        }
    }


}
