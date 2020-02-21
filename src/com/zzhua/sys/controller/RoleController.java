package com.zzhua.sys.controller;

import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.Role;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.service.MenuService;
import com.zzhua.sys.service.RoleService;
import com.zzhua.sys.utils.*;
import com.zzhua.sys.vo.MenuVo;
import com.zzhua.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("loadRoleByPage")
    public DataGridView loadRoleByPage(RoleVo roleVo){
        return roleService.queryRoleByPage(roleVo);
    }

    @RequestMapping("addRole")
    public ResultObj addRole(RoleVo roleVo){
        try {
            roleService.addRole(roleVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateRole")
    public ResultObj updateMunu(RoleVo roleVo){
        try {
            roleService.updateMunu(roleVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteRole")
    public ResultObj deleteRole(Integer id) {
        try {
            roleService.deleteRole(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchRole")
    public ResultObj deleteBatchRole(Integer[] ids) {
        try {
            roleService.deleteBatchRole(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("initRoleMenuTreeJson")
    public DataGridView<TreeNode> initRoleMenuTreeJson(Integer roleid){
       return roleService.initRoleMenuTreeJson(roleid);
    }

    @RequestMapping("dispatchRoleMenu")
    public ResultObj dispatchRoleMenu(Integer roleid,Integer[] mids){
        try {
            roleService.resetRoleMenu(roleid,mids);
            return ResultObj.DISPATCHER_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultObj.DISPATCHER_ERROR;
    }



}
