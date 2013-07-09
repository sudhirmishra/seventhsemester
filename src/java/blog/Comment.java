/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;
import loginpack.ConnectionManager;
import loginpack.UserDAO;

/**
 *
 * @author ADMIN
 */
public class Comment {
    
    int comment_id;
    private int post_id;
    private String body;
    private String comment_user;
    private String comment_date;

    public Comment(int id) {
        this.post_id = id;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM comment WHERE comment_id="+id);
            rs.next();
            this.setComment_id(rs.getInt("comment_id"));
            this.setBody(rs.getString("body"));
            this.setComment_user(rs.getString("comment_user"));
            this.setComment_date(rs.getTimestamp("comment_date"));

        }catch(SQLException sql){
            
        }finally{
            
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

            if (conn != null) {
                try {
                conn.close();
                } catch (Exception e) {
                }

                conn = null;
            }
        }
        
    
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        Calendar now = Calendar.getInstance();
        now.setTime(comment_date);
        this.comment_date = now.get(Calendar.DATE) +"-"+ (now.get(Calendar.MONTH)+1) +"-"+ now.get(Calendar.YEAR);
    
    }
    
    public void setComment_date(Timestamp timestamp){
        
        long milli = timestamp.getTime()+(timestamp.getNanos()/1000000);
        Calendar now = Calendar.getInstance();
        now.setTime((new java.util.Date(milli)));
        this.comment_date = now.get(Calendar.DATE) +"-"+ (now.get(Calendar.MONTH)+1) +"-"+ now.get(Calendar.YEAR);
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_user() {
        return comment_user;
    }

    public void setComment_user(String comment_user) {
        this.comment_user = comment_user;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }
    
    
    public static boolean insert(int post_id, String body, String uname){
    
        String insertQuery = "INSERT INTO `comment`( `post_id`, `body`, `comment_user`) VALUES ("+post_id+",'"+body+"','"+uname+"')";
        return UserDAO.executeQuery(insertQuery);
    }
    public static boolean delete(int comment_id){
        
        String deleteQuery = "DELETE FROM comment WHERE 'comment_id'="+comment_id;
        return UserDAO.executeQuery(deleteQuery);
    }
}
