package signup;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import beans.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class SignUpServlet extends HttpServlet {

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
            HttpSession session = null;
            if(request.getParameter("htmlFormName")!=null){
                
                if(request.getParameter("htmlFormName").equals("form_1")){
                    UserBean u = new UserBean();
                    u.setPassword(request.getParameter("password"));
                    u.setUserName(request.getParameter("username"));
                    u.setRole(request.getParameter("role"));
                    u.setValid(true);
                    session = request.getSession();
                    session.setAttribute("currentSessionUser", u);
                    request.getRequestDispatcher("sign_up_2.jsp").forward(request, response);
                
                }
                else if(request.getParameter("htmlFormName").equals("form_2")){
                    UserRe ure = new UserRe();
                    ure.setCollegeID(Integer.parseInt(request.getParameter("CollegeID")));
                    ure.setBranch(request.getParameter("Branch"));
                    ure.setFirstName(request.getParameter("FirstName"));
                    ure.setLastName(request.getParameter("LastName"));
                    java.sql.Date DOB = new java.sql.Date(Integer.parseInt(request.getParameter("YYYY")), Integer.parseInt(request.getParameter("MM")),Integer.parseInt(request.getParameter("DD")));
                    ure.setDOB(DOB);
                    ure.setAddreessLine1(request.getParameter("Add_Str"));
                    ure.setAddressLine2(request.getParameter("Add_Line2"));
                    ure.setCity(request.getParameter("City"));
                    ure.setState(request.getParameter("State"));
                    ure.setCountry(request.getParameter("Country"));
                    
                    ure.setZip(Integer.parseInt(request.getParameter("Zip")));
                    ure.setMob(Long.parseLong(request.getParameter("Mob")));
                    ure.setEmail(request.getParameter("Email"));
                    ure.setAboutYou(request.getParameter("Abt_you"));
                    session = request.getSession(false);
                    ure.setUser((UserBean)session.getAttribute("currentSessionUser"));
                    boolean flag = ure.insert();

                    if(flag){
                        response.sendRedirect("home.jsp");
                    }


                }else if(request.getParameter("htmlFormName").equals("form_3")){
                    UserRe ure = new UserRe();
                    ure.setCollegeID(Integer.parseInt(request.getParameter("CollegeID")));
                    ure.setBranch(request.getParameter("Branch"));
                    ure.setFirstName(request.getParameter("FirstName"));
                    ure.setLastName(request.getParameter("LastName"));
                    java.sql.Date DOB = new java.sql.Date(Integer.parseInt(request.getParameter("YYYY")), Integer.parseInt(request.getParameter("MM")),Integer.parseInt(request.getParameter("DD")));
                    ure.setDOB(DOB);
                    ure.setAddreessLine1(request.getParameter("Add_Str"));
                    ure.setAddressLine2(request.getParameter("Add_Line2"));
                    ure.setCity(request.getParameter("City"));
                    ure.setState(request.getParameter("State"));
                    ure.setCountry(request.getParameter("Country"));
                    
                    ure.setZip(Integer.parseInt(request.getParameter("Zip")));
                    ure.setMob(Long.parseLong(request.getParameter("Mob")));
                    ure.setEmail(request.getParameter("Email"));
                    ure.setAboutYou(request.getParameter("Abt_you"));
                    session = request.getSession(false);
                    ure.setUser((UserBean)session.getAttribute("currentSessionUser"));
                    boolean flag = ure.update();

                    if(flag){
                        response.sendRedirect("aboutyou.jsp");
                    }


                }
            }
            else{
                
                request.getRequestDispatcher("sign_up_1.jsp").forward(request, response);
            }
                
        
        }catch(NumberFormatException ne){
            out.println(ne +" "+ne.getMessage()+ne.getStackTrace());
        }catch(Exception e){
            out.println(e+" "+ e.getMessage()+e.getStackTrace());
        }
        finally {            
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
