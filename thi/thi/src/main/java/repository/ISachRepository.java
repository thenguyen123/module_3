package repository;

import model.Sach;

import java.util.List;
import java.util.Map;

public interface ISachRepository {
  List<Sach> finAll();
  Sach findByID(int id);


}
