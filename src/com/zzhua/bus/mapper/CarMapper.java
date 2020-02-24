package com.zzhua.bus.mapper;

import com.zzhua.bus.domain.Car;
import com.zzhua.bus.vo.CarVo;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(String carnumber);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carnumber);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

    List<Car> queryAllCar(CarVo carVo);
}