/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package signup;

import beans.UserBean;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import loginpack.ConnectionManager;

/**
 *
 * @author ADMIN
 */
public class UserRe {
    
    private String FirstName;
    private String LastName;
    private String Branch;
    private String AddreessLine1;
    private String AddressLine2;
    private String City;
    private String State;
    private String Country;
    private String Email;
    private String Gender;
    private String AboutYou;
    private java.util.Date DOB;
    private int Zip;
    private long Mob;
    private int collegeID;
    private UserBean user;
    
    public int getZip() {
        return Zip;
    }

    public long getMob() {
        return Mob;
    }

    public void setMob(long Mob) {
        this.Mob = Mob;
    }

    public void setZip(int Zip) {
        this.Zip = Zip;
    }

    public String getAboutYou() {
        return AboutYou;
    }

    public void setAboutYou(String AboutYou) {
        this.AboutYou = AboutYou;
    }

    public String getAddreessLine1() {
        return AddreessLine1;
    }

    public void setAddreessLine1(String AddreessLine1) {
        this.AddreessLine1 = AddreessLine1;
    }

    public String getAddressLine2() {
        return AddressLine2;
    }

    public void setAddressLine2(String AddressLine2) {
        this.AddressLine2 = AddressLine2;
    }

    public String getBranch() {
        return Branch;
    }

    public void setBranch(String Branch) {
        this.Branch = Branch;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getState() {
        return State;
    }

    public void setState(String State) {
        this.State = State;
    }

    public int getCollegeID() {
        return collegeID;
    }

    public void setCollegeID(int collegeID) {
        this.collegeID = collegeID;
    }

    public UserBean getUser() {
        return user;
    }

    public void setUser(UserBean username) {
        this.user = username;
    }
    public boolean update(){
        
        String insertQuery2 = "UPDATE `user_info` "
                + "SET `FirstName`='"+FirstName+"',"
                + " `LastName`='"+LastName+"',"
                + " `Branch`='"+Branch+"',"
                + " `CollegeID`="+collegeID+","
                + " `Add_Street`='"+AddreessLine1+"',"
                + " `Add_Line2`='"+AddressLine2+"',"
                + " `City`='"+City+"',"
                + " `State`='"+State+"',"
                + " `Country`='"+Country+"',"
                + " `Mobile`="+Mob+","
                + " `Email`='"+Email+"',"
                + " `Gender`='"+Gender+"',"
                + " `Zip`="+Zip+","
                + " `AboutYou`='"+AboutYou+"',"
                + " `DOB`='"+DOB+"' WHERE Username='"+user.getUsername()+"'";

        if(loginpack.UserDAO.executeQuery(insertQuery2)){
            return true;
        }
        return false;
    }
    public boolean insert(){
        
        String insertQuery2 = "INSERT INTO user_info (FirstName,"
                + "LastName,"
                + "Branch,"
                + "CollegeID,"
                + "Username,"
                + "Add_Street,"
                + "Add_Line2,"
                + "City,"
                + "State,"
                + "Country,"
                + "Mobile,"
                + "Email,"
                + "Gender,"
                + "Zip,"
                + "AboutYou,"
                + "DOB) VALUES('"+FirstName+"',"
                + "'"+LastName+"',"
                + "'"+Branch+"',"
                + collegeID+","
                + "'"+user.getUsername()+"',"
                + "'"+AddreessLine1+"',"
                + "'"+AddressLine2+"',"
                + "'"+City+"',"
                + "'"+State+"',"
                + "'"+Country+"',"
                + Mob+","
                + "'"+Email+"',"
                + "'"+Gender+"',"
                + Zip+","
                + "'"+AboutYou+"',"
                + "'"+DOB+"')" ;

        if(user.insert() && loginpack.UserDAO.executeQuery(insertQuery2)){
            return true;
        }
        return false;
    }
    public UserRe(){
        
    }
    public UserRe(UserBean uname){
        String selectQuery = "SELECT * FROM user_info WHERE Username='"+uname.getUsername()+"'";
        Connection currentCon = null;
        Statement stmt = null;
	ResultSet rs = null;
	try 
        {
            //connect to DB 
            currentCon = (Connection) ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(selectQuery);
            rs.next();
            this.FirstName = rs.getString("FirstName");
            this.LastName = rs.getString("LastName");
            this.Branch = rs.getString("Branch");
            this.collegeID = rs.getInt("CollegeId");
            this.AboutYou = rs.getString("AboutYou");
            this.AddreessLine1 = rs.getString("Add_Street");
            this.AddressLine2  = rs.getString("Add_Line2");
            this.City = rs.getString("City");
            this.Country = rs.getString("Country");
            this.State = rs.getString("State");
            this.Mob = rs.getLong("Mobile");
            this.Zip = rs.getInt("Zip");
            this.DOB = rs.getDate("DOB");
            this.Email = rs.getString("Email");
            this.Gender = rs.getString("Gender");
            this.user = uname;
            
        }catch (SQLException ex){
            System.out.println("Execution of the Query "+ selectQuery+" failed  " + ex.getMessage());
        } 
        //some exception handling
        finally 
        {
            if (rs != null)	{
                try {
                rs.close();
                } catch (Exception e) {}
                rs = null;
                }

            if (stmt != null) {
                try {
                stmt.close();
                } catch (Exception e) {}
                stmt = null;
                }

            if (currentCon != null) {
                try {
                currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }
    }
    
    public static void main(String []args){
        
    }
}
