*** Settings ***
Documentation        This resource file contains all variables and keywords
...                  for RobotwithResource.robot file
Library         SeleniumLibrary
Library         Collections

*** Variables ***
${Error_msg_locator}        xpath://*[@id="login_button_container"]/div/form/div[3]/h3
${Expected_Error_msg}        Epic sadface: Username and password do not match any user in this service
${url}      https://www.saucedemo.com/
${browser_name}         Chrome
${uname_locator}       id:user-name
${passwd_locator}        id:password
${login_button}        login-button
${valid_username}        standard_user
${valid_password}        secret_sauce
${invalid_username}        demouser123
${invalid_password}        demo123


*** Keywords ***
Start browser with test site url
    Open Browser    ${url}        ${browser_name}
    Maximize Browser Window


Fill and Submit the login form
    [Arguments]        ${username}            ${password} 
    Input Text        ${uname_locator}        ${username}
    Input Password     ${passwd_locator}      ${password}
    Click Button        ${login_button}


wait until it checks and throws the error message
    Wait Until Element Is Visible      ${Error_msg_locator}


verify the error message
    ${Actual_Error_msg} =  Get Text       ${Error_msg_locator}
    Should Be Equal    ${Actual_Error_msg}    ${Expected_Error_msg}

wait for the home page after login
    Wait Until Page Contains Element        css:.shopping_cart_container > a

verify user is on home page and currently logged in
    Page Should Contain Button         react-burger-menu-btn
    Click Element        react-burger-menu-btn
    Page Should Contain Element        xpath://a[contains(text(),'Logout')]

verify product titles on home page
    @{expected_List} =  Create List     Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    @{products_List} =  Get Webelements        css:.inventory_item_name
    @{actual_List} =  Create List
    
   # For loop to create actual list with product names
    FOR    ${product}    IN    @{products_List}
        ${product_name} =  Get Text     ${product}
        Log To Console    ${product_name}
        Append To List        ${actual_List}        ${product_name}
    END

    # verify by comparing actual and expected lists
    Lists Should Be Equal        ${expected_List}         ${actual_List}

        
    