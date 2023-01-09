package controller.facility_controller;

import com.sun.org.apache.xerces.internal.xs.XSTerm;
import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.facility_service.impl.FacilityService;
import service.facility_service.impl.FacilityTypeService;
import service.facility_service.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    FacilityService facilityService = new FacilityService();
    RentTypeService rentTypeService = new RentTypeService();
    FacilityTypeService facilityTypeService = new FacilityTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showUpdate(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;

            default:
                showList(request, response);
        }
    }

    private void showFind(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<FacilityType> listFacility = facilityTypeService.findAllType();
        List<RentType> rentTypeList = rentTypeService.findAllRent();
        request.setAttribute("listFacility", listFacility);
        request.setAttribute("rentTypeList", rentTypeList);
        List<Facility> list = facilityService.find(name);
        request.setAttribute("list", list);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> list = facilityTypeService.findAllType();
        List<RentType> rentTypeList = rentTypeService.findAllRent();
        request.setAttribute("list", list);
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            request.getRequestDispatcher("view/facility/create.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> listFacility = facilityTypeService.findAllType();
        List<RentType> rentTypeList = rentTypeService.findAllRent();
        request.setAttribute("listFacility", listFacility);
        request.setAttribute("rentTypeList", rentTypeList);
        List<Facility> list = facilityService.findAdd();
        request.setAttribute("list", list);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                update(request, response);
                break;
            case "create":
                createFacility(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "find":
                showFind(request, response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id")) ;
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("people"));
        String standardRoom = request.getParameter("standard");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("pool"));
        int numberOfFloors = Integer.parseInt(request.getParameter("floors"));
        String facilityFree = request.getParameter("facilityFree");
        int rentID = Integer.parseInt(request.getParameter("rent"));
        int facilityID = Integer.parseInt(request.getParameter("facilityType"));
        RentType rentType = new RentType(rentID);
        FacilityType facilityType = new FacilityType(facilityID);
        Facility facility = new Facility(id,name, area, cost, maxPeople,
                standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree, rentType, facilityType);

        boolean check = facilityService.update(facility);
        String mess = "create success";
        if (!check) {
            mess = "failed";
        }
        request.setAttribute("mess", mess);
        showList(request, response);

    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.findById(id);
        List<FacilityType> listFacility = facilityTypeService.findAllType();
        List<RentType> rentTypeList = rentTypeService.findAllRent();
        request.setAttribute("listFacility", listFacility);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("facility", facility);
        try {
            if (facility.getFacilityFree() != null) {
                request.getRequestDispatcher("view/facility/editRoom.jsp").forward(request, response);
            } else if (facility.getPoolArea() != 0) {
                request.getRequestDispatcher("view/facility/editVilla.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/facility/editHouse.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = facilityService.delete(id);
        String mess = "Success";
        if (!check) {
            mess = "fail";
        }
        request.setAttribute("mess", mess);

        try {
            showList(request, response);
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("people"));
        String standardRoom = request.getParameter("standard");
        String descriptionOtherConvenience = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("pool"));
        int numberOfFloors = Integer.parseInt(request.getParameter("floors"));
        String facilityFree = request.getParameter("facilityFree");
        int rentID = Integer.parseInt(request.getParameter("rent"));
        int facilityID = Integer.parseInt(request.getParameter("facilityType"));

        RentType rentType = new RentType(rentID);
        FacilityType facilityType = new FacilityType(facilityID);
        Facility facility = new Facility(name, area, cost, maxPeople,
                standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree, rentType, facilityType);

        boolean check = facilityService.save(facility);
        String mess = "create success";
        if (!check) {
            mess = "failed";
        }
        request.setAttribute("mess", mess);
        showList(request, response);


    }
}
