package loginpack;

import beans.UserBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;
	
	
    public static UserBean login(UserBean bean) {
	
    //preparing some objects for connection 
        Statement stmt = null;    
	
        String username = bean.getUsername();    
        String password = bean.getPassword();
        String role = bean.getRole();
	String searchQuery1 ="select * from user_login where Username='"
                        + username
                        + "' AND Password=ENCODE('"+password+"','helloworld')";
	String searchQuery2 = "select FirstName,LastName from user_info where Username='"+username+"'";   
        // "System.out.println" prints in the console; Normally used to trace the process
        System.out.println("Your user name is " + username);          
        System.out.println("Your password is " + password);
        System.out.println("Query: "+searchQuery1);

        try 
        {
            //connect to DB 
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery1);	        
            boolean more = rs.next();
            // if user does not exist set the isValid variable to false
            if (!more) 
            {   
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                bean.setValid(false);
                bean.setRole(rs.getString("role"));
            } 

            //if user exists set the isValid variable to true
            else if (more) 
            {
                rs = stmt.executeQuery(searchQuery2);
                rs.next();
                System.out.println("Welcome ");
                bean.setValid(true);
            }
        } 

        catch (Exception ex) 
        {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
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

        return bean;
    }
    public static boolean checkUsername(String username,String role) {
	
    //preparing some objects for connection 
        Statement stmt = null;    
	String searchQuery ="SELECT * FROM user_login WHERE Username='"+ username+ "' AND Role='"+ role +"'";
        try 
        {
            //connect to DB 
            currentCon = loginpack.ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);	        
            boolean more = rs.next();
            // if user does not exist return true
            if (!more) 
            {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                return true;
            } 
            //if user exists return false
            else
            {
                return false;
            }
        }catch (Exception ex){
            System.out.println("Log In failed: An Exception has occurred! " + ex);
            return false;
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
    public static boolean executeQuery(String query){
        Statement stmt = null;
	int result = 0;
	try 
        {
            //connect to DB 
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            result = stmt.executeUpdate(query);	        
            
            if (result > 0){
                return true;
            }else{
                return false;
            }
            
        }catch (SQLException ex){
            System.out.println("Execution of the Query "+ query+" failed  " + ex.getMessage());
            return false;
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
    
    public static boolean insert(String insertQuery){
        Statement stmt = null;
	int result = 0;
	try 
        {
            //connect to DB 
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            result = stmt.executeUpdate(insertQuery);	        
            
            // if insertion fails
            if (result > 0){
                return true;
            } 
            //if insertion succeed thenreturn false
            else{
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                return false;
            }
        }catch (Exception ex){
            System.out.println("Insertion into user_login table failed: An Exception has occurred! " + ex);
            return false;
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
    
}

