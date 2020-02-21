package com.zzhua.sys.service;

import com.zzhua.sys.domain.Role;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.TreeNode;
import com.zzhua.sys.vo.RoleVo;

import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface RoleService {
    List<Role> queryAllRole(RoleVo roleVo);

    DataGridView queryRoleByPage(RoleVo roleVo);

    void addRole(RoleVo roleVo);

    void updateMunu(RoleVo roleVo);

    void deleteRole(Integer id);

    void deleteBatchRole(Integer[] ids);

    DataGridView<TreeNode> initRoleMenuTreeJson(Integer roleid);

    void resetRoleMenu(Integer roleid, Integer[] ids);
}
