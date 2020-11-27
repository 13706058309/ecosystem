package com.cykj.service.impl;

import com.cykj.entity.Parameter;
import com.cykj.mapper.ParameterMapper;
import com.cykj.service.ParameterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.Resources;
import java.util.List;
import java.util.Map;
@Service
public class ParameterSericeImpl implements ParameterService {

    @Resource
    ParameterMapper parameterMapper;
    /**
     * 查询参数
     * @param condition 条件
     * @return
     */
    @Override
    public List<Parameter> findParameter(Map<String, Object> condition) {
        return parameterMapper.findParameter(condition);
    }
}
