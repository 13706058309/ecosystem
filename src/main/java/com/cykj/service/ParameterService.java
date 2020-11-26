package com.cykj.service;

import com.cykj.entity.Parameter;

import java.util.List;
import java.util.Map;

public interface ParameterService {
    /**
     * 查询参数
     * @param condition 条件
     * @return
     */
    List<Parameter> findParameter(Map<String,Object> condition);
}
