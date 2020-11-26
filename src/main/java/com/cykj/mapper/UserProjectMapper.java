package com.cykj.mapper;

import com.cykj.entity.UserProject;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 用户项目申请
 */
public interface UserProjectMapper {

    /**
     * 用户申请项目
     * @param userProject
     * @return
     */
    int addUserProject(UserProject userProject);

    /**
     * 用户订单列表
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    List<UserProject> findUserProjectByPage(@Param("condition") Map<String,Object> condition, @Param("page") int page, @Param("limit")int limit);

    /**
     * 查询用户订单列表记录数
     * @param condition
     * @return
     */
    int findUserProjectRecord(@Param("condition") Map<String,Object> condition);


    /**
     * 查询用户的项目
     * @param userProject
     * @return
     */
    List<UserProject> findUserProjectAll(UserProject userProject);

    /**
     * 修改状态
     * @param userProject
     * @return
     */
    int changeState(UserProject userProject);
}
