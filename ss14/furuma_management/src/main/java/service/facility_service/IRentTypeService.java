package service.facility_service;

import model.facility.RentType;

import java.util.List;

public interface IRentTypeService {
    List<RentType> findAllRent();
}
