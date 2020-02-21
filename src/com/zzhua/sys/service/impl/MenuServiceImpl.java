package com.zzhua.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.sys.domain.Menu;
import com.zzhua.sys.mapper.MenuMapper;
import com.zzhua.sys.service.MenuService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.vo.MenuVo;
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
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenu(MenuVo menuVo) {
        return menuMapper.queryAllMenu(menuVo);
    }

    @Override
    public DataGridView queryMenuByPage(MenuVo menuVo) {
        Page<Menu> menuPage = PageHelper.startPage(menuVo.getPage(), menuVo.getLimit());
        List<Menu> menuList = menuMapper.queryAllMenu(menuVo);
        return new DataGridView(menuPage.getTotal(),menuList);
    }

    @Override
    public void addMenu(MenuVo menuVo) {
        menuMapper.insert(menuVo);
    }

    @Override
    public void updateMunu(MenuVo menuVo) {
        menuMapper.updateByPrimaryKey(menuVo);
    }

    @Override
    public void deleteMenu(Integer id) {
        menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int queryMenuByPid(Integer pid) {
        return menuMapper.queryMenuByPid(pid);
    }

    @Override
    public List<Menu> queryMenuByUid(Integer uid) {
        return menuMapper.queryMenuByUid(uid);
    }


}
