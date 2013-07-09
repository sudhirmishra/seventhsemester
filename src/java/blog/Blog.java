/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

import com.mysql.jdbc.ResultSetMetaData;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import loginpack.ConnectionManager;

/**
 *
 * @author ADMIN
 */
public class Blog {
    
    private Post[] post;  
    private int page_no;
    private static int maxlength = 0;
    
    public Post[] getPost() {
        return post;
    }

    public void setPost(Post[] post) {
        this.post = post;
    }

    public static int getMaxlength() {
        return maxlength;
    }

    public static void setMaxlength(int maxlength) {
        Blog.maxlength = maxlength;
    }
    
    public int getPage_no() {
        return page_no;
    }

    public void setPage_no(int page_no) {
        this.page_no = page_no;
    }
    {
        
    }
    public Blog(int page_no){
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.createStatement();
            int limit = page_no * 5;
            rs = stmt.executeQuery("SELECT COUNT(*) FROM post");
            rs.next();
            maxlength = (int)Math.ceil(rs.getInt("Count(*)")/5);              
                    
            rs = stmt.executeQuery("SELECT * FROM post ORDER BY post_date DESC LIMIT "+limit+",5");
            rs.last();
            int length = rs.getRow();
            rs.first();
            post = new Post[length];
            for(int i=0;i<length;i++){
                post[i] = new Post(rs.getInt("post_id"));
                rs.next();
            }
            
        }catch(SQLException sql){
            System.out.println("SQL ERROR" + sql.getMessage());
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
    
    
    public static void main(String []args){
        Blog b = new Blog(1);
        Post [] p = b.getPost();
        
        for(int i=0; i<p.length; i++){
            int str = p[i].getPost_id();
            System.out.println(str);
        }
    }
}
