*** Settings ***
Library        SeleniumLibrary
Library        String
Library        Collections
Resource        ../PO/Generic.robot
Resource        ../PO/LoginPage.robot
Resource        ../PO/HomePage.robot
Suite Setup     start browser with test url


*** Test Cases ***
Fill the login form with valid details
    LoginPage.Fill the login form

Retrieve user mailid from child window
    Verify and retrieve email from child window


FOR     ${handle}   IN    @{Handles}
        IF    ${handle} != ${Main_handle}
            Switch Window        ${handle}
            Log To Console       ${handle}
            Log Title
    
