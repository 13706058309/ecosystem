package com.cykj.mapper;

import com.cykj.util.TaskInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMppMapper {
    /**
     * 插入project数据
     * @param projectMpps
     * @return
     */
    int addProjectMpp(@Param("projectMpps") List<TaskInfo> projectMpps);
    int delProjectMpp(@Param("projectId") int projectId);
}
