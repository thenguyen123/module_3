package service.facility_service;

import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAdd();
    boolean save(Facility facility);
    boolean update(Facility facility);
    boolean delete(int id);
    List<Facility> find(String name);
    Facility findById(int id);
}
