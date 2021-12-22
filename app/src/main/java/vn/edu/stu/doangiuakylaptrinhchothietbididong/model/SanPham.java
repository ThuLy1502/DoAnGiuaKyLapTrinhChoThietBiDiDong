package vn.edu.stu.doangiuakylaptrinhchothietbididong.model;

import java.io.Serializable;

public class SanPham implements Serializable{
    private int id;
    private String tensp;
    private String phanloai;
    private byte[] hinhanh;
    private String gia;
    private String kichthuoc;

    public SanPham(int id, String tensp, String phanloai, byte[] hinhanh, String gia, String kichthuoc) {
        this.id = id;
        this.tensp = tensp;
        this.phanloai = phanloai;
        this.hinhanh = hinhanh;
        this.gia = gia;
        this.kichthuoc = kichthuoc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getPhanloai() {
        return phanloai;
    }

    public void setPhanloai(String phanloai) {
        this.phanloai = phanloai;
    }

    public byte[] getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(byte[] hinhanh) {
        this.hinhanh = hinhanh;
    }

    public String getGia() {
        return gia;
    }

    public void setGia(String gia) {
        this.gia = gia;
    }

    public String getKichthuoc() {
        return kichthuoc;
    }

    public void setKichthuoc(String kichthuoc) {
        this.kichthuoc = kichthuoc;
    }
}
