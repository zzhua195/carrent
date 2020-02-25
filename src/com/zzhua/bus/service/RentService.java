package com.zzhua.bus.service;

import com.zzhua.bus.domain.Rent;
import com.zzhua.bus.vo.RentVo;
import com.zzhua.sys.utils.DataGridView;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface RentService {
    void addRent(Rent rent);

    void updateRent(RentVo rentVo);

    void updateRentSelectiveById(Rent rent);

    void deleteRent(String id);

    void deleteBatchRent(String[] ids);

    DataGridView queryRentByPage(RentVo rentVo);
}
