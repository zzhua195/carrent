package com.zzhua.sys.mapper;

import com.zzhua.sys.domain.User;
import com.zzhua.sys.vo.UserVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
     * 登录
     */
    User login(User user);

    void deleteUserRoleByUid(Integer userid);

    List<User> queryAllUser(UserVo userVo);

    void addRoleToUser(@Param("rid") Integer rid, @Param("userid")Integer userid);
}