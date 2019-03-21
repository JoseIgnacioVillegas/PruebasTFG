package es.upm.dit.tfg.webLab.servlets;


import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;

import com.itextpdf.io.IOException;

import es.upm.dit.tfg.webLab.dao.AsignaturaDAOImplementation;
import es.upm.dit.tfg.webLab.dao.PermisoDAOImplementation;
import es.upm.dit.tfg.webLab.dao.PlanEstudiosDAOImplementation;
import es.upm.dit.tfg.webLab.dao.ProfesorDAOImplementation;
import es.upm.dit.tfg.webLab.dao.UsuarioDAOImplementation;
import es.upm.dit.tfg.webLab.model.Asignatura;
import es.upm.dit.tfg.webLab.model.Permiso;
import es.upm.dit.tfg.webLab.model.Profesor;
import es.upm.dit.tfg.webLab.model.Usuario;





@WebServlet("/AsignarPermisosServlet")

public class AsignarPermisosServlet extends HttpServlet{

	
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, java.io.IOException {
		
		Subject currentUser = (Subject) req.getSession().getAttribute("currentUser");
		req.getSession().removeAttribute("mensaje");
		int UsuarioId = Integer.parseInt(req.getParameter("id"));
		
		/*
		 * Solo puede entrar aquí si es administrador o si tiene el rol para gestionar usuarios 
		 */
		if (currentUser.hasRole("administrador") || currentUser.hasRole("gestionusuarios")){
			
			
			
			
			
			
			
			Usuario usuario = UsuarioDAOImplementation.getInstance().readUsuario(UsuarioId);
			UsuarioDAOImplementation.getInstance().deleteUsuario(usuario);
			usuario.deleteAllPermisos();
			
			//Saco el array de los id de los profesores borrados
			String todosPermisosId[]; 
			todosPermisosId = req.getParameterValues("permisosAsignados");
			System.out.println("PERMIIIIIIIIIIISOOOOSSS "+todosPermisosId);
			List<Permiso> nuevosPermisos = new ArrayList<Permiso>();
			System.out.println(nuevosPermisos);
			
			
			try {
				for (int i = 0; i< todosPermisosId.length; i++) {
					Permiso permiso = PermisoDAOImplementation.getInstance().readPermiso(Integer.parseInt(todosPermisosId[i]));
					nuevosPermisos.add(permiso);
					System.out.println(permiso.getPermiso());
				}
			}catch(Exception e) {
				System.out.println(e);
			}finally {
						
			}
			System.out.println("Pasa el try "+nuevosPermisos);
			usuario.setPermisos(nuevosPermisos);
			UsuarioDAOImplementation.getInstance().updateUsuario(usuario);

			String msj = "Permisos asignados con éxito";
			req.getSession().setAttribute("mensaje", msj);
			
			getServletContext().getRequestDispatcher("/GestionarPermisos.jsp").forward(req, resp);
			
		}else {
			getServletContext().getRequestDispatcher("/NoPermitido.jsp").forward(req, resp);
		}
	}
}
		
