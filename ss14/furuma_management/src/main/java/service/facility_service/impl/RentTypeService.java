package service.facility_service.impl;

import model.facility.RentType;
import repository.facility_repository.impl.RentTypeRepository;
import service.facility_service.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    RentTypeRepository rentTypeRepository=new RentTypeRepository();
    @Override
    public List<RentType> findAllRent() {
        return rentTypeRepository.findAllRent();
    }
}
