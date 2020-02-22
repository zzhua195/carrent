package com.zzhua.sys.mapper;

import com.zzhua.sys.domain.LogInfo;
import com.zzhua.sys.vo.LogInfoVo;

import java.util.List;

public interface LogInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogInfo record);

    int insertSelective(LogInfo record);

    LogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogInfo record);

    int updateByPrimaryKey(LogInfo record);

    List<LogInfo> queryAllLogInfo(LogInfoVo logInfoVo);

}