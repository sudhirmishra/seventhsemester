package loginpack;

import beans.UserBean;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {


    public void processRequest(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {

        try
        {	    

            UserBean user = new UserBean();
            user.setUserName(request.getParameter("un"));
            user.setPassword(request.getParameter("pw"));
            user.setRole(request.getParameter("role"));
            UserDAO.login(user);

            if (user.isValid())
            {
                if(user.getRole()=="Faculty"){
                    response.sendRedirect("sendSMS.jsp");
                }
                HttpSession session = request.getSession(true);	    
                session.setAttribute("currentSessionUser",user); 
                session.setMaxInactiveInterval(1000);
                response.sendRedirect("home.jsp"); //logged-in page      		
            }

            else 
                response.sendRedirect("invalidLogIn.jsp"); //error page 
        } 


        catch (Throwable theException) 	    
        {
            System.out.println(theException); 
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