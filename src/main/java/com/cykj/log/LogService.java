package com.cykj.log;

import com.cykj.entity.BackLog;

import java.util.List;
import java.util.Map;

public interface LogService {

    public List<BackLog> findLogOnPage(Map<String, Object> map, int page, int limit);//后台日志管理

    public int findLogNum(Map<String, Object> map);//后台日志管理总记录数

    public int addLog(BackLog backLog);//增加日志


}
