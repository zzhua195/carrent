package com.zzhua.sys.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zzhua.sys.constant.SysContast;
import com.zzhua.sys.domain.Menu;
import com.zzhua.sys.mapper.MenuMapper;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public class InitMenuData {
    public static void main(String[] args) throws JsonProcessingException {
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        MenuMapper menuMapper = app.getBean(MenuMapper.class);

        /*menuMapper.insert(new Menu(1, 0, "汽车出租系统", null, 1, null, "&#xe68e;", 1));
        menuMapper.insert(new Menu(2, 1, "基础管理", null, 1, null, "&#xe653;", 1));
        menuMapper.insert(new Menu(3, 1, "业务管理", null, 0, null, "&#xe663;", 1));
        menuMapper.insert(new Menu(4, 1, "系统管理", null, 0, null, "&#xe716;", 1));
        menuMapper.insert(new Menu(5, 1, "统计分析", null, 0, null, "&#xe629;", 1));


        menuMapper.insert(new Menu(6, 2, "客户管理", null, 0, null, "&#xe770;", 1));
        menuMapper.insert(new Menu(7, 2, "车辆管理", null, 0, null, "&#xe657;", 1));


        menuMapper.insert(new Menu(8, 3, "汽车出租", null, 0, null, "&#xe65b;", 1));
        menuMapper.insert(new Menu(9, 3, "出租单管理", null, 0, null, "&#xe6b2;", 1));
        menuMapper.insert(new Menu(10, 3, "汽车入库", null, 0, null, "&#xe65a;", 1));
        menuMapper.insert(new Menu(11, 3, "检查单管理", null, 0, null, "&#xe705;", 1));


        menuMapper.insert(new Menu(12, 4, "菜单管理", null, 0, null, "&#xe60f;", 1));
        menuMapper.insert(new Menu(13, 4, "角色管理", null, 0, null, "&#xe66f;", 1));
        menuMapper.insert(new Menu(14, 4, "用户管理", null, 0, null, "&#xe770;", 1));
        menuMapper.insert(new Menu(15, 4, "日志管理", null, 0, null, "&#xe655;", 1));
        menuMapper.insert(new Menu(16, 4, "公告管理", null, 0, null, "&#xe645;", 1));
        menuMapper.insert(new Menu(17, 4, "数据源监控", null, 0, null, "&#xe857;", 1));


        menuMapper.insert(new Menu(18, 5, "客户地区统计", null, 0, null, "&#xe63c;", 1));
        menuMapper.insert(new Menu(19, 5, "公司年度月份销售额", null, 0, null, "&#xe62c;", 1));
        menuMapper.insert(new Menu(20, 5, "业务员年度销售额", null, 0, null, "&#xe62d;", 1));*/

        //System.out.println("初始化完成");

        List<Menu> menuList = menuMapper.queryAllMenu(null);
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

        List<TreeNode> treeNodeList = TreeNodeBuilder.build(treeNodes, SysContast.MENU_TOP_ID);
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(mapper.writer().writeValueAsString(treeNodeList));

    }
}
