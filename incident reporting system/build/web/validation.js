/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validateForm() {
    var staffID = document.getElementById("staffID").value;
    var password = document.getElementById("password").value;

    if (staffID === "" || password === "") {
        alert("Both staff ID and password are required!");
        return false;
    }

    // Additional client-side validation if needed

    return true;
}


