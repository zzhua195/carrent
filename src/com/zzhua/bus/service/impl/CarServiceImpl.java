package com.zzhua.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.bus.domain.Car;
import com.zzhua.bus.mapper.CarMapper;
import com.zzhua.bus.service.CarService;
import com.zzhua.bus.vo.CarVo;
import com.zzhua.sys.utils.AppFileUtils;
import com.zzhua.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;

    @Override
    public DataGridView queryCarByPage(CarVo carVo) {
        Page<Car> carPage = PageHelper.startPage(carVo.getPage(), carVo.getLimit());
        List<Car> carList = carMapper.queryAllCar(carVo);
        return new DataGridView(carPage.getTotal(),carList);
    }


    @Override
    public void addCar(Car car) {
        carMapper.insert(car);
    }

    @Override
    public void updateCar(CarVo carVo) {
        carMapper.updateByPrimaryKeySelective(carVo);
    }

    @Override
    public void deleteCar(String carnumber) {
        //把对应的图片也要删除掉
        Car car = carMapper.selectByPrimaryKey(carnumber);
        AppFileUtils.deleteFileUsePath(car.getCarimg());
        carMapper.deleteByPrimaryKey(carnumber);
    }

    @Override
    public void deleteBatchCar(String[] identitys) {
        for (String identity : identitys) {
            this.deleteCar(identity);
        }
    }

}
