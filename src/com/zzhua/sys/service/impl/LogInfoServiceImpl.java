package com.zzhua.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.Menu;
import com.zzhua.sys.domain.LogInfo;
import com.zzhua.sys.mapper.MenuMapper;
import com.zzhua.sys.mapper.LogInfoMapper;
import com.zzhua.sys.service.LogInfoService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.TreeNode;
import com.zzhua.sys.utils.TreeNodeBuilder;
import com.zzhua.sys.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@Service
public class LogInfoServiceImpl implements LogInfoService {

    @Autowired
    private LogInfoMapper logInfoMapper;

    @Override
    public List<LogInfo> queryAllLogInfo(LogInfoVo logInfoVo) {
        return logInfoMapper.queryAllLogInfo(logInfoVo);
    }

    @Override
    public DataGridView queryLogInfoByPage(LogInfoVo logInfoVo) {
        Page<LogInfo> logInfoPage = PageHelper.startPage(logInfoVo.getPage(), logInfoVo.getLimit());
        List<LogInfo> logInfoList = logInfoMapper.queryAllLogInfo(logInfoVo);
        return new DataGridView(logInfoPage.getTotal(),logInfoList);
    }

    @Override
    public void addLogInfo(LogInfoVo logInfoVo) {
        logInfoMapper.insert(logInfoVo);
    }

    @Override
    public void updateMunu(LogInfoVo logInfoVo) {
        logInfoMapper.updateByPrimaryKey(logInfoVo);
    }

    @Override
    public void deleteLogInfo(Integer id) {
        logInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatchLogInfo(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteLogInfo(id);
        }
    }





}
