package com.zzhua.sys.mapper;

import com.zzhua.sys.domain.News;
import com.zzhua.sys.vo.NewsVo;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

    List<News> queryAllNews(NewsVo newsVo);
}