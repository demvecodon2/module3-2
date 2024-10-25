package model;

import java.util.Date;

public class Posts {
    int id;
    String username;
    String title;
    String description;
    Date post_data;
    String image_url;
    int like;
    String status;
    public Posts(int id, String username, String title, String description, Date post_data, String image_url, int like, String status) {
        this.id = id;
        this.username = username;
        this.title = title;
        this.description = description;
        this.post_data = post_data;
        this.image_url = image_url;
        this.like = like;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getPost_data() {
        return post_data;
    }

    public void setPost_data(Date post_data) {
        this.post_data = post_data;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
