package com.zzhua.sys.mapper;

import com.zzhua.sys.domain.Role;
import com.zzhua.sys.vo.RoleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> queryAllRole(Role role);

    void deleteRoleMenuByRid(Integer roleid);

    void addMenuToRole(@Param("roleid") Integer roleid, @Param("mid") Integer mid);

    List<Role> queryRoleByUid(Integer uid);
}