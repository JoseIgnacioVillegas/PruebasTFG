package es.upm.dit.tfg.webLab.servlets;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.text.IniRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import es.upm.dit.tfg.webLab.dao.UsuarioDAOImplementation;
import es.upm.dit.tfg.webLab.model.Usuario;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	
	
	private final static Logger log = Logger.getLogger(LoginServlet.class);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = req.getParameter("user");
		String password = req.getParameter("password");
		List<Usuario> todoUsuarios = UsuarioDAOImplementation.getInstance().readUsuarios();
		/*
		Path currentRelativePath = Paths.get("");
		String s = currentRelativePath.toAbsolutePath().toString();
		
		IniRealm iniRealm = new IniRealm(s+"/shiro.ini");
		DefaultSecurityManager securityManager = new DefaultSecurityManager(iniRealm);
		SecurityUtils.setSecurityManager((org.apache.shiro.mgt.SecurityManager) securityManager);
		*/
		
		
		Subject currentUser = SecurityUtils.getSubject();
		
		
		if (!currentUser.isAuthenticated()) {               
			  UsernamePasswordToken token = new UsernamePasswordToken(user, password);
			  token.setRememberMe(true);                        
			  try {          
				  currentUser.isAuthenticated();
			      currentUser.login(token); 
			      //req.getSession().setAttribute("currentUser", currentUser);
			      System.out.println(currentUser.getPrincipal());
			      System.out.println(currentUser.isAuthenticated());
			      getServletContext().getRequestDispatcher("/VistaInicial.jsp").forward(req, resp);
			  } catch (UnknownAccountException uae) {           
			      log.error("Username Not Found!", uae);  
			      System.out.println("Username Not Found!");
			      req.getSession().setAttribute("error", "Username Not Found!");
			      getServletContext().getRequestDispatcher("/loginPage.jsp").forward(req, resp);
			  } catch (IncorrectCredentialsException ice) {     
			      log.error("Invalid Credentials!", ice); 
			      System.out.println("Invalid Credentials!");
			      req.getSession().setAttribute("error", "Invalid Credentials!");
			      getServletContext().getRequestDispatcher("/loginPage.jsp").forward(req, resp);
			  } catch (LockedAccountException lae) {            
			      log.error("Your Account is Locked!", lae);  
			      System.out.println("Your Account is Locked!");
			      req.getSession().setAttribute("error", "Your Account is Locked!");
			      getServletContext().getRequestDispatcher("/loginPage.jsp").forward(req, resp);
			  } catch (AuthenticationException ae) {            
			      log.error("Unexpected Error!", ae); 
			      System.out.println("Unexpected Error!");
			      req.getSession().setAttribute("error", "Unexpected Error!");
			      getServletContext().getRequestDispatcher("/loginPage.jsp").forward(req, resp);
			  }                                                 
			}		
	}
}