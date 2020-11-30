package com.cykj.log;

import com.cykj.entity.BackLog;
import com.cykj.mapper.LogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class LogServiceImpI implements LogService {

    @Resource
    private LogMapper logMapper;

    @Override
    public List<BackLog> findLogOnPage(Map<String, Object> map, int curPage, int limit) {
        map.put("limit", limit);
        map.put("offset", (curPage - 1) * limit);
        List<BackLog> allOnPage = logMapper.findLogOnPage(map);
        return allOnPage;
    }

    @Override
    public int findLogNum(Map<String, Object> map) {
        int all = logMapper.findLogNum(map);
        return all;
    }

    @Override
    public int addLog(BackLog backLog) {
        System.out.println("增加日志");
        int n = logMapper.addLog(backLog);
        return n;
    }
}
