package repository.facility_repository;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAdd();
    boolean save(Facility facility);
    boolean update(Facility facility);
    boolean delete(int id);
    List<Facility> find(String name);
    Facility findByID(int id);
}
