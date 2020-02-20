package com.zzhua.sys.service;

import com.zzhua.sys.domain.Menu;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.vo.MenuVo;
import com.zzhua.sys.vo.UserVo;

import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface MenuService {
    List<Menu> queryAllMenu(MenuVo menuVo);

    DataGridView queryMenuByPage(MenuVo menuVo);

    void addMenu(MenuVo menuVo);

    void updateMunu(MenuVo menuVo);

    void deleteMenu(Integer id);

    int queryMenuByPid(Integer pid);
}
