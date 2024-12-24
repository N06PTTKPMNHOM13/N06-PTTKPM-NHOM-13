package model;

import entity.Cart;
import java.util.List;

public interface CartDAO {
    
    public boolean addcart(Cart c);
    
    public List<Cart> getCarByUser(int userId);
    
    public boolean removeCar(int carId, int uId, int cId);
}
