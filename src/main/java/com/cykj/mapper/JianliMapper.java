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
    //    查找沟通过公司
    public List<BackUser> communication(@Param("userId")int userId,@Param("page")int page,@Param("size")int size);
    public List<BackUser> communicationCount(@Param("userId")int userId);
//    删除感兴趣岗位
//    public int postPositionDel(@Param("pPostId")int pPostId);
    public int pcDel(@Param("userId")int userId,@Param("pPostId")int pPostId);
//    添加刚兴趣岗位
    public int pcInsert(@Param("userId")int userId,@Param("pPostId")int pPostId);
//    查看岗位是否有被收藏
    public PostCellec findPostCellec(@Param("userId")int userId,@Param("pPostId")int pPostId);

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
//    简历投递
    public int sendResume(@Param("userId")int userId,@Param("pPostId")int pPostId);

//    查找手机号是否存在
    public List<UserInfo> findTtelephone(@Param("telephone")String telephone);
//    修改简历联系方式
    public int updatePhone(UserInfo userInfo);
    //查看反馈信息
    public  List<PostPosition> deliveryInfoCount(@Param("userId")int userId);
    public List<PostPosition> deliveryInfo(@Param("userId")int userId,@Param("page")int page,@Param("limit")int limit);

//    修改简历时间
    public int updateResumeTime(Resume resume);

//    查看所有职位类型
//    public List<Position> positions();
    public List<Industry> industrys();
//    查看所有城市
    public List<City> citys(@Param("begin")int begin,@Param("end")int end);
//    修改简历头像
    public int updatePhoto(Resume resume);
    public int updateHeadImgUrl(UserInfo userInfo);

//    查看是否有投递过该岗位的简历
    public Delivery findDelivery(@Param("userId")int userId,@Param("pPostId")int pPostId);

//    修改用户名
    public int updateName(UserInfo userInfo);

//    岗位被点击次数
    public int clicks(@Param("pPostId")int pPostId);
//    岗位收到简历次数
    public int postNum(@Param("pPostId")int pPostId);
}
