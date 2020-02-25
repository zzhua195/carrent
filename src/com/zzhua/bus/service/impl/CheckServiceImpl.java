package com.zzhua.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.bus.domain.Check;
import com.zzhua.bus.mapper.CheckMapper;
import com.zzhua.bus.service.CheckService;
import com.zzhua.bus.vo.CheckVo;
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
public class CheckServiceImpl implements CheckService {

    @Autowired
    private CheckMapper checkMapper;

    @Override
    public DataGridView queryCheckByPage(CheckVo checkVo) {
        Page<Check> checkPage = PageHelper.startPage(checkVo.getPage(), checkVo.getLimit());
        List<Check> checkList = checkMapper.queryAllCheck(checkVo);
        return new DataGridView(checkPage.getTotal(),checkList);
    }


    @Override
    public void addCheck(Check check) {
        checkMapper.insert(check);
    }

    @Override
    public void updateCheck(CheckVo checkVo) {
        checkMapper.updateByPrimaryKey(checkVo);
    }

    @Override
    public void updateCheckSelectiveById(Check check) {
        checkMapper.updateByPrimaryKeySelective(check);
    }

    @Override
    public Check selectByPrimaryKey(String checkid) {
        return checkMapper.selectByPrimaryKey(checkid);
    }

    @Override
    public void deleteCheck(String identity) {
        checkMapper.deleteByPrimaryKey(identity);
    }

    @Override
    public void deleteBatchCheck(String[] identitys) {
        for (String identity : identitys) {
            this.deleteCheck(identity);
        }
    }

}
