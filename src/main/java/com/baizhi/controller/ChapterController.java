package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.FileUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/chapter")
public class ChapterController {

    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/insert")
    public @ResponseBody Map<String,Object> insert(Chapter chapter, MultipartFile multipartFile, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //上传
            String file = FileUtil.saveFile(multipartFile, "/picture/album/", request);
            //文件大小
            Double size = FileUtil.AudioSize(file, request);

            //时长
            String duration = FileUtil.AudioLength(file, request);

            chapter.setSize(size+"M");
            chapter.setDuration(duration);
            chapter.setDownPath(file);

            chapterService.addChapter(chapter);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/download")
    public @ResponseBody void download(String fileName,String openStyle, HttpServletRequest request, HttpServletResponse response) throws Exception{
        //1.根据接收的文件名去服务中指定目录读取文件open
        String realPath = request.getSession().getServletContext().getRealPath("/");
        //2.以文件输入流读取文件
        FileInputStream is = new FileInputStream(new File(realPath,fileName));
        //2.1 设置响应头
        response.setHeader("content-disposition", openStyle+";fileName="+URLEncoder.encode(fileName, "UTF-8"));
        //3.获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //4.使用IOUtils工具类
        IOUtils.copy(is, os);
        //5.关流
        IOUtils.closeQuietly(is);//安静关流
        IOUtils.closeQuietly(os);

    }
}
