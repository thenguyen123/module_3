package repository.employee.impl;

import model.employee.Division;
import model.employee.Position;
import repository.DataBase;
import repository.employee.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private  final String SELECT="select *from position";
    @Override
    public List<Position> findAll() {
        List<Position> list=new ArrayList<>();
        Connection connection= DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("position_id");
                String name=resultSet.getString("name_position");
               Position position=new Position(id,name);
                list.add(position);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

}
