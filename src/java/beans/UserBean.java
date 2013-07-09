package beans;

public class UserBean {
	
      private String username;
      private String password;
      private String role;
      
      public boolean valid;
	
	
      
      public String getRole() {
          return role;
      }
      
      public void setRole(String newRole) {
          role = newRole;
      }
      
      public String getPassword() {
         return password;
	}

      public void setPassword(String newPassword) {
         password = newPassword;
	}
	
			
      public String getUsername() {
         return username;
			}

      public void setUserName(String newUsername) {
         username = newUsername;
			}

				
      public boolean isValid() {
         return valid;
	}

      public void setValid(boolean newValid) {
         valid = newValid;
	}

    public boolean insert() {
      
        String insertQuery1 = "INSERT INTO user_login VALUES('"+username+"',ENCODE('"+password+"','helloworld'),'"+role+"')" ;
        
        if(loginpack.UserDAO.executeQuery(insertQuery1))
        {
            return true;
        }
        return false;
            
    }
}
