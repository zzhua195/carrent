package com.zzhua.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzhua.bus.domain.Customer;
import com.zzhua.bus.mapper.CustomerMapper;
import com.zzhua.bus.service.CustomerService;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.bus.vo.CustomerVo;
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
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public DataGridView queryCustomerByPage(CustomerVo customerVo) {
        Page<Customer> customerPage = PageHelper.startPage(customerVo.getPage(), customerVo.getLimit());
        List<Customer> customerList = customerMapper.queryAllCustomer(customerVo);
        return new DataGridView(customerPage.getTotal(),customerList);
    }

    @Override
    public int checkIdentity(String identity) {
        return customerMapper.checkIdentity(identity);
    }


    @Override
    public void addCustomer(Customer customer) {
        customerMapper.insert(customer);
    }

    @Override
    public void updateCustomer(CustomerVo customerVo) {
        customerMapper.updateByPrimaryKey(customerVo);
    }

    @Override
    public void deleteCustomer(String identity) {
        customerMapper.deleteByPrimaryKey(identity);
    }

    @Override
    public Customer selectByPrimaryKey(String identity) {
        return customerMapper.selectByPrimaryKey(identity);
    }

    @Override
    public void deleteBatchCustomer(String[] identitys) {
        for (String identity : identitys) {
            this.deleteCustomer(identity);
        }
    }

}
