package repository.facility_repository.impl;

import model.facility.RentType;
import repository.DataBase;
import repository.facility_repository.IRentType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class RentTypeRepository implements IRentType {
    private  final String SELECT_ALL=" select*from rent_type;";
    @Override
    public List<RentType> findAllRent() {
        List<RentType> rentTypeList=new ArrayList<>();
        Connection connection=DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("rent_type_id");
                String name=resultSet.getString("rent_type_name");
                RentType rentType=new RentType(id,name);
                rentTypeList.add(rentType);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
