package model;

import entity.CarDetails;
import java.util.List;

public interface CarDao {
    
    public boolean addCars(CarDetails car);
    
    public List<CarDetails> getAllCars();
    
    public CarDetails getCarById(int carId);
    
    public boolean editCars(CarDetails car);
    
    public boolean deleteCars(int carId);
    
    public List<CarDetails> getAllProducts();
    
    public List<CarDetails> getNewArrivals();
    
    public List<CarDetails> getTrending();
    
    public List<CarDetails> getSale();
    
    public List<CarDetails> allProducts();
    
    public List<CarDetails> newArrivals();
    
    public List<CarDetails> trending();
    
    public List<CarDetails> sale();
}
