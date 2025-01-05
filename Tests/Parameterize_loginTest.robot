*** Settings ***
Documentation            Parameterize the tests to run login
...                      test for all input combinations.
Library                  SeleniumLibrary
Test Template            Validate Unsuccessful Login

*** Variables ***
${Error_msg_locator}          css:.error-message-container h3
${Expected_Error_msg}         Epic sadface: Username and password do not match any user in this service


*** Test Cases ***        username           password
Invalid username          fsdfdsgf           secret_sauce
Invalid password          standard_user      demo345988df
Special chars             deo^%#!%@$         secret@#$%           


*** Keywords ***
Validate Unsuccessful Login
    [Arguments]                           ${username}        ${password}
    Start browser with test site url
    Fill and Submit the login form        ${username}        ${password}
    #wait until it checks and throws the error message
    verify the error message


Start browser with test site url
    Open Browser    https://www.saucedemo.com/    Chrome

Fill and Submit the login form
    [Arguments]            ${username}        ${password}
    Input Text            id:user-name        ${username}
    Input Password        id:password         ${password}
    Click Button          login-button

wait until it checks and throws the error message
    Wait Until Element Is Visible          ${Error_msg_locator}

verify the error message
    ${Actual_Error_msg} =  Get Text       ${Error_msg_locator}
    Should Be Equal                       ${Actual_Error_msg}     ${Expected_Error_msg}
