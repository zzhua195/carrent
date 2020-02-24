package com.zzhua.bus.mapper;

import com.zzhua.bus.domain.Customer;
import com.zzhua.bus.vo.CustomerVo;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(String identity);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(String identity);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(CustomerVo record);

    List<Customer> queryAllCustomer(CustomerVo customerVo);

    int checkIdentity(String identity);
}