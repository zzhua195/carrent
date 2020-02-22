package com.zzhua.sys.controller;

import com.zzhua.sys.domain.News;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.service.NewsService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.ResultObj;
import com.zzhua.sys.utils.WebUtils;
import com.zzhua.sys.vo.NewsVo;
import com.zzhua.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping("loadNewsByPage")
    public DataGridView loadNewsByPage(NewsVo newsVo){
        return newsService.queryNewsByPage(newsVo);
    }

    @RequestMapping("addNews")
    public ResultObj addNews(NewsVo newsVo){
        try {
            User user = (User) WebUtils.getHttpSession().getAttribute("user");
            newsVo.setOpername(user.getLoginname());
            newsVo.setCreatetime(new Date());
            newsService.addNews(newsVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateNews")
    public ResultObj updateMunu(NewsVo newsVo){
        try {
            User user = (User) WebUtils.getHttpSession().getAttribute("user");
            newsVo.setOpername(user.getLoginname());
            newsService.updateNews(newsVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteNews")
    public ResultObj deleteNews(Integer id) {
        try {
            newsService.deleteNews(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchNews")
    public ResultObj deleteBatchNews(Integer[] ids) {
        try {
            newsService.deleteBatchNews(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }


    @RequestMapping("queryNewsById")
    public News queryNewsById(Integer id) {
        return newsService.queryNewsById(id);
    }




}
