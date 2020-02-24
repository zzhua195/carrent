package com.zzhua.bus.mapper;

import com.zzhua.bus.domain.Rent;
import com.zzhua.bus.vo.RentVo;

import java.util.List;

public interface RentMapper {
    int deleteByPrimaryKey(String rentid);

    int insert(Rent record);

    int insertSelective(Rent record);

    Rent selectByPrimaryKey(String rentid);

    int updateByPrimaryKeySelective(Rent record);

    int updateByPrimaryKey(Rent record);

    List<Rent> queryAllRent(RentVo rentVo);
}