package com.cykj.service.impl;

import com.cykj.entity.ProjectInfo;
import com.cykj.mapper.ProjectInfoMapper;
import com.cykj.service.ProjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Resource
    ProjectInfoMapper projectInfoMapper;

    /**
     * 查询所有企业发布的项目
     *
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<ProjectInfo> findProjectAll(Map<String, Object> condition, int page, int limit) {
        return projectInfoMapper.findProjectAll(condition, page, limit);
    }

    /**
     * 查询记录数
     *
     * @param condition
     * @return
     */
    @Override
    public int findRecords(Map<String, Object> condition) {
        return projectInfoMapper.findRecords(condition);
    }

    /**
     * 查询项目
     *
     * @param projectInfo
     * @return
     */
    @Override
    public ProjectInfo findProject(ProjectInfo projectInfo) {
        return projectInfoMapper.findProject(projectInfo);
    }


}
