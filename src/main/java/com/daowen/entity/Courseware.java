package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Courseware
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
   private String tupian ;
   public String getTupian() 
   {
      return tupian;
  }
   public void setTupian(String tupian) 
   {
      this.tupian= tupian;
  }
   private int typeid ;
   public int getTypeid() 
   {
      return typeid;
  }
   public void setTypeid(int typeid) 
   {
      this.typeid= typeid;
  }
   private String typename ;
   public String getTypename() 
   {
      return typename;
  }
   public void setTypename(String typename) 
   {
      this.typename= typename;
  }
   private int clickout ;
   public int getClickout() 
   {
      return clickout;
  }
   public void setClickout(int clickout) 
   {
      this.clickout= clickout;
  }
   private int dwcount ;
   public int getDwcount() 
   {
      return dwcount;
  }
   public void setDwcount(int dwcount) 
   {
      this.dwcount= dwcount;
  }
   private String pubren ;
   public String getPubren() 
   {
      return pubren;
  }
   public void setPubren(String pubren) 
   {
      this.pubren= pubren;
  }
   private Date pubtime ;
   public Date getPubtime() 
   {
      return pubtime;
  }
   public void setPubtime(Date pubtime) 
   {
      this.pubtime= pubtime;
  }
   private String fileurl ;
   public String getFileurl() 
   {
      return fileurl;
  }
   public void setFileurl(String fileurl) 
   {
      this.fileurl= fileurl;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
}
