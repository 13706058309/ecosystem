package com.cykj.mapper;

import com.cykj.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface JianliMapper {
    public int insertid();
    public Resume resume(@Param("userid")long userid);
    public UserInfo findUser(@Param("userId")int userId);
    public int workInsert(WorkExperience workExperience);
    public int projectInsert(ProjectExperience projectExperience);
    public int educationInsert(EducationalBackground educationalBackground);

    public int rwInsert(@Param("weId")int weId,@Param("resumeId")int resumeId);
    public int rpInsert(@Param("peId")int peId,@Param("resumeId")int resumeId);
    public int reInsert(@Param("ebId")int ebId,@Param("resumeId")int resumeId);

    public int rwDel(@Param("weId")int weId,@Param("resumeId")int resumeId);
    public int rpDel(@Param("peId")int peId,@Param("resumeId")int resumeId);
    public int reDel(@Param("ebId")int ebId,@Param("resumeId")int resumeId);


    public int workDel(@Param("weId")int weId);
    public int projectDel(@Param("peId")int peId);
    public int educationDel(@Param("ebId")int ebId);

    public int resumeUpdate(Resume resume);
    public int workUpdate(WorkExperience workExperience);
    public int projectUpdate(ProjectExperience projectExperience);
    public int educationUpdate(EducationalBackground educationalBackground);

    public int selfEvaUpdate(Resume resume);
    public int expectWorkUpdate(Resume resume);

//    查找感兴趣岗位
    public List<PostPosition> findPosts(@Param("userId")int userId,@Param("page")int page,@Param("size")int size);
    public List<PostPosition> findPostsCount(@Param("userId")int userId);
//    删除感兴趣岗位
//    public int postPositionDel(@Param("pPostId")int pPostId);
    public int pcDel(@Param("userId")int userId,@Param("pPostId")int pPostId);

    //    查找投递岗位
    public List<PostPosition> deliveryPosts(@Param("userId")int userId,@Param("page")int page,@Param("size")int size);
    public List<PostPosition> deliveryPostsCount(@Param("userId")int userId);
    public List<PostPosition> jobsCount(Map map);

    public List<PostPosition> jobs(Map map);

//    查找岗位详情
    public PostPosition findPost(@Param("pPostID")int pPostID);

    public UserInfo findpwd(Map map);
    public int savepwd(Map map);
    public int saveShow(Map map);
}
