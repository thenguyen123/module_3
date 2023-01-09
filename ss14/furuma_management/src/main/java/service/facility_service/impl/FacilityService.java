package service.facility_service.impl;

import model.facility.Facility;
import repository.facility_repository.impl.FacilityRepository;
import service.facility_service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    FacilityRepository facilityRepository=new FacilityRepository();
    @Override
    public List<Facility> findAdd() {
        return facilityRepository.findAdd();
    }

    @Override
    public boolean save(Facility facility) {
        return facilityRepository.save(facility);
    }

    @Override
    public boolean update(Facility facility) {
        return facilityRepository.update(facility);
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }

    @Override
    public List<Facility> find(String name) {
        return facilityRepository.find(name);
    }

    @Override
    public Facility findById(int id) {
        return facilityRepository.findByID(id);
    }
}
