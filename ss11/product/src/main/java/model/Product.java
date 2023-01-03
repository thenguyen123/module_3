package model;

public class Product {
    private  int id;
    private String name;
    private double prices;
    private String description;

    public Product(int id, String name, double prices, String description) {
        this.id = id;
        this.name = name;
        this.prices = prices;
        this.description = description;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrices() {
        return prices;
    }

    public void setPrices(double prices) {
        this.prices = prices;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
