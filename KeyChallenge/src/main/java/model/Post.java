package model;

import java.time.LocalDate;
import java.util.Date;
import java.io.Serializable;

public class Post implements Serializable {

    private String postId;
    private String activity;
    private String photo;
    private String review;
    private String keyword; // db에 이미 저장되어있음 =
    private String date; 
    private int likeCount;
    private String likeId;
    private String id;
    
    public Post(String postId, String activity, String photo, String review, String keyword, String date, int likeCount, String likeId, String userId) {
        this.postId = postId;
        this.activity = activity;
        this.photo = photo;
        this.review = review;
        this.keyword = keyword;
        this.date = date;
        this.likeCount = likeCount;
        this.likeId = likeId;
        this.id = userId;
    }

    public Post() {
      // TODO Auto-generated constructor stub
   }

   public Post(String activity, String review, String postId) {
      this.activity = activity;
      this.review = review;
      this.postId = postId;
   }


   public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }  

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public String getLikeId() {
        return likeId;
    }

    public void setLikeId(String likeId) {
        this.likeId = likeId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    // 업데이트 시간 제한
//    public boolean canUpdatePost() {
//        // 현재 시간과 date를 비교하여 수정 가능 여부를 판단하는 로직
//        long now = System.currentTimeMillis();
//        long postTime = localDate.getTime();
//        long oneDayInMillis = 24 * 60 * 60 * 1000; // 하루를 밀리초로 계산
//        return (now - postTime) <= oneDayInMillis;
//    }
}
