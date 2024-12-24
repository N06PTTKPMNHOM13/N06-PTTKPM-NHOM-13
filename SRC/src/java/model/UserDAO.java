package model;

import entity.User;

public interface UserDAO {

    public boolean userRegister(User u);
    
    public User login(String email, String password);
    
    public boolean checkPassword(int id, String pass);
    
    public boolean updateProfile(User u);
    
    public User getUserById(int id);
}
