package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Billrecord
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
   private int fee ;
   public int getFee() 
   {
      return fee;
  }
   public void setFee(int fee) 
   {
      this.fee= fee;
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
   private int xtype ;
   public int getXtype() 
   {
      return xtype;
  }
   public void setXtype(int xtype) 
   {
      this.xtype= xtype;
  }
   private String operdes ;
   public String getOperdes() 
   {
      return operdes;
  }
   public void setOperdes(String operdes) 
   {
      this.operdes= operdes;
  }
   private int zyid ;
   public int getZyid() 
   {
      return zyid;
  }
   public void setZyid(int zyid) 
   {
      this.zyid= zyid;
  }
   private String zytitle ;
   public String getZytitle() 
   {
      return zytitle;
  }
   public void setZytitle(String zytitle) 
   {
      this.zytitle= zytitle;
  }
}
