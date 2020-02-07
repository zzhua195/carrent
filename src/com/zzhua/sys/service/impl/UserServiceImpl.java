package com.zzhua.sys.service.impl;

import com.zzhua.sys.domain.User;
import com.zzhua.sys.mapper.UserMapper;
import com.zzhua.sys.service.UserService;
import com.zzhua.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public User login(UserVo userVo) {
        return userMapper.login(userVo);
    }
}
