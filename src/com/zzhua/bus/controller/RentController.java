package com.zzhua.bus.controller;

import com.zzhua.bus.domain.Car;
import com.zzhua.bus.service.CarService;
import com.zzhua.bus.service.RentService;
import com.zzhua.bus.vo.CarVo;
import com.zzhua.bus.vo.RentVo;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.RandomUtils;
import com.zzhua.sys.utils.ResultObj;
import com.zzhua.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/23
 * <p>
 * Description:
 */

@RestController
@RequestMapping("rent")
public class RentController {
    @Autowired
    private RentService rentService;

    @RequestMapping("loadRentByPage")
    public DataGridView loadRentByPage(RentVo rentVo){
        return rentService.queryRentByPage(rentVo);
    }

    @Autowired
    private CarService carService;

    @RequestMapping("addRent")
    public ResultObj addRent(RentVo rentVo){
        try {
            rentVo.setCreatetime(new Date());
            Car car = new Car();
            car.setCarnumber(rentVo.getCarnumber());
            car.setIsrenting(SysContast.RENTED_TRUE);
            carService.updateByPrimaryKeySelective(car);
            rentVo.setRentflag(SysContast.RETURN_BACK_FALSE);
            rentService.addRent(rentVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateRent")
    public ResultObj updateMunu(RentVo rentVo){
        try {
            rentService.updateRentSelectiveById(rentVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteRent")
    public ResultObj deleteRent(String rentid) {
        try {
            rentService.deleteRent(rentid);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchRent")
    public ResultObj deleteBatchRent(String[] identitys) {
        try {
            rentService.deleteBatchRent(identitys);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("initRentForm")
    public RentVo deleteBatchRent(RentVo rentVo) {
        rentVo.setBegindate(new Date());
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        rentVo.setOpername(user.getLoginname());
        rentVo.setRentid(RandomUtils.getRentid());
        return rentVo;
    }

}
