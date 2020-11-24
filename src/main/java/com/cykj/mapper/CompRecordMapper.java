package com.cykj.mapper;

import com.cykj.entity.CompRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 公司记录
 */
public interface CompRecordMapper {

    List<CompRecord> findCompChatRec(@Param("compID") int compID);

    List<CompRecord> findChatRec(@Param("compID") int compID, @Param("userID") int userID);

    List<CompRecord> getChatComp(@Param("userID") int userID);
    //用户具体查找和企业的聊天纪律
    List<CompRecord> findChatRecs(@Param("compID") int compID, @Param("userID") int userID);
    //添加聊天纪律
    int addCompRec(CompRecord compRecord);
}
