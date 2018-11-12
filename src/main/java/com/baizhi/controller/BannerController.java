package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("/banner")
public class BannerController {

    @Autowired
    private BannerService bannerService;

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAllBanner(Integer page,Integer rows){
        Map<String,Object> results=new HashMap<String,Object>();
        //当前数据rows
        List<Banner> banners = bannerService.findByPage(page, rows);
        //总记录数
        Long totals = bannerService.findTotals();
        results.put("total",totals);
        results.put("rows",banners);
        return results;
    }
    @RequestMapping("/insert")
    public @ResponseBody Map<String,Object> insert(Banner banner, MultipartFile imgOne, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //上传
            String file = FileUtil.saveFile(imgOne, "/picture/banner/", request);
            banner.setImgPath(file);

            bannerService.addBanner(banner);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id,HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //删除图片
            Banner oneBanner = bannerService.findOneBanner(id);
            FileUtil.deleteFile(oneBanner.getImgPath(),request);

            bannerService.removeBanner(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }


    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Banner banner,String id,MultipartFile imgTwo, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //删除原来的图片
            Banner oneBanner = bannerService.findOneBanner(id);
            String s = FileUtil.udpateFile(imgTwo, oneBanner.getImgPath(), "/picture/banner/", request);

            banner.setImgPath(s);
            bannerService.modifyBanner(banner);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Banner queryOne(String id){
        return  bannerService.findOneBanner(id);
    }


    @RequestMapping("/deleteAll")
    public @ResponseBody Map<String,Object> deleteAll(String[] ids){
        Map<String,Object> results = new HashMap<>();
        try {
            bannerService.removeAll(ids);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }


}
