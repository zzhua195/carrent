package com.zzhua.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sun.deploy.panel.TreeBuilder;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.Menu;
import com.zzhua.sys.domain.Role;
import com.zzhua.sys.mapper.MenuMapper;
import com.zzhua.sys.mapper.RoleMapper;
import com.zzhua.sys.service.RoleService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.TreeNode;
import com.zzhua.sys.utils.TreeNodeBuilder;
import com.zzhua.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> queryAllRole(RoleVo roleVo) {
        return roleMapper.queryAllRole(roleVo);
    }

    @Override
    public DataGridView queryRoleByPage(RoleVo roleVo) {
        Page<Role> rolePage = PageHelper.startPage(roleVo.getPage(), roleVo.getLimit());
        List<Role> roleList = roleMapper.queryAllRole(roleVo);
        return new DataGridView(rolePage.getTotal(),roleList);
    }

    @Override
    public void addRole(RoleVo roleVo) {
        roleMapper.insert(roleVo);
    }

    @Override
    public void updateMunu(RoleVo roleVo) {
        roleMapper.updateByPrimaryKey(roleVo);
    }

    @Override
    public void deleteRole(Integer roleid) {
        roleMapper.deleteRoleMenuByRid(roleid);
        roleMapper.deleteByPrimaryKey(roleid);
    }

    @Override
    public void deleteBatchRole(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteRole(id);
        }
    }

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public DataGridView<TreeNode> initRoleMenuTreeJson(Integer roleid) {
        //查询所有可用的菜单
        Menu menu = new Menu();
        menu.setAvailable(SysContast.AVAILABLE_TRUE);
        List<Menu> AvailableMenuList = menuMapper.queryAllMenu(menu);

        //查询对应角色拥有的菜单
        List<Menu> menuList = menuMapper.queryMenuByRid(roleid);

        ArrayList<TreeNode> nodes = new ArrayList<>();

        for (Menu menu1 : AvailableMenuList) {
            TreeNode node = new TreeNode(menu1.getId(), menu1.getPid(), SysContast.TRUE,menu1.getTitle());
            String checkAttr = SysContast.CHECKED_FALSE;
            if (menuList != null) {
                for (Menu menu2 : menuList) {
                    if (menu2.getId() != null&&menu2.getId().equals(menu1.getId())) {
                        checkAttr = SysContast.CHECKED_TRUE;
                    }
                }
            }
            node.setCheckArr(checkAttr);
            nodes.add(node);
        }
        List<TreeNode> treeNodeList = TreeNodeBuilder.build(nodes, SysContast.ZERO);
        return new DataGridView<>(treeNodeList);
    }

    @Override
    public void resetRoleMenu(Integer roleid, Integer[] mids) {
        this.deleteRole(roleid);
        if (mids != null && mids.length > 0) {
            for (Integer id : mids) {
                roleMapper.addMenuToRole(roleid,id);
            }
        }
    }


}
