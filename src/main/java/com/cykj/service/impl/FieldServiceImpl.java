package com.cykj.service.impl;

import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;
import com.cykj.entity.Unit;
import com.cykj.mapper.FieldMapper;
import com.cykj.mapper.UnitMapper;
import com.cykj.service.FieldService;
import com.cykj.service.UnitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FieldServiceImpl implements FieldService {
    @Resource
    private FieldMapper fieldMapper;
    @Override
    public TableInfo findField(Integer page,Integer limit,String fieldName) {

        Map<String,Object> map = new HashMap<>();
        if (fieldName != null && !fieldName.equals("null")){
            map.put("fieldName",fieldName);
        }else {
            map.put("fieldName","");
        }

        map.put("limit",limit);
        map.put("offset",(page - 1) * limit);
        System.out.println("FieldServiceImpl里map的值为："+map);
        List<Unit> allOnPage = fieldMapper.findFieldOnPage(map);
        int numOnPage = fieldMapper.findNumOnPage(map);
        TableInfo tableInfo = new TableInfo(0,"后台领域信息数据",numOnPage,allOnPage);
        return tableInfo;
    }

    @Override
    public int deleteField(Integer fieldId) {
        int field = fieldMapper.deleteField(fieldId);
        return  field;
    }

    @Override//新增课程
    public int insertField(String fieldName) {
        System.out.println("FieldServiceImpl里的值为："+"fieldName:"+fieldName);
        int insertField = fieldMapper.insertField(fieldName);
        return insertField;
    }

    @Override
    public List<Field> selectAllFieldName() {

        return fieldMapper.selectAllFieldName();
    }


}
