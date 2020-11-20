package com.cykj.service;

import org.apache.ibatis.annotations.Param;

public interface BackLogService {
    void insertLog(int buserid, String  matter);
}
