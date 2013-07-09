/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

import beans.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loginpack.UserDAO;

/**
 *
 * @author ADMIN
 */
public class BlogServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            request.getSession().setAttribute("page_no",(int)0);
            if(request.getParameter("comment_body")!=null){
                /*Inserting new comment*/
                int post_id = Integer.parseInt(request.getParameter("postID"));
                String uname = ((UserBean)request.getSession().getAttribute("currentSessionUser")).getUsername().toString();
                String comment_body = request.getParameter("comment_body");
                boolean flag  = Comment.insert(post_id, comment_body, uname);
                if(flag){
                    response.sendRedirect("post.jsp?p_no="+post_id);
                }else{
                    out.println("Something went wrong while updating !! We are on to it. May take a few moments.");
                }
            }else if(request.getParameter("post_body")!=null && request.getParameter("post_header")!=null){
                /*Inserting new post*/
                String uname = ((UserBean)request.getSession().getAttribute("currentSessionUser")).getUsername().toString();
                String body = request.getParameter("post_body");
                String header = request.getParameter("post_header");
                String insertPostQuery = "INSERT INTO `post`( `header`, `body`, `post_user`) VALUES ('"+header+"','"+body+"','"+uname+"')";
                boolean flag = UserDAO.executeQuery(insertPostQuery);
                if(flag){
                    response.sendRedirect("dept.jsp");
                }else{
                    out.println("Something went wrong while updating !! We are on to it. May take a few moments.");
                }
            }
            else if(request.getParameter("page_no")!=null){
                int page_no = Integer.parseInt(request.getParameter("page_no"));
                Post [] p = (new blog.Blog(page_no)).getPost();
                request.setAttribute("blog", p);                
            }
            else if(request.getParameter("deletePost")!=null){
                int post_id = Integer.parseInt(request.getParameter("deletePost"));
                String delQuery = "DELETE FROM post WHERE post_id="+post_id;
                if(UserDAO.executeQuery(delQuery)){
                    response.sendRedirect("dept.jsp");
                }
            }
        }catch(NullPointerException e){
            out.println("SERVER NULL ERROR" +e.getMessage());
            
        }catch(Exception e){
            out.println("SERVER ERROR" +e.getMessage());
            
        }finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
