package com.zzhua.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.sys.domain.News;
import com.zzhua.sys.mapper.NewsMapper;
import com.zzhua.sys.service.NewsService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.vo.NewsVo;
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
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public DataGridView queryNewsByPage(NewsVo newsVo) {
        Page<News> newsPage = PageHelper.startPage(newsVo.getPage(), newsVo.getLimit());
        List<News> newsList = newsMapper.queryAllNews(newsVo);
        return new DataGridView(newsPage.getTotal(),newsList);
    }

    @Override
    public News queryNewsById(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addNews(News news) {
        newsMapper.insert(news);
    }

    @Override
    public void updateNews(News news) {
        newsMapper.updateByPrimaryKeySelective(news);
    }

    @Override
    public void deleteNews(Integer newsid) {
        newsMapper.deleteByPrimaryKey(newsid);
    }

    @Override
    public void deleteBatchNews(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteNews(id);
        }
    }


}
