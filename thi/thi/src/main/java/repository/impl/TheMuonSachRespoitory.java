package repository.impl;

import model.HocSinh;
import model.Sach;
import model.TheMuonSach;
import repository.DataBase;
import repository.ITheMuonRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class TheMuonSachRespoitory implements ITheMuonRepository {
    private String SELECT="select *from the_muon join sach on the_muon.ma_sach=sach.ma_sach join hoc_sinh on the_muon.ma_hoc_sinh=hoc_sinh.ma_hoc_sinh;";
    @Override
    public List<TheMuonSach> findAll() {
        Connection connection= DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int ma=resultSet.getInt("ma");
                int maSach=resultSet.getInt("ma_sach");
                int maHocSinh=resultSet.getInt("ma_hoc_sinh");
                String tenHocSinh=resultSet.getString("ten_hoc_sinh");
                String tenSach=resultSet.getString("ten_sach");
                Sach sach=new Sach(maSach,tenSach);
                HocSinh hocSinh=new HocSinh(maHocSinh,tenHocSinh);


            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        //    private int ma;
        //    private Sach maSach;
        //    private HocSinh maHocSinh;
        //    private  String trangThai;
        //    private String ngayMuon;
        //    private String ngayTra;
        return null;
    }
}
