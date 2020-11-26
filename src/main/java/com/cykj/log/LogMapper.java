package com.cykj.log;

import com.cykj.entity.BackLog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface LogMapper {
    List<BackLog> findLogOnPage(Map<String, Object> map);

    int findLogNum(Map<String, Object> map);

    int addLog(BackLog backLog);
}
