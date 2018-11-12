package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/guru")
public class GuruController {

    @Autowired
    private GuruService guruService;

    @RequestMapping("/findAll")
    public @ResponseBody Map<String, Object> findAll(Integer page,Integer rows){
        Map<String,Object> result=new HashMap<String,Object>();
        //当前数据rows
        List<Guru> allGuru = guruService.findAllGuru(page, rows);
        //总条数
        Long totals = guruService.findTotals();
        result.put("total",totals);
        result.put("rows",allGuru);
        return result;
    }

    @RequestMapping("/insert")
    public @ResponseBody Map<String,Object> insert(Guru guru, MultipartFile imgThree, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //上传
            String file = FileUtil.saveFile(imgThree, "/picture/guru/", request);
            guru.setHeadPic(file);

            guruService.addGuru(guru);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //删除图片
            Guru oneGuru = guruService.findOneGuru(id);
            FileUtil.deleteFile(oneGuru.getHeadPic(),request);

            guruService.removeGuru(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/deleteAll")
    public @ResponseBody Map<String,Object> deleteAll(String ids[]){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            guruService.removeAll(ids);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/findAllName")
    public @ResponseBody List<Guru> findAllName(){
        List<Guru> allGuruName = guruService.findAllGuruName();
        return allGuruName;
    }

}
