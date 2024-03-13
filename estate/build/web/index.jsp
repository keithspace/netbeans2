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
        <title>Just reported</title>
        <style media = "all">
          *,
            *:before,
            *:after {
              padding: 0;
              margin: 0 auto;
              box-sizing: border-box;
            }

            body {
              background-color: #080710;
            }
            h2{
                font-size: 30px;
                color: #ffffff;
                padding-top: 20px;
                align-items: center;
     
            }

            .background {
              width: 430px;
              height: 600px;
              position: absolute;
              transform: translate(-50%, -50%);
              left: 50%;
              top: 69%;
            }

            .background .shape {
              height: 200px;
              width: 200px;
              position: absolute;
              border-radius: 50%;
            }

            .shape:first-child {
              background: linear-gradient(#50C878,
                  #228B22);
              left: -80px;
              top: -100px;
            }

            .shape:last-child {
              background: linear-gradient(to right,
                  #B2BEB5,
                  #A9A9A9);
              right: -70px;
              bottom: -80px;
            }

            form {
              height: 600px;
              width: 450px;
              background-color: rgba(255, 255, 255, 0.13);
              position: absolute;
              transform: translate(-50%, -50%);
              top: 49%;
              left: 50%;
              border-radius: 10px;
              backdrop-filter: blur(10px);
              border: 2px solid rgba(255, 255, 255, 0.1);
              box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
              padding: 50px 35px;
            }
      
            form * {
              font-family: 'Poppins', sans-serif;
              color: #ffffff;
              letter-spacing: 0.5px;
              outline: none;
              border: none;
            }

            form h3 {
              font-size: 32px;
              font-weight: 500;
              line-height: 42px;
              text-align: center;
            }

            label {
              display: block;
              margin-top: 30px;
              font-size: 16px;
              font-weight: 500;
            }

            input {
              display: block;
              height: 50px;
              width: 100%;
              background-color: rgba(255, 255, 255, 0.07);
              border-radius: 3px;
              padding: 0 10px;
              margin-top: 8px;
              font-size: 14px;
              font-weight: 300;
            }

            ::placeholder {
              color: #e5e5e5;
            }

            button {
              margin-top: 50px;
              width: 100%;
              background-color: #ffffff;
              color: #080710;
              padding: 15px 0;
              font-size: 18px;
              font-weight: 600;
              border-radius: 5px;
              cursor: pointer;
            }
            .center{
                width: 50%;
                margin-top: 30px;
                height: 100%; 
            }
        
            
            
        </style>
    </head>
    <body>
         <% 
            String Staff_Id = request.getParameter("Staff_Id");
            String Name = request.getParameter("Name");
            String department_name = request.getParameter("department_name");
            String Building_no = request.getParameter("Building_no");
            String Repair = request.getParameter("Repair");
          %>
          
          <h2> Thank you for reporting the repair.<br> It will be handled as soon as possible.</h2>
          <h3>Below is the information you gave us!</h3>
          
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
              <form action='reporting.html' method="post">
                  <input type='submit' value='Return'>
              </form>         
              
    </body>
</html>
