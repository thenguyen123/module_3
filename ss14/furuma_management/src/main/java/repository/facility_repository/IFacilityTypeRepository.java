package repository.facility_repository;

import model.facility.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> findAllType();
}
