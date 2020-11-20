package com.cykj.log;

import com.cykj.entity.BackLog;

import java.util.List;
import java.util.Map;

public interface BackLogService {


    List<BackLog> findLogOnPage(Map<String, Object> map, int page, int limit);
    int findLogNum(Map<String, Object> map);
    int addBackLog(BackLog backLog);

}
