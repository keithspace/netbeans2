<%-- 
    Document   : index.jsp
    Created on : Feb 21, 2024, 3:13:34 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% 
            String Staff_Id = request.getParameter("Staff_Id");
            String Name = request.getParameter("Name");
            String department_name = request.getParameter("department_name");
            String Building_no = request.getParameter("Building_no");
            String Repair = request.getParameter("Repair");
          %>
          
          <h1> Thank You For Reporting A Repair<br> Here's the information you entered!</h1>
          
          <table cellspacing='5' cellpadding='5' border='1'>
             
               <tr>
                  <td align='center'>Staff ID: </td>
                  <td><%= Staff_Id %></td>
              </tr>
              
               <tr>
                  <td align='center'>Name: </td>
                  <td><%= Name %></td>
              </tr>
          
               <tr>
                  <td align='center'>Department Name: </td>
                  <td><%= department_name %></td>
               </tr>
              
               <tr>
                  <td align='center'>Building Number: </td>
                  <td><%= Building_no %></td>
               </tr>
              
              <tr>
                  <td align='center'>Repair: </td>
                  <td><%= Repair %></td>
              </tr>
          </table>
              
              <p> To report another repair, click on the button below</p> 
              <form action='index.html' method="post">
                  <input type='submit' value='Return'>
              </form>         
              
    </body>
</html>
