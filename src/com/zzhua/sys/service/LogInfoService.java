package com.zzhua.sys.service;

import com.zzhua.sys.domain.LogInfo;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.TreeNode;
import com.zzhua.sys.vo.LogInfoVo;

import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface LogInfoService {
    List<LogInfo> queryAllLogInfo(LogInfoVo logInfoVo);

    DataGridView queryLogInfoByPage(LogInfoVo logInfoVo);

    void addLogInfo(LogInfoVo logInfoVo);

    void updateMunu(LogInfoVo logInfoVo);

    void deleteLogInfo(Integer id);

    void deleteBatchLogInfo(Integer[] ids);
}
