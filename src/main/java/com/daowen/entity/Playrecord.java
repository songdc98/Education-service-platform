package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Playrecord
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
   private String accountname ;
   public String getAccountname() 
   {
      return accountname;
  }
   public void setAccountname(String accountname) 
   {
      this.accountname= accountname;
  }
   private String name ;
   public String getName() 
   {
      return name;
  }
   public void setName(String name) 
   {
      this.name= name;
  }
   private int mid ;
   public int getMid() 
   {
      return mid;
  }
   public void setMid(int mid) 
   {
      this.mid= mid;
  }
   private String mname ;
   public String getMname() 
   {
      return mname;
  }
   public void setMname(String mname) 
   {
      this.mname= mname;
  }
   private Date createtime ;
   public Date getCreatetime() 
   {
      return createtime;
  }
   public void setCreatetime(Date createtime) 
   {
      this.createtime= createtime;
  }
}
