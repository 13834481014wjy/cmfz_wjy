package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService {
    List<Album> findByPage(Integer page,Integer rows);
    Long findTotals();
    void addAlbum(Album album);
    void removeAlbum(String id);
    Album findAlbum(String id);
}
