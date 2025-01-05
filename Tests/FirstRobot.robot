*** Settings ***
Documentation    Validate login functionality for Invalid Creds
Library     SeleniumLibrary
Library     customLibraries/Shop.py

*** Variables ***
${Error_msg_locator}        xpath://*[@id="login_button_container"]/div/form/div[3]/h3
${Expected_Error_msg}        Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
Validate Unsuccessful Login
    Start browser with test site url
    ${sel_speed}    Get Selenium Speed
    Log To Console    ${sel_speed}
    ${sel_timeout}    Get Selenium Timeout
    Log To Console    ${sel_timeout}

    Fill and Submit the login form

    ${sel_speed}    Get Selenium Speed
    Log To Console    ${sel_speed}
    Set Selenium Implicit Wait     10 seconds
    ${sel_timeout}    Get Selenium Timeout
    Log To Console    ${sel_timeout}
    #wait until it checks and throws the error message
    verify the error message

#Get message on login to home page
    #homePage

*** Keywords ***
Start browser with test site url
    Open Browser    https://www.saucedemo.com/    Chrome

Fill and Submit the login form
    Input Text    id:user-name    demouser123
    Input Password    id:password    demo123
    Click Button    login-button

wait until it checks and throws the error message
    Wait Until Element Is Visible      ${Error_msg_locator}

  
verify the error message
    ${Actual_Error_msg} =  Get Text       ${Error_msg_locator}
    Should Be Equal    ${Actual_Error_msg}    ${Expected_Error_msg}