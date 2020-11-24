package com.cykj.socket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cykj.entity.CompRecord;
import com.cykj.service.BackCompService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

/**
 * WebSocket服务
 */
@RestController
@RequestMapping("/websocket")
@ServerEndpoint(value = "/websocket/{username}", configurator = MyEndpointConfigure.class)
public class WebSocketServer {

    /**
     * 在线人数
     */
    private static int onlineCount = 0;
    private String bUserID;
    private String userID;
    /**
     * 在线用户的Map集合，key：用户名，value：Session对象
     */
    private static Map<String, Session> sessionMap = new ConcurrentHashMap<>();
    private static Map<String, Session> backMap = new ConcurrentHashMap<>();

    /**
     * 注入其他类（换成自己想注入的对象）
     */
    @Resource
    private BackCompService backCompService;

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) throws UnsupportedEncodingException {

        String userBase64 = decodeBase64(username);
        System.out.println(userBase64);
        JSONObject job = JSONObject.parseObject(userBase64);
        String type = job.get("type").toString();
        String uID = job.get("userID").toString();
        if (type.equals("1")) {
            bUserID = uID;
            backMap.put(uID, session);
        } else {
            userID = uID;
            sessionMap.put(uID, session);
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        if(bUserID!=null){
            backMap.remove(bUserID);
        }else{
            sessionMap.remove(userID);
        }
    }

    /**
     * 服务器接收到客户端消息时调用的方法
     */
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        HashMap hashMap = new HashMap();
        System.out.println("message:"+ message);
        JSONObject job = JSONObject.parseObject(message);
        String type = job.get("type").toString();
        String srcUser = job.get("srcUser").toString();
        String tarUser = job.get("tarUser").toString();
        String messages = job.get("message").toString();
        System.out.println(job.get("message")+"-"+job.get("srcUser")+"-"+job.get("tarUser"));
        CompRecord compRecord = new CompRecord();
        if(type.equals("1")){
            compRecord.setCompanyId(Integer.parseInt(srcUser));
            compRecord.setUserId(Integer.parseInt(tarUser));
            compRecord.settUserId(0);
            compRecord.settCompId(Integer.parseInt(srcUser));
            compRecord.setRecored(messages);
            backCompService.addCompRec(compRecord);
            for (String s : sessionMap.keySet()) {
                if(s.equals(tarUser)){
                    hashMap.put("message",messages);
                    hashMap.put("tarUser",srcUser);
                    sessionMap.get(s).getBasicRemote().sendText(new ObjectMapper().writeValueAsString(hashMap));
                    break;
                }
            }
        }else{
            compRecord.setUserId(Integer.parseInt(srcUser));
            compRecord.settUserId(Integer.parseInt(srcUser));
            compRecord.setCompanyId(0);
            compRecord.settCompId(Integer.parseInt(tarUser));
            compRecord.setRecored(messages);
            backCompService.addCompRec(compRecord);
            for (String s : backMap.keySet()) {
                if(s.equals(tarUser)){
                    hashMap.put("message",messages);
                    hashMap.put("tarUser",srcUser);
                    backMap.get(s).getBasicRemote().sendText(new ObjectMapper().writeValueAsString(hashMap));
                    break;
                }
            }
        }
    }

    /**
     * 发生错误时调用
     */
    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }

    private static String decodeBase64(String str) throws UnsupportedEncodingException {
        byte[] decode = Base64.getDecoder().decode(str);
        String decodeStr = new String(decode);
        return URLDecoder.decode(decodeStr,"UTF-8");
    }

}
