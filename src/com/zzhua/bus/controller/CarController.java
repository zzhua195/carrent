package com.zzhua.bus.controller;

import com.zzhua.bus.service.CarService;
import com.zzhua.bus.vo.CarVo;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.utils.AppFileUtils;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.util.Date;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/23
 * <p>
 * Description:
 */

@RestController
@RequestMapping("car")
public class CarController {
    @Autowired
    private CarService carService;

    @RequestMapping("loadCarByPage")
    public DataGridView loadCarByPage(CarVo carVo){
        return carService.queryCarByPage(carVo);
    }

    @RequestMapping("addCar")
    public ResultObj addCar(CarVo carVo){
        try {
            carVo.setCreatetime(new Date());
            if (!SysContast.DEFAULT_CAR_IMG.equals(carVo.getCarimg())) {
                carVo.setCarimg(AppFileUtils.removeSuffix(carVo.getCarimg()));
            }
            carService.addCar(carVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateCar")
    public ResultObj updateCar(CarVo carVo){
        try {
            if (!SysContast.DEFAULT_CAR_IMG.equals(carVo.getCarimg())) {
                carVo.setCarimg(AppFileUtils.removeSuffix(carVo.getCarimg()));
            }
            carService.updateCar(carVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteCar")
    public ResultObj deleteCar(String carnumber) {
        try {
            carService.deleteCar(carnumber);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchCar")
    public ResultObj deleteBatchCar(String[] ids) {
        try {
            carService.deleteBatchCar(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }





}
