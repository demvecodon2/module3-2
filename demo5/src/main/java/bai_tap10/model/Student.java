package bai_tap10.model;

public class Student {
    private String id;
    private String name;
    private boolean gender;
    private int score;
    private String anh;
    public Student() {
    }
    public Student(String id, String name, boolean gender, int score, String anh) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.score = score;
        this.anh = anh;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
