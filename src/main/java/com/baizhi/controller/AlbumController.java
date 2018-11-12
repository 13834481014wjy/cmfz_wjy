package com.baizhi.controller;

import com.baizhi.entity.Album;

import com.baizhi.service.AlbumService;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        Map<String,Object> results=new HashMap<String,Object>();
        List<Album> albums = albumService.findByPage(page, rows);
        Long totals = albumService.findTotals();
        results.put("total",totals);
        results.put("rows",albums);

        return results;
    }

    @RequestMapping("/insert")
    public @ResponseBody Map<String,Object> insert(Album album, MultipartFile multipartFile, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //上传
            String file = FileUtil.saveFile(multipartFile, "/picture/album/", request);
            album.setCoverImg(file);

            albumService.addAlbum(album);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Album  queryOne(String id){
        return  albumService.findAlbum(id);
    }

}
