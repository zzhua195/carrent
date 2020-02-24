package com.zzhua.bus.vo;

import com.zzhua.bus.domain.Rent;

/**
 * Copyright (C), 2019, 深圳太极云软技术有限公司
 * Author：   zzhua
 * Created by Administrator on 2020/2/24
 * <p>
 * Description:
 */


public class RentVo extends Rent {
    private Integer page;
    private Integer limit;

    private String idy;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
