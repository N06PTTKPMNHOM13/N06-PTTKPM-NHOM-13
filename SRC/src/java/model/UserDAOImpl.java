package model;

import entity.User;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {

    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User u) {
        boolean f = false;
        try {
            String sql = "insert into [user](name, email, phone, password, role) values(?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhone());
            ps.setString(4, u.getPassword());
            ps.setInt(5, u.getRole());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) {
        User u = null;
        try {
            String sql = "select * from [user] where email = ? and password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPhone(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setRole(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    @Override
    public boolean checkPassword(int id, String pass) {
        boolean f = false;
        try {
            String sql = "select * from [user] where id = ? and password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
        }
        return f;
    }

    @Override
    public boolean updateProfile(User u) {
        boolean f = false;
        try {
            String sql = "update [user] set name = ?, email = ?, phone = ? where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhone());
            ps.setInt(4, u.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User getUserById(int id) {
        User u = null;
        try {
            String sql = "select * from [user] where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPhone(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setRole(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }
    
    public boolean checkUser(String email) {
        boolean f = true;
        try {
            String sql = "select * from [user] where email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean changePass(User u) {
        boolean f = false;
        try {
            String sql = "update [user] set password = ? where id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getPassword());
            ps.setInt(2, u.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
