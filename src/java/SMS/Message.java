/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SMS;

import loginpack.UserDAO;

/**
 *
 * @author ADMIN
 */
public class Message {
    private int receiver;
    private String message;
    private String status;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getReceiver() {
        return receiver;
    }

    public void setReceiver(int receiver) {
        this.receiver = receiver;
    }
    
    public Message(int no, String msg){
        
        String sqlInsert = "INSERT INTO ozekismsout (receiver,msg,status) VALUES ('" +no+ "','"+msg+"','send')";
        if(UserDAO.executeQuery(sqlInsert)){
            status = "send";
        }else{
            status = "not";
        }
        
    }
}
