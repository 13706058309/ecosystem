package com.cykj.log;

import com.cykj.entity.BackLog;
import com.cykj.mapper.BackLogMapper;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Component
public class BackLogServiceImpl implements BackLogService {

    @Resource
    private BackLogMapper backLogMapper;

    @Override
    public List<BackLog> findLogOnPage(Map<String, Object> map, int curPage, int limit) {
        map.put("limit",limit);
        map.put("offset",(curPage-1)*limit);
        List<BackLog> allOnPage = backLogMapper.findLogOnPage(map);
        return allOnPage;
    }


    @Override
    public int findLogNum(Map<String, Object> map) {
        int all = backLogMapper.findLogNum(map);

        return all;
    }

    @Override
    public int addBackLog(BackLog backLog) {
        System.out.println("进入日志!");
        int n = backLogMapper.addBackLog(backLog);
        return n;
    }
}
