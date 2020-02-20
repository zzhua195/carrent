package com.zzhua.sys.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.Menu;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.service.MenuService;
import com.zzhua.sys.utils.*;
import com.zzhua.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("loadLeftIndexMenu")
    public List<TreeNode> loadLeftIndexMenu(MenuVo menuVo){
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        menuVo.setAvailable(SysContast.AVAILABLE_TRUE);
        List<TreeNode> treeNodeList = null;
        if(user!=null&&user.getAvailable().equals(SysContast.AVAILABLE_TRUE)){
            List<Menu> menuList = new ArrayList<>();
            if(user.getType().equals(SysContast.USER_TYPE_SUPER)){
                menuList = menuService.queryAllMenu(menuVo);
            }else{
                //普通用户查询菜单
            }
            List<TreeNode> treeNodes = new ArrayList<>();
            for (Menu menu : menuList) {
                TreeNode treeNode = new TreeNode(
                        menu.getId(),
                        menu.getPid(),
                        menu.getTitle(),
                        menu.getIcon(),
                        menu.getHref(),
                        menu.getSpread().equals(Integer.valueOf(SysContast.SPREAD_TRUE))
                );
                treeNodes.add(treeNode);
            }
            treeNodeList = TreeNodeBuilder.build(treeNodes,SysContast.MENU_TOP_ID);

        }
        return treeNodeList;

    }

    @RequestMapping("loadLeftMenuTree")
    public DataGridView loadMenuTree(MenuVo menuVo){
        menuVo.setAvailable(SysContast.AVAILABLE_TRUE);
        List<Menu> menuList = menuService.queryAllMenu(menuVo);
        List<TreeNode> treeNodeList = null;
        List<TreeNode> treeNodes = new ArrayList<>();
        for (Menu menu : menuList) {
            TreeNode treeNode = new TreeNode(
                    menu.getId(),
                    menu.getPid(),
                    menu.getTitle(),
                    menu.getIcon(),
                    menu.getHref(),
                    menu.getSpread().equals(Integer.valueOf(SysContast.SPREAD_TRUE))
            );
            treeNodes.add(treeNode);
        }
        treeNodeList = TreeNodeBuilder.build(treeNodes,0);
        return new DataGridView(treeNodeList);
    }

    @RequestMapping("loadMenuByPage")
    public DataGridView loadMenuByPage(MenuVo menuVo){
        return menuService.queryMenuByPage(menuVo);
    }

    @RequestMapping("addMenu")
    public ResultObj addMenu(MenuVo menuVo){
        try {
            menuService.addMenu(menuVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateMenu")
    public ResultObj updateMunu(MenuVo menuVo){
        try {
            menuService.updateMunu(menuVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteMenu")
    public ResultObj deleteMenu(Integer id){
        try {
            menuService.deleteMenu(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    // 判断是否有子节点
    @RequestMapping("hasChidrenNode")
    public ResultObj hasChildrenNode(Integer id){
        int count = menuService.queryMenuByPid(id);
        if(count > 0 ){
            return ResultObj.STATUS_TRUE;
        }else{
            return ResultObj.STATUS_ERROR;
        }
    }




}
