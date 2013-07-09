/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import loginpack.ConnectionManager;

/**
 *
 * @author ADMIN
 */
public class Post {
    private int post_id;
    private String body;
    private String post_user;
    private Comment[] comment;
    private String header;
    private String post_date;

    public Post(int id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM post WHERE post_id="+id);
            rs.next();
            this.post_id = id;
            this.body = (rs.getString("body"));
            this.header = (rs.getString("header"));
            this.post_user = (rs.getString("post_user"));
        
            long milli = rs.getTimestamp("post_date").getTime()+(rs.getTimestamp("post_date").getNanos()/1000000);
            Calendar now = Calendar.getInstance();
            now.setTime((new java.util.Date(milli)));
            this.post_date = now.get(Calendar.DATE) +"-"+ (now.get(Calendar.MONTH)+1) +"-"+ now.get(Calendar.YEAR);
        
            rs = stmt.executeQuery("SELECT * FROM comment WHERE post_id="+id);
            rs.last();
            int commentLen = rs.getRow();
            rs.first();
            comment = new Comment[commentLen];
            for(int i=0;i<commentLen;i++){
                comment[i] = new Comment(rs.getInt("comment_id"));
                rs.next();
            }
        }catch(Exception sql){
            System.out.println("SQL Error in POST" + sql.getMessage());            
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
    
    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }
    
    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Comment[] getComment() {
        return comment;
    }

    public void setComment(Comment[] comment) {
        this.comment = comment;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        Calendar now = Calendar.getInstance();
        now.setTime(post_date);
        String date = now.get(Calendar.DATE)+"-"+ now.get(Calendar.MONTH)+"-"+now.get(Calendar.YEAR);
        this.post_date = date;
    }
    
    public void setPost_date(Timestamp timestamp){
        
        long milli = timestamp.getTime()+(timestamp.getNanos()/1000000);
        Calendar now = Calendar.getInstance();
        now.setTime((new java.util.Date(milli)));
        this.post_date = now.get(Calendar.DATE) +"-"+ (now.get(Calendar.MONTH)+1) +"-"+ now.get(Calendar.YEAR);
        
    }

    public String getPost_user() {
        return post_user;
    }

    public void setPost_user(String post_user) {
        this.post_user = post_user;
    }
    
    public boolean insertPost(String body, String post_user, String header){
        
        return false;
    }
    public static void main(String []args){
        Post p = new Post(1);
        System.out.println(p.getBody());
        Comment[] c = p.getComment();
        System.out.println(c[2].getBody());
    }
}

