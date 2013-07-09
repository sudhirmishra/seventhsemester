/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fileupload;

import loginpack.UserDAO;

/**
 *
 * @author ADMIN
 */
class AddFile {
    
    private String name;
    private String type;
    private String branch;
    private String subject;
    private String user;
    private String source;

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }


    boolean add() {
        
        String insertQuery = "INSERT INTO files (name,type,branch,subject,user,source) VALUES('"+name+"','"+type+"','"+branch+"','"+subject+"','"+user+"','"+source+"')" ;
        boolean insert = UserDAO.insert(insertQuery);
        if(insert){
            return true;
        }else{
            return false;
        }       
    }
}
