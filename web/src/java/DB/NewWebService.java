/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author ardra
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    ConnectionClass con = new ConnectionClass();

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "LoginDetails")
    public String LoginDetails(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {
        System.out.print("Hi");
        String sel = "select * from tbl_employee where employee_email='" + email + "' and employee_password='" + password + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.print(sel);
        JSONArray j = new JSONArray();
        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();

                try {
                    jo.put("id", rs.getString("employee_id"));
                    jo.put("name", rs.getString("employee_name"));

                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "MyPro")
    public String MyPro(@WebParam(name = "id") String id) {
        String select = "select * from tbl_employee where employee_id='" + id + "'";
        ResultSet rs = con.selectCommand(select);
        JSONArray j = new JSONArray();
        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("name", rs.getString("employee_name"));
                    jo.put("propic", rs.getString("employee_photo"));
                    jo.put("phone", rs.getString("employee_contact"));
                    jo.put("email", rs.getString("employee_email"));
                    jo.put("address", rs.getString("employee_address"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetWork")
    public String GetWork(@WebParam(name = "eid") String eid, @WebParam(name = "ip") String ip) {
        String sel = "select * from tbl_wasterequest w inner join tbl_user u on u.user_id=w.user_id where employee_id='" + eid + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        {
            try {
                while (rs.next()) {
                    String material = "";
                    String selec = "select * from tbl_wasterequestbody u inner join tbl_wastematerial s on u.wastematerial_id = s.wastematerial_id where wasterequest_id =" + rs.getString("wastereq_id") + "";
                    ResultSet res = con.selectCommand(selec);
                    ResultSet res2 = con.selectCommand(selec);
                    res2.next();
                    while (res.next()) {
                        if (res2.next()) {
                            material = res.getString("wastematerial_type") + ",";
                        } else {
                            material = res.getString("wastematerial_type");
                        }
                    }
                    JSONObject jo = new JSONObject();
                    {
                        try {
                            jo.put("photo", "http://" + ip + ":8084/Assets/Files/UserPhoto/" + rs.getString("user_photo"));
                            jo.put("name", rs.getString("user_name"));
                            jo.put("materials", material);
                            jo.put("date", rs.getString("wastereq_pickupdate"));
                            j.put(jo);
                        } catch (JSONException ex) {
                            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        System.out.println(j.toString());
        return j.toString();
    }
    
    

    @WebMethod(operationName = "GetMaterial")
    public String GetMaterial(@WebParam(name = "uid") String uid) {
        String select = "select * from tbl_wasterequestbody wb inner join tbl_wasterequest wr on wr.wastereq_id=wb.wasterequest_id inner join tbl_wastematerial wm on wm.wastematerial_id=wb.wastematerial_id inner join tbl_wastecategory wc on wc.wastecategory_id=wm.wastecategory_id where user_id='" + uid + "'";
        ResultSet rs = con.selectCommand(select);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                try {
                    jo.put("type", rs.getString("wastematerial_type"));
                    jo.put("category", rs.getString("wastecategory_name"));
                    jo.put("rate", rs.getString("wastematerial_rate"));
                    jo.put("bodyid", rs.getString("wrbody_id"));
                    jo.put("request", rs.getString("wasterequest_id"));
                    j.put(jo);
                } catch (JSONException ex) {
                    Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "UpdateAmount")
    public boolean UpdateAmount(@WebParam(name = "id") String id, @WebParam(name = "pay") String pay, @WebParam(name = "recive") String recive) {
        String updQry = "update tbl_wasterequest set recived='"+recive+"', payed='"+pay+"' where wastereq_id ='"+id+"'";
        System.out.println(updQry);
        if(con.executeCommand(updQry))
        {
            return true;
        }
        return false;
    }
}
