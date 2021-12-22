package vn.edu.stu.doangiuakylaptrinhchothietbididong.model;

import java.io.Serializable;

public class ThuongHieu implements Serializable {
    String idth;
    String tenth;

    @Override
    public String toString() {
        return idth + " - " + tenth;
    }

    public String getIdth() {
        return idth;
    }

    public void setIdth(String idth) {
        this.idth = idth;
    }

    public String getTenth() {
        return tenth;
    }

    public void setTenth(String tenth) {
        this.tenth = tenth;
    }

    public ThuongHieu(String idth, String tenth) {
        this.idth = idth;
        this.tenth = tenth;
    }
}
