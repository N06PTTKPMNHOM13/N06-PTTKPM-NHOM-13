package model;

import entity.CarDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import db.DBConnect;

public class CarDaoImpl implements CarDao {

    private Connection conn;

    public CarDaoImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean addCars(CarDetails car) {
        boolean f = false;
        try {
            String sql = "insert into car_details(carName, price, carCategory, year, quantity, photo) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, car.getCarName());
            ps.setString(2, car.getPrice());
            ps.setString(3, car.getCarCategory());
            ps.setString(4, car.getYear());
            ps.setInt(5, car.getQuantity());
            ps.setString(6, car.getPhoto());

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
    public List<CarDetails> getAllCars() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public CarDetails getCarById(int carId) {
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, carId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return car;
    }

    @Override
    public boolean editCars(CarDetails car) {
        boolean f = false;
        try {
            String sql = "update car_details set carName = ?, price = ?, year = ?, quantity = ?"
                    + " where carId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, car.getCarName());
            ps.setString(2, car.getPrice());
            ps.setString(3, car.getYear());
            ps.setInt(4, car.getQuantity());
            ps.setInt(5, car.getCarId());

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
    public boolean deleteCars(int carId) {
        String sql = "delete from car_details where carId = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, carId);

            int i = ps.executeUpdate();
            return i > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    @Override
    public List<CarDetails> getNewArrivals() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> getTrending() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Trend");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> getSale() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Sale");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> getAllProducts() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> allProducts() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> newArrivals() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> trending() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Trend");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<CarDetails> sale() {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Sale");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateCarQuantity(int carId, int quantity) {
        boolean f = false;
        try {
            String sql = "update car_details set quantity = ? where carId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, carId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateCarYear(int carId, String year) {
        boolean f = false;
        try {
            String sql = "update car_details set year = ? where carId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, year);
            ps.setInt(2, carId);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<CarDetails> getCarBySearch(String key) {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "SELECT * FROM car_details WHERE carName LIKE ? ORDER BY year DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + key + "%"); // Set parameter for the search key
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CarDetails> getRelatedCars(CarDetails c) {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? and carId != ? and year = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getCarCategory());
            ps.setInt(2, c.getCarId());
            ps.setString(3, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CarDetails> allProducts(String orderBy) {
        List<CarDetails> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM car_details ORDER BY " + orderBy;
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CarDetails car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CarDetails> newArrivals(String orderBy) {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by " + orderBy;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CarDetails> trending(String orderBy) {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by " + orderBy;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Trend");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CarDetails> sale(String orderBy) {
        List<CarDetails> list = new ArrayList<>();
        CarDetails car = null;
        try {
            String sql = "select * from car_details where carCategory = ? order by " + orderBy;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Sale");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                car = new CarDetails();
                car.setCarId(rs.getInt(1));
                car.setCarName(rs.getString(2));
                car.setPrice(rs.getString(3));
                car.setCarCategory(rs.getString(4));
                car.setYear(rs.getString(5));
                car.setPhoto(rs.getString(6));
                car.setQuantity(rs.getInt(7));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
