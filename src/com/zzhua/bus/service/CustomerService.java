package com.zzhua.bus.service;

import com.zzhua.bus.domain.Customer;
import com.zzhua.sys.utils.DataGridView;
import com.zzhua.bus.vo.CustomerVo;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/5
 * <p>
 * Description:
 */


public interface CustomerService {
    void addCustomer(Customer customer);

    void updateCustomer(CustomerVo customerVo);

    void deleteCustomer(String identity);

    void deleteBatchCustomer(String[] ids);

    DataGridView queryCustomerByPage(CustomerVo customerVo);

    int checkIdentity(String identity);
}
