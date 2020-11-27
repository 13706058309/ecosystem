package com.cykj.service;

import com.cykj.entity.Field;
import com.cykj.entity.TableInfo;

import java.util.List;

public interface FieldService {
    public TableInfo findField(Integer page, Integer limit, String fieldName);
    public int deleteField(Integer fieldId);//根据id删除领域
    public int insertField(String fieldName);//增加领域

    public List<Field> selectAllFieldName();




}
