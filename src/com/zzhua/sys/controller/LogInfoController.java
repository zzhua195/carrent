package com.zzhua.sys.controller;

import com.zzhua.sys.domain.LogInfo;
import com.zzhua.sys.service.LogInfoService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.ResultObj;
import com.zzhua.sys.utils.TreeNode;
import com.zzhua.sys.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@RestController
@RequestMapping("logInfo")
public class LogInfoController {

    @Autowired
    private LogInfoService logInfoService;

    @RequestMapping("loadLogInfoByPage")
    public DataGridView loadLogInfoByPage(LogInfoVo logInfoVo){
        return logInfoService.queryLogInfoByPage(logInfoVo);
    }

    @RequestMapping("deleteLogInfo")
    public ResultObj deleteLogInfo(Integer id) {
        try {
            logInfoService.deleteLogInfo(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchLogInfo")
    public ResultObj deleteBatchLogInfo(Integer[] ids) {
        try {
            logInfoService.deleteBatchLogInfo(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
