package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService {

    void addGuru(Guru guru);
    void removeGuru(String id);
    List<Guru> findAllGuru(Integer page,Integer rows);
    Long findTotals();
    Guru findOneGuru(String id);
    void removeAll(String[] ids);

    List<Guru> findAllGuruName();

}
