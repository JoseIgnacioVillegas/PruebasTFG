
package es.upm.dit.tfg.webLab.servlets;

import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.itextpdf.io.IOException;

import es.upm.dit.tfg.webLab.dao.PlanEstudiosDAOImplementation;
import es.upm.dit.tfg.webLab.dao.ProfesorDAOImplementation;
import es.upm.dit.tfg.webLab.model.Asignatura;
import es.upm.dit.tfg.webLab.model.PlanEstudios;
import es.upm.dit.tfg.webLab.model.Profesor;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.subject.Subject;

import java.io.FileOutputStream;





@WebServlet("/ExportarAsignaturasServlet")

public class ExportarAsignaturasServlet extends HttpServlet{
	
	private static String[] columns = {"Código","Nombre", "Acronimo",  "Curso", "Semestre", "Tipo", "Créditos", "Horas teoría", "Horas Laboratorio", "Horas APOLO", "Numero Alumnos", "Coordinador", "Comentarios"};
    private static List<PlanEstudios> planes = PlanEstudiosDAOImplementation.getInstance().readTodosPlanesEstudios();
    

	private final static Logger log = Logger.getLogger(ExportarDocentesServlet.class);
	
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, java.io.IOException {	
		
		Subject currentUser = (Subject) req.getSession().getAttribute("currentUser");
		req.getSession().removeAttribute("mensaje");

		
		/*
		 * Solo puede entrar aquí si es administrador o si tiene el rol para gestionar los datos
		 */
		if (currentUser.hasRole("administrador") || currentUser.hasRole("gestiondatos")){
			// Create a Workbook
	        Workbook workbook = new XSSFWorkbook(); // new HSSFWorkbook() for generating `.xls` file
	
	        /* CreationHelper helps us create instances of various things like DataFormat, 
	           Hyperlink, RichTextString etc, in a format (HSSF, XSSF) independent way */
	        CreationHelper createHelper = workbook.getCreationHelper();
	
	        // Create a Sheet
	        Sheet sheet = workbook.createSheet("Asignaturas");
	
	        // Create a Font for styling header cells
	        Font headerFont = workbook.createFont();
	        headerFont.setBold(true);
	        headerFont.setFontHeightInPoints((short) 14);
	        headerFont.setColor(IndexedColors.RED.getIndex());
	
	        // Create a CellStyle with the font
	        CellStyle headerCellStyle = workbook.createCellStyle();
	        headerCellStyle.setFont(headerFont);
	
	        // Create a Row
	        Row headerRow = sheet.createRow(0);
	
	        // Create cells
	        for(int i = 0; i < columns.length; i++) {
	            Cell cell = headerRow.createCell(i);
	            cell.setCellValue(columns[i]);
	            cell.setCellStyle(headerCellStyle);
	        }
	
	        // Create Cell Style for formatting Date
	        CellStyle dateCellStyle = workbook.createCellStyle();
	        dateCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd-MM-yyyy"));
	
	        // Create Other rows and cells with employees data
	        int rowNum = 1;
	        for(PlanEstudios plan: planes) {
	            Row row = sheet.createRow(rowNum++);
	            
	            try {row.createCell(0).setCellValue(plan.getCodigo());
	            }catch(Exception e){System.out.println(e);}
	            
	            try {row.createCell(1).setCellValue(plan.getNombre());
	            }catch(Exception e){System.out.println(e);}
	
	            
	            for(Asignatura asignatura: plan.getAsignaturas()) {
	            	row = sheet.createRow(rowNum++);
	            	
	            	try {row.createCell(0).setCellValue(asignatura.getCodigo());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(1).setCellValue(asignatura.getNombre());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(2).setCellValue(asignatura.getAcronimo());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(3).setCellValue(asignatura.getCurso());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(4).setCellValue(asignatura.getSemestre());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(5).setCellValue(asignatura.getTipo());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(6).setCellValue(asignatura.getEcts());
	                }catch(Exception e){System.out.println(e);}
	
	            	try {row.createCell(7).setCellValue(asignatura.getHorasTeoria());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(8).setCellValue(asignatura.getHorasLab());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(9).setCellValue(asignatura.getHorasApolo());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(10).setCellValue(asignatura.getNumeroAlumnos());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(11).setCellValue(asignatura.getCoordinador().getUsuario().getNombre()+asignatura.getCoordinador().getUsuario().getApellidos());
	                }catch(Exception e){System.out.println(e);}
	            	
	            	try {row.createCell(12).setCellValue(asignatura.getComentario());
	                }catch(Exception e){System.out.println(e);}
	            }
	            
	        }
	
			// Resize all columns to fit the content size
	        for(int i = 0; i < columns.length; i++) {
	            sheet.autoSizeColumn(i);
	        }
	        
	        try {
		        // Write the output to a file
		        FileOutputStream fileOut = new FileOutputStream("AsignaturasFile.xlsx");
		        workbook.write(fileOut);
		        fileOut.close();
		        resp.reset();
				resp.setContentType("application/vnd.ms-excel");
				resp.setHeader("Content-Disposition", "attachment; filename=Asignaturas.xlsx");
				workbook.write(resp.getOutputStream());
		        workbook.close();
	        }catch(Exception e){
	        	System.out.println(e);
	        }
	        

			getServletContext().getRequestDispatcher("/ExportarDatos.jsp").forward(req, resp);
		}else {
			getServletContext().getRequestDispatcher("/NoPermitido.jsp").forward(req, resp);
		}
		
	}
	
}
