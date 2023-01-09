package service.facility_service.impl;

import model.facility.FacilityType;
import repository.facility_repository.impl.FacilityRepository;
import repository.facility_repository.impl.FacilityTypeRepository;
import service.facility_service.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    FacilityTypeRepository facilityTypeRepository=new FacilityTypeRepository();
    @Override

    public List<FacilityType> findAllType() {
        return facilityTypeRepository.findAllType();
    }
}
