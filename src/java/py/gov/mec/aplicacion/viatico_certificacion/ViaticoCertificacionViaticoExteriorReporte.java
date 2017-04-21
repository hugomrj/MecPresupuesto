
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



package py.gov.mec.aplicacion.viatico_certificacion;


import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nebuleuse.ORM.Conexion;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;


/*
 * @author hugo
 */


@WebServlet(name = "ViaticoCertificacionViaticoExteriorReporte", 
        urlPatterns = {"/ViaticoCertificacion/ViaticoExterior/Reporte"})


public class ViaticoCertificacionViaticoExteriorReporte extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JRException, Exception {

        
            response.setHeader("Content-disposition","inline; filename="+"FacturaVenta.pdf");
            response.setContentType("application/pdf");
            response.setCharacterEncoding("charset=UTF-8");            
            
            /*
            Integer codigo = 0;
            codigo = Integer.parseInt(request.getParameter("codigo")) ;  
            */
                        
            String archivoJasper = "ViaticoExteriorValores.jasper"; 
 
            Conexion cnx = new Conexion();
            cnx.conectar();
            String url =  request.getServletContext().getRealPath("/WEB-INF")+"/jasper/";
        
            url = url + archivoJasper;
                    
            
            /*
            // parametros
            Map<String, Object> parameters = new HashMap<String, Object>();
            parameters.put("Parameter_CodigoVenta", codigo);
            */
            
            /*
            Venta venta = new Venta();
            Persistencia persistencia = new Persistencia();
            venta = (Venta) persistencia.filtrarId(venta, codigo);
            */
            
            /*
            Convercion conversion = new Convercion();                    
            parameters.put("Parameter_letraNumero", conversion.numeroaLetras( venta.getMonto_total().toString() ) );
            */
                    
            
            //JasperPrint jasperPrint = JasperFillManager.fillReport(url, parameters, cnx.getConexion());
            JasperPrint jasperPrint = JasperFillManager.fillReport(url, null, cnx.getConexion());
            
            
            ServletOutputStream servletOutputStream = response.getOutputStream();            
            byte[] reportePdf = JasperExportManager.exportReportToPdf(jasperPrint);

            response.setContentLength(reportePdf.length);
            
            servletOutputStream.write(reportePdf, 0, reportePdf.length);
            servletOutputStream.flush();
            servletOutputStream.close();            
            
    }

    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(ViaticoCertificacionViaticoExteriorReporte.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ViaticoCertificacionViaticoExteriorReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(ViaticoCertificacionViaticoExteriorReporte.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ViaticoCertificacionViaticoExteriorReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    
}
