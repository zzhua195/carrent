package com.zzhua.sys.controller;

import com.zzhua.sys.service.UserService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.ResultObj;
import com.zzhua.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("loadUserByPage")
    public DataGridView loadUserByPage(UserVo userVo){
        return userService.queryUserByPage(userVo);
    }

    @RequestMapping("addUser")
    public ResultObj addUser(UserVo userVo){
        try {
            userService.addUser(userVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateUser")
    public ResultObj updateMunu(UserVo userVo){
        try {
            userService.updateMunu(userVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteUser")
    public ResultObj deleteUser(Integer id) {
        try {
            userService.deleteUser(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchUser")
    public ResultObj deleteBatchUser(Integer[] uids) {
        try {
            userService.deleteBatchUser(uids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }



    @RequestMapping("resetUserRole")
    public ResultObj resetUserRole(Integer userid,Integer[] rids){
        try {
            userService.resetUserRole(userid,rids);
            return ResultObj.DISPATCHER_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DISPATCHER_ERROR;
        }
    }




}
