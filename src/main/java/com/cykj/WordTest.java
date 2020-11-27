package com.cykj;



import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WordTest {
    private Configuration configuration = null;

    public WordTest(){
        configuration = new Configuration();
        configuration.setDefaultEncoding("UTF-8");
    }

    public static void main(String[] args) {
        File file = new File("/upload");
        System.out.println(file.getAbsolutePath());
        System.out.println(file.exists());
        if(!file.exists())  file.mkdirs();
        WordTest test = new WordTest();
        test.createWord();
    }

    public void createWord(){
        Map<String,Object> dataMap=new HashMap<String,Object>();
        getData(dataMap);
        configuration.setClassForTemplateLoading(this.getClass(), "");//模板文件所在路径
        Template t=null;
        try {
            t = configuration.getTemplate("123.ftl"); //获取模板文件
        } catch (IOException e) {
            e.printStackTrace();
        }
        File outFile = new File("E:/outFile"+Math.random()*10000+".doc"); //导出文件
        if(!outFile.exists()) outFile.mkdirs();
        Writer out = null;
        try {
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }

        try {
            t.process(dataMap, out); //将填充数据填入模板文件并输出到目标文件
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getData(Map<String, Object> dataMap) {
        dataMap.put("title", "标题");
        dataMap.put("nian", "2016");
        dataMap.put("yue", "3");
        dataMap.put("ri", "6");
        dataMap.put("shenheren", "lc");

        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        for (int i = 0; i < 10; i++) {
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("name", i);
            map.put("sex", "内容"+i);
            list.add(map);
        }


        dataMap.put("list", list);
    }
}
