package entity;

public class CarDetails {

    private int carId, quantity;
    private String carName,price,year, carCategory, photo;

    public CarDetails() {
    }

    public CarDetails(String carName, String price, String categories, String year, String fileName, int quantity) {
    }

    @Override
    public String toString() {
        return "CarDetails{" + "carId=" + carId + ", quantity=" + quantity + ", carName=" + carName + ", price=" + price + ", carCategory=" + carCategory + ", year=" + year + ", photo=" + photo + '}';
    }

    public CarDetails(int carId, int quantity, String carName, String price, String carCategory, String year, String photo) {
        this.carId = carId;
        this.quantity = quantity;
        this.carName = carName;
        this.price = price;
        this.carCategory = carCategory;
        this.year = year;
        this.photo = photo;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCarCategory() {
        return carCategory;
    }

    public void setCarCategory(String carCategory) {
        this.carCategory = carCategory;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

}
    