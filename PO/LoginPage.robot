*** Settings ***
Documentation        resource which contains all
...                  keywords and locators related
...                  to Login page
Library              SeleniumLibrary


*** Keywords ***
Fill the login form
    Input Text                      xpath://input[@name='username']        rahulshettyacademy
    Input Password                  css:#password                          learning
    # Select 'Admin' option
    Click Element                   css:input[value='admin']
    # Select 'User' option
    Click Element                   css:input[value='user']
    #Read text from popup window
    ${Text_popup}=  Get Text        css:div[class='modal-body'] p
    Log To Console                  ${Text_popup}
    #click 'Okay' option on popup
    Wait Until Element Is Visible       okayBtn
    Click Element                       okayBtn

    # Get each LOV value from dropdown list
    @{dropdown_list}     Get Webelements    css:select[class='form-control']
    FOR  ${item}  IN     @{dropdown_list}
        ${LOV_value}    Get Text       ${item}
        Log To Console    ${LOV_value}
    END
    # dropdown value selection
    Select From List By Value        css:select[class='form-control']        teach
    Select From List By Index        xpath://select[@class='form-control']      2
    Select From List By Label        css:select[class='form-control']           Student
    # Select Terms and Conditions
    Select Checkbox                  terms
    # verify checkbox is selected
    Checkbox Should Be Selected      css:input[name='terms']
    # Click 'Sign in' button
    #Click Button         id:signInBtn
    # wait for user logs to home page
    #Wait Until Page Contains Element            css:a[href='/angularpractice']
