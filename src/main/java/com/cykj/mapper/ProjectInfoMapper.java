package com.cykj.mapper;

import com.cykj.entity.ProjectInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 企业发布的项目
 */
@Mapper
@Repository
public interface ProjectInfoMapper {
    /**
     * 查询项目列表
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    List<ProjectInfo> findProjectAll(@Param("condition")Map<String,Object> condition ,@Param("page") int page,@Param("limit") int limit);

    /**
     * 查询项目列表记录数
     * @param condition
     * @return
     */
    int findRecords(@Param("condition")Map<String,Object> condition);

    /**
     * 查询单个项目详细信息
     * @param projectInfo
     * @return
     */
    ProjectInfo findProject(ProjectInfo projectInfo);

}
