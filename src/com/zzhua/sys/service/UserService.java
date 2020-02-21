package com.zzhua.sys.service;

import com.zzhua.sys.domain.User;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.vo.RoleVo;
import com.zzhua.sys.vo.UserVo;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface UserService {
    void addUser(UserVo userVo);

    void updateMunu(UserVo userVo);

    void deleteUser(Integer id);

    void deleteBatchUser(Integer[] ids);

    User login(UserVo userVo);

    DataGridView queryUserByPage(UserVo userVo);

    void resetUserRole(Integer userid, Integer[] rids);
}
