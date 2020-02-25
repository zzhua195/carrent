package com.zzhua.bus.service;

import com.zzhua.bus.domain.Car;
import com.zzhua.bus.vo.CarVo;
import com.zzhua.sys.utils.DataGridView;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface CarService {
    void addCar(Car car);

    void updateCar(CarVo carVo);

    void deleteCar(String carnumber);

    void deleteBatchCar(String[] ids);

    Car selectByPrimaryKey(String carnumber);

    DataGridView queryCarByPage(CarVo carVo);

    void updateByPrimaryKeySelective(Car car);


}
