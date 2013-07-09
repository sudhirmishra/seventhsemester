/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fileupload;

import beans.UserBean;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import loginpack.ConnectionManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author TeJaS
 */
public class UploadServlet extends HttpServlet {
   
   private boolean isMultipart;
   private String filePath;
   private int maxFileSize = 50 * 1024;
   private int maxMemSize = 4 * 1024;
   private File file ;

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
                
                if(request.getParameter("file")!=null){
                        
                        int option = Integer.parseInt(request.getParameter("file"));
                        String pdfFileName = null;
                        String query = "SELECT * FROM files WHERE file_id="+option;
                        ResultSet rs;
                        try {
                            Connection con = ConnectionManager.getConnection();
                            Statement stmt = con.createStatement();
                            rs = stmt.executeQuery(query);
                            rs.next();

                            pdfFileName = "/"+rs.getString("source");
                        }
                        catch (SQLException ex) {
                            
                        }
                        
                        String contextPath = getServletContext().getRealPath(File.separator);
                        File pdfFile = new File(contextPath + pdfFileName);

                        response.setContentType("application/pdf");
                        response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
                        response.setContentLength((int) pdfFile.length());

                        FileInputStream fileInputStream = new FileInputStream(pdfFile);
                        int bytes;
                        while ((bytes = fileInputStream.read()) != -1) {
                                out.write(bytes);
                        }
                    
                }else{    
                    
                    try {
                            isMultipart = ServletFileUpload.isMultipartContent(request);
                            if( !isMultipart ) {
                                    return;
                            }
                            AddFile ab = new AddFile();
                            DiskFileItemFactory factory = new DiskFileItemFactory();
                            // maximum size that will be stored in memory
                            //factory.setSizeThreshold(maxMemSize);
                            // Location to save data that is larger than maxMemSize.
                            String contextPath = getServletContext().getRealPath(File.separator);
                            factory.setRepository(new File(contextPath+"\\temp"));

                            // Create a new file upload handler
                            ServletFileUpload upload = new ServletFileUpload(factory);
                            // maximum file size to be uploaded.
                            //upload.setSizeMax( maxFileSize );

                            try{
                                    // Parse the request to get file items.
                                    List fileItems = upload.parseRequest(request);
                                    filePath = getServletContext().getInitParameter("file_upload"); 

                                    // Process the uploaded file items
                                    Iterator i = fileItems.iterator();
                                    String filenm = null;
                                    //MultipartFormDataRequest mrequest=new MultipartFormDataRequest(request);
                                    //mrequest.getParameter("txtEmpId");

                                    while ( i.hasNext () )
                                    {
                                            FileItem fi = (FileItem)i.next();
                                            if ( fi.isFormField () ) {
                                                    ab.setUser(  ((UserBean)(request.getSession().getAttribute("currentSessionUser"))).getUsername() );

                                                    if(fi.getFieldName().equals("branch")) {
                                                            ab.setBranch(  fi.getString());
                                                    }
                                                    if(fi.getFieldName().equals("subject")) {
                                                            ab.setSubject(  fi.getString());
                                                    }
                                                    if(fi.getFieldName().equals("type")) {
                                                            ab.setType(  fi.getString());
                                                    }
                                                    if(fi.getFieldName().equals("filename")) {
                                                            filenm = fi.getString();	
                                                            ab.setName(  fi.getString());
                                                    }
                                            } else {
                                                    // Get the uploaded file parameters
                                                    String fieldName = fi.getFieldName();
                                                    String fileName = fi.getName();
                                                    String contentType = fi.getContentType();
                                                    boolean isInMemory = fi.isInMemory();
                                                    long sizeInBytes = fi.getSize();
                                                    // Write the file
                                                    String path;
                                                    if(sizeInBytes != 0) {
                                                            if( fileName.lastIndexOf("\\") >= 0 ) {
                                                                    path = filePath + filenm + "." +
                                                                    fileName.substring( fileName.lastIndexOf("."));
                                                                    file = new File( path ) ;
                                                                    ab.setSource("files/"+filenm+"."+fileName.substring(fileName.lastIndexOf(".")));
                                                            } else {
                                                                    path = filePath + filenm + "." +
                                                                    fileName.substring(fileName.lastIndexOf(".")+1);
                                                                    file = new File(path) ;
                                                                    ab.setSource("files/"+filenm+"."+fileName.substring(fileName.lastIndexOf(".")+1));
                                                            }
                                                            fi.write( file );
                                                    } else {
                                                            ab.setSource("files/abcdef.jpg");
                                                    }
                                            }
                                    }
                                    
                                    if(ab.add()){
                                        request.setAttribute("UploadStatus","true");
                                    }else{
                                        System.out.println("Couldn't insert into database");
                                        request.setAttribute("UploadStatus","false");
                                    }
                                    RequestDispatcher view = request.getRequestDispatcher("file_upload.jsp");
                                    view.forward(request, response);
                            } catch(Exception ex) {
                                    out.println(ex);
                            }
                    } finally {			
                            out.close();
                    }
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
