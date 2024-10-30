package bai_tap11.model;


public class Book {
    private int id;
    private String title;
    private int pageSize;
    private String author;
    private String category;
    private String image;
    public Book(int id, String title, int pageSize, String author, String category,String image) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
        this.image = image;
    }
    public Book() {
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public int getPageSize() {
        return pageSize;
    }

    public String getAuthor() {
        return author;
    }

    public String getCategory() {
        return category;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}