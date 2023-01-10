package repository.employee.impl;

import model.employee.Division;
import repository.DataBase;
import repository.employee.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private  final  String SELECT="select *from division";
    @Override
    public List<Division> findAll() {
        List<Division> list=new ArrayList<>();
        Connection connection= DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("division_id");
                String name=resultSet.getString("name_division");
                Division division=new Division(id,name);
                list.add(division);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
