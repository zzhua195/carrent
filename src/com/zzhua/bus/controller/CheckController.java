package com.zzhua.bus.controller;

import com.zzhua.bus.domain.Car;
import com.zzhua.bus.domain.Rent;
import com.zzhua.bus.service.CarService;
import com.zzhua.bus.service.CheckService;
import com.zzhua.bus.service.CustomerService;
import com.zzhua.bus.service.RentService;
import com.zzhua.bus.vo.CheckVo;
import com.zzhua.bus.vo.CustomerVo;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/25
 * <p>
 * Description:
 */

@RestController
@RequestMapping("check")
public class CheckController {

    @Autowired
    private CheckService checkService;
    @Autowired
    private CarService carService;
    @Autowired
    private RentService rentService;

    @RequestMapping("loadCheckByPage")
    public DataGridView loadCheckByPage(CheckVo checkVo){
        return checkService.queryCheckByPage(checkVo);
    }

    @RequestMapping("addCheck")
    public ResultObj addCheck(CheckVo checkVo){
        try {
            checkVo.setCreatetime(new Date());
            checkService.addCheck(checkVo);
            //修改汽车的出租状态
            Car car = new Car();
            car.setIsrenting(SysContast.RENTED_FALSE);
            Rent rent = rentService.selectByPrimaryKey(checkVo.getRentid());
            car.setCarnumber(rent.getCarnumber());
            carService.updateByPrimaryKeySelective(car);
            //修改出租单的状态
            rent.setRentflag(SysContast.RETURN_BACK_TRUE);
            rentService.updateRentSelectiveById(rent);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateCheck")
    public ResultObj updateMunu(CheckVo checkVo){
        try {
            checkService.updateCheckSelectiveById(checkVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteCheck")
    public ResultObj deleteCheck(String identity) {
        try {
            checkService.deleteCheck(identity);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchCheck")
    public ResultObj deleteBatchCheck(String[] identitys) {
        try {
            checkService.deleteBatchCheck(identitys);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
