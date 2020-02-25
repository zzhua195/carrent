package com.zzhua.bus.service;

import com.zzhua.bus.domain.Check;
import com.zzhua.bus.vo.CheckVo;
import com.zzhua.sys.utils.DataGridView;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface CheckService {
    void addCheck(Check check);

    void updateCheck(CheckVo checkVo);

    void updateCheckSelectiveById(Check check);

    Check selectByPrimaryKey(String checkid);

    void deleteCheck(String id);

    void deleteBatchCheck(String[] ids);

    DataGridView queryCheckByPage(CheckVo checkVo);
}
