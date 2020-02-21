package com.zzhua.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.sys.domain.Role;
import com.zzhua.sys.domain.User;
import com.zzhua.sys.mapper.UserMapper;
import com.zzhua.sys.service.UserService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.vo.RoleVo;
import com.zzhua.sys.vo.UserVo;
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
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public DataGridView queryUserByPage(UserVo userVo) {
        Page<User> userPage = PageHelper.startPage(userVo.getPage(), userVo.getLimit());
        List<User> userList = userMapper.queryAllUser(userVo);
        return new DataGridView(userPage.getTotal(),userList);
    }

    @Override
    public void resetUserRole(Integer userid, Integer[] rids) {
        userMapper.deleteUserRoleByUid(userid);
        for (Integer rid : rids) {
            userMapper.addRoleToUser(rid,userid);
        }
    }

    @Override
    public void addUser(UserVo userVo) {
        userVo.setType(1);// 默认为普通用户
        userMapper.insert(userVo);
    }

    @Override
    public void updateMunu(UserVo userVo) {
        userMapper.updateByPrimaryKey(userVo);
    }

    @Override
    public void deleteUser(Integer userid) {
        userMapper.deleteUserRoleByUid(userid);
        userMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public void deleteBatchUser(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteUser(id);
        }
    }

    @Override
    public User login(UserVo userVo) {
        return userMapper.login(userVo);
    }
}
