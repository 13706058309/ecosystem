package com.cykj.service;

import com.cykj.entity.CerUser;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface CerUserService {
    /**
     *
     * @param userid
     * @return查询用户已获得的证书集合
     */
    public List<CerUser> findceruserlist(@RequestParam("userid") long userid);
}
