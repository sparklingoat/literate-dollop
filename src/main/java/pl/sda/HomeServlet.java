package pl.sda;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeServlet", urlPatterns = {"", "/", "/home", "/about", "/contact"})
public class HomeServlet extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String path = req.getServletPath();
    if (path.equals("/about")) {
      req.getRequestDispatcher("about.jsp").forward(req, resp);
    } else if (path.equals("/contact")) {
      req.getRequestDispatcher("contact.jsp").forward(req, resp);
    } else {
      req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
  }

}
