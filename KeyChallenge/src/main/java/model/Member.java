package model;

import java.io.Serializable;

public class Member implements Serializable {
   private String id;
   private String pwd;
   private String nickName;
   private String birth;
   private int stampCount;
   private String character;
   private String gender;
   private int ranking;

   public Member(String id, String pwd, String nickName, String birth, int stampCount, String character,
         String gender, int ranking) {
      super();
      this.id = id;
      this.pwd = pwd;
      this.nickName = nickName;
      this.birth = birth;
      this.stampCount = stampCount;
      this.character = character;
      this.gender = gender;
      this.ranking = ranking;
   }
   
   public Member(String id, String pwd, String nickName, String birth, String character,
	         String gender) {
	      super();
	      this.id = id;
	      this.pwd = pwd;
	      this.nickName = nickName;
	      this.birth = birth;
	      this.character = character;
	      this.gender = gender;
	   }


   public Member() {
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getNickName() {
      return nickName;
   }

   public void setNickName(String nickName) {
      this.nickName = nickName;
   }

   public String getBirth() {
      return birth;
   }

   public void setBirth(String birth) {
      this.birth = birth;
   }

   public String getCharacter() {
      return character;
   }

   public void setCharacter(String character) {
      this.character = character;
   }

   public int getStampCount() {
      return stampCount;
   }

   public void setStampCount(int stampCount) {
      this.stampCount = stampCount;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public int getRanking() {
      return ranking;
   }

   public void setRanking(int ranking) {
      this.ranking = ranking;
   }

}
