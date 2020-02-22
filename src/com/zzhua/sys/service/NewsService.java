package com.zzhua.sys.service;

import com.zzhua.sys.domain.News;
import com.zzhua.sys.domain.News;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.vo.NewsVo;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface NewsService {
    void addNews(News news);

    void updateNews(News news);

    void deleteNews(Integer id);

    void deleteBatchNews(Integer[] ids);

    DataGridView queryNewsByPage(NewsVo newsVo);

    News queryNewsById(Integer id);
}
