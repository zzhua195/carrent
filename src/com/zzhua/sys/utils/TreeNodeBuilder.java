package com.zzhua.sys.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public class TreeNodeBuilder {
    public static final List<TreeNode> build(List<TreeNode> nodes,int topId){
        if(nodes==null||nodes.size()==0){
            return null;
        }

        ArrayList<TreeNode> treeNodeList = new ArrayList<>();

        for (TreeNode node1 : nodes) {
            if(node1.getPid()==topId){
                treeNodeList.add(node1);
            }
            Integer id1 = node1.getId();
            for (TreeNode node2 : nodes) {
                if(node2.getPid().equals(id1)){
                    node1.getChildren().add(node2);
                }
            }

        }

        return treeNodeList;

    }
}
