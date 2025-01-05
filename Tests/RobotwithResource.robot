*** Settings ***
Documentation    Validate login functionality for Invalid Creds
Library          SeleniumLibrary
Library          ../customLibraries/Shop.py
Resource         ../Resources/resource.robot
Test Setup       Start browser with test url


*** Test Cases ***
Validate Unsuccessful Login with both invalid credentials
    Fill and Submit the login form        ${invalid_username}        ${invalid_password}
    wait until it checks and throws the error message
    verify the error message


Validate successful login with valid credentials
    [Tags]            REGRESSION
    Fill and Submit the login form        ${valid_username}       ${valid_password}
    wait for the home page after login
    verify user is on home page and currently logged in
    Verify Product Titles On Home Page
    Get the price of selected product        Sauce Labs Onesie
    #Get Price Of Selected Product           Sauce Labs Backpack
    Handle Alert    Accept
    Input Text Into Alert        alertText        Accept
    # Alert Should Be Present      Alert is present        Accept
    Capture Page Screenshot    c://
    Checkbox Should Be Selected      xpath://*[contains(text(),'Gender')]





    