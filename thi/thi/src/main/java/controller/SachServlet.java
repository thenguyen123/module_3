package controller;

import model.HocSinh;
import model.Sach;
import service.impl.HocSinhService;
import service.impl.SachService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

@WebServlet(name = "SachServlet", value = "/sach")
public class SachServlet extends HttpServlet {
    SachService service=new SachService();
    HocSinhService hocSinhService=new HocSinhService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action=request.getParameter("action");
        if(action==null){
            action=" ";
        }switch (action){
            case "findId":
                break;
            case "muon":
                showMuon(request,response);
                break;
            case "api":
                check(response,request);
                break;
            default:
                showList(request,response);
        }
    }
private  void check(HttpServletResponse response, HttpServletRequest request){
    System.out.println("ppppppp");
    try {
        URL url= new URL("http://localhost:8080/api/blog");
        HttpURLConnection httpURLConnection= (HttpURLConnection) url.openConnection();
        int respo=httpURLConnection.getResponseCode();
        if(respo==HttpURLConnection.HTTP_OK){
            BufferedReader in=new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
            String inputLine;
            StringBuffer stringBuffer= new StringBuffer();
            while ((inputLine=in.readLine())!=null){
                stringBuffer.append(inputLine);
            }
            in.close();
            System.out.println(stringBuffer);
        }
        request.getRequestDispatcher("view/check.jsp").forward(request,response);
    } catch (ServletException e) {
        throw new RuntimeException(e);
    } catch (IOException e) {
        throw new RuntimeException(e);
    }
}
    private void showMuon(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id")) ;
        List<HocSinh> list=hocSinhService.findAll();
        Sach sach=service.findByID(id);
        request.setAttribute("list",list);
        request.setAttribute("sach",sach);
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Sach> list =service.findAll();
        request.setAttribute("list", list);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
