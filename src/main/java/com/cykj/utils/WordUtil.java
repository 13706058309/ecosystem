package com.cykj.utils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import sun.misc.BASE64Encoder;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class WordUtil {

    private Configuration configuration = null;

    /****
     * 模板文件存放的目录
     */
    private static final String  baseDir = "C:/Users/Administrator/Desktop/progress/talentsystem/src/main/resources/tanlet";
    /***
     * 模板文件名称
     */
//    private static final String  templateFile = "talentResume.ftl";
//    private static final String  templateFile = "resume.ftl";
    /***
     * word生成的输出目录
     */
//    private static final String  outputDir = "C:/";

    public WordUtil(){
        configuration = new Configuration();
        configuration.setDefaultEncoding("UTF-8");
    }

    public static void main(String[] args) {
//        String path = WordUtil.class.getClassLoader().getResource("").getPath();
//        System.out.println(path);
//        String file = "/static/user/";
//        File file1 = new File(path, file);
//        if(!file1.exists()) file1.mkdirs();
//        WordUtil test = new WordUtil();
//        Map<String, Object> map = test.getMap();
//        String imgs = test.getImageBase("src");
//        map.put("image",imgs);
//        test.createWord(map);
//        test.createWord();
    }

    /*****
     *
     * Project Name: maventest
     * <p>转换成word<br>
     *
     * @author youqiang.xiong
     * @date 2019年2月21日  上午11:22:03
     * @version v1.0
     * @since
     */
    public String createWord(Map<String,Object> dataMap,String path,String outputDir){
//        Map<String,Object> dataMap=new HashMap<String,Object>();
        //构造参数
//        getData(dataMap);

        configuration.setClassForTemplateLoading(this.getClass(), "");//模板文件所在路径
        Template t=null;
        try {
            configuration.setDirectoryForTemplateLoading(new File(this.getClass().getClassLoader().getResource("").getPath()));
            t = configuration.getTemplate(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        File outFile = new File(outputDir,Math.random()*10000+".doc"); //导出文件
        System.out.println("123"+outFile.toString());
        Writer out = null;
        try {
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }

        try {
            t.process(dataMap, out); //将填充数据填入模板文件并输出到目标文件
            System.out.println("生成成功...");
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return outFile.toString();
    }

    /****
     *
     * Project Name: maventest
     * <p>初始化数据map <br>
     *
     * @author youqiang.xiong
     * @date 2019年2月21日  上午11:26:34
     * @version v1.0
     * @since
     * @param dataMap
     * 		封装数据的map
     */
    private void getData(Map<String, Object> dataMap) {
        dataMap.put("talentName", "刘德华");
        dataMap.put("school", "男");
        dataMap.put("birthday", "汉族");
        dataMap.put("profession", "1985-02-26");
        dataMap.put("politicalStatus", "春日部");
        dataMap.put("workExp", "党员");
        dataMap.put("contactInfo", "双叶幼稚园");
        dataMap.put("selfEva", "幼稚园");
        dataMap.put("education", "玩泥沙");
        dataMap.put("address", "NASA");
        dataMap.put("certificate", "煮菜的");
        dataMap.put("jobPlan", "煮菜的");
//        dataMap.put("postalAddress", "lc");
//        dataMap.put("postalcode", "lc");
//        dataMap.put("mobile", "18898416969");
//        dataMap.put("admissionTicket", "lc");
//        dataMap.put("enterSchoolTime", "lc");
//        dataMap.put("emergencyContact", "lc");
//        dataMap.put("readingInstrouction", "lc");
//        dataMap.put("year", "2019");
//        dataMap.put("month", "02");
//        dataMap.put("day", "20");

    }

    //获得图片的base64码
    public String getImageBase(String path) {

//        File file = new File(this.getClass().getClassLoader().getResource("").getPath(),"static/user/2020-11-18/66.jpg");
        File file = new File(this.getClass().getClassLoader().getResource("").getPath(),path);
        System.out.println(file);
        if(!file.exists()) {
            System.out.println("结束");
            return "";
        }
        InputStream in = null;
        byte[] data = null;
        try {
            in = new FileInputStream(file);
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        try {
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        BASE64Encoder encoder = new BASE64Encoder();
        System.out.println(encoder.encode(data));
        return encoder.encode(data);
    }


    public Map<String,Object> getMap(){
        Map<String,Object> map = new HashMap<>();
        map.put("realName",1);
        map.put("clan",1);
        map.put("politicalStatus",1);
        map.put("birthday",1);
        map.put("sex",1);
        map.put("workYear",1);
        map.put("education",1);
        map.put("profession",1);
        map.put("school",1);
        map.put("jobStand",1);
        map.put("expectWork",1);
        map.put("industry",1);
        map.put("address",1);
        map.put("contactInfo",1);
        map.put("selfEva",1);
        map.put("school1",1);
        map.put("schBegin1",1);
        map.put("edu1",1);
        map.put("schEnd1",1);
        map.put("school2",1);
        map.put("schBegin2",1);
        map.put("edu2",1);
        map.put("schEnd2",1);
        map.put("compName1",1);
        map.put("begin1",1);
        map.put("post1",1);
        map.put("end1",1);
        map.put("trade1",1);
        map.put("performace1",1);

        map.put("compName2",1);
        map.put("begin2",1);
        map.put("post2",1);
        map.put("end2",1);
        map.put("trade2",1);
        map.put("performace2",1);

        map.put("projectName1",1);
        map.put("proBegin1",1);
        map.put("proPost1",1);
        map.put("proEnd1",1);
        map.put("proDes1",1);
        map.put("proWork1",1);

        map.put("projectName2",1);
        map.put("proBegin2",1);
        map.put("proPost2",1);
        map.put("proEnd2",1);
        map.put("proDes2",1);
        map.put("proWork2",1);

        return map;
    }
}
