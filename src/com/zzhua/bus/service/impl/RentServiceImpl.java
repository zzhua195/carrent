package com.zzhua.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.bus.domain.Rent;
import com.zzhua.bus.mapper.RentMapper;
import com.zzhua.bus.service.RentService;
import com.zzhua.bus.vo.RentVo;
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
public class RentServiceImpl implements RentService {

    @Autowired
    private RentMapper rentMapper;

    @Override
    public DataGridView queryRentByPage(RentVo rentVo) {
        Page<Rent> rentPage = PageHelper.startPage(rentVo.getPage(), rentVo.getLimit());
        List<Rent> rentList = rentMapper.queryAllRent(rentVo);
        return new DataGridView(rentPage.getTotal(),rentList);
    }


    @Override
    public void addRent(Rent rent) {
        rentMapper.insert(rent);
    }

    @Override
    public void updateRent(RentVo rentVo) {
        rentMapper.updateByPrimaryKey(rentVo);
    }

    @Override
    public void updateRentSelectiveById(Rent rent) {
        rentMapper.updateByPrimaryKeySelective(rent);
    }

    @Override
    public Rent selectByPrimaryKey(String rentid) {
        return rentMapper.selectByPrimaryKey(rentid);
    }

    @Override
    public void deleteRent(String identity) {
        rentMapper.deleteByPrimaryKey(identity);
    }

    @Override
    public void deleteBatchRent(String[] identitys) {
        for (String identity : identitys) {
            this.deleteRent(identity);
        }
    }

}
