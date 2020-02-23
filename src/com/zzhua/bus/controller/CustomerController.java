package com.zzhua.bus.controller;

import com.zzhua.bus.service.CustomerService;
import com.zzhua.bus.vo.CustomerVo;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/23
 * <p>
 * Description:
 */

@RestController
@RequestMapping("customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("loadCustomerByPage")
    public DataGridView loadCustomerByPage(CustomerVo customerVo){
        return customerService.queryCustomerByPage(customerVo);
    }

    @RequestMapping("addCustomer")
    public ResultObj addCustomer(CustomerVo customerVo){
        try {
            customerService.addCustomer(customerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateCustomer")
    public ResultObj updateMunu(CustomerVo customerVo){
        try {
            customerService.updateCustomer(customerVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("deleteCustomer")
    public ResultObj deleteCustomer(String identity) {
        try {
            customerService.deleteCustomer(identity);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("deleteBatchCustomer")
    public ResultObj deleteBatchCustomer(String[] identitys) {
        try {
            customerService.deleteBatchCustomer(identitys);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("checkIdentity")
    public ResultObj checkIdentity(String identity){
        if(StringUtils.isEmpty(identity)){
            return ResultObj.NOT_EMPTY_IDENTITY;
        }
        try {
            int count = customerService.checkIdentity(identity);
            if(count>0){
                return ResultObj.CHECK_TRUE_IDENTITY;
            }else{
                return ResultObj.CHECK_FALSE_IDENTITY;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.SERVER_ERROR;
        }
    }



}
