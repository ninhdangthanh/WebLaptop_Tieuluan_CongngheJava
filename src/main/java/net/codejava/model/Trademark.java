package net.codejava.model;


public class Trademark {

    private int id;

    private String trademark_name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTrademark_name() {
        return trademark_name;
    }

    public void setTrademark_name(String trademark_name) {
        this.trademark_name = trademark_name;
    }

    @Override
    public String toString() {
        return "Trademark{" +
                "id=" + id +
                ", trademark_name='" + trademark_name + '\'' +
                '}';
    }
}
