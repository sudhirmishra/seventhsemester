/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loginpack.ConnectionManager;
import org.apache.catalina.util.ParameterMap;

/**
 *
 * @author ADMIN
 */
public class SMSSend extends HttpServlet {

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
                        Connection conn = ConnectionManager.getConnection();
                        Statement smnt     = null;;
                        String smsReceiver[] = null;
                        String message;
                        String comp = request.getParameter("Company");
                        String desc = request.getParameter("Desc");
                        String date = request.getParameter("Date")+"/" + request.getParameter("Month")+"/" + request.getParameter("Year");
                        String time = request.getParameter("Hour")+":" + request.getParameter("Min");
                        int criteria =  Integer.parseInt(request.getParameter("Criteria"));
                        String [] branch = request.getParameterValues("Branch"); 
                        
                        //construct the message
                        message = comp+" is coming on "+ date +"."+"\n"+"You are requested to be present at " +time+".Your aggregate should be at least "+criteria+".";
                        message = message+"\n" + desc;
                        
                        smnt = conn.createStatement();
                        String sqlSelect = "SELECT Mobile FROM user_info WHERE Branch='' ";
                        for(int i=0; i <branch.length;i++)
                        {
                            sqlSelect += "OR Branch='"+branch[i]+"'";
                        }
                        ResultSet rs = smnt.executeQuery(sqlSelect);
                        rs.last();
                        smsReceiver = new String[rs.getRow()];
                        rs.first();
                        int j=0;
                        do{
                            smsReceiver[j] = "+91" + String.valueOf(rs.getLong("Mobile"));
                            j++;
                        }while(rs.next());
                        
                        for(int i=0;i<smsReceiver.length;i++){
                            String sqlInsert =
                                    "INSERT INTO "+
                    "ozekismsout (receiver,msg,status) "+
                    "VALUES "+
                    "('" + smsReceiver[i] + "','"+ message +"','send')";

                                if(smnt.executeUpdate(sqlInsert) != 0)
                                {
                                        System.out.println("OK");
                                        out.println("OK");

                                }
                                else
                                {
                                        System.out.println("ERROR");
                                        out.println("ERROR");
                                }
                        }
                        smnt.close();
                        conn.close();
                }
                catch(Exception ex)
                {
                        System.out.println("Exception: " + ex.getMessage());
                        out.println(ex.getMessage());
                } finally {            
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
