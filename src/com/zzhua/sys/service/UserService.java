package com.zzhua.sys.service;

import com.zzhua.sys.domain.User;
import com.zzhua.sys.vo.UserVo;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface UserService {
    User login(UserVo userVo);
}
