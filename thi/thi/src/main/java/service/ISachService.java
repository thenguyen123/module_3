package service;

import model.Sach;

import java.util.List;

public interface ISachService {
    List<Sach> findAll();
    Sach findByID(int id);
}
