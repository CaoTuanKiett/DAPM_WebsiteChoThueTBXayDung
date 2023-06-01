/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ADMIN
 */
public class Items {
    private int id;
    private Thietbi thietbi;
    private int quality;
    private double price;

    public Items() {
    }

    public Items(int id, Thietbi thietbi, int quality, double price) {
        this.id = id;
        this.thietbi = thietbi;
        this.quality = quality;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Thietbi getThietbi() {
        return thietbi;
    }

    public void setThietbi(Thietbi thietbi) {
        this.thietbi = thietbi;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
