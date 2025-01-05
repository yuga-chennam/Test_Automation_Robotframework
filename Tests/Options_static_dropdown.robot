*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
#Test Setup        Start browser with test site


*** Test Cases ***
Fill the login form with all details
    [Tags]            SMOKE
    Start browser with test site
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
    # dropdown value selection
    Select From List By Value        css:select[class='form-control']        teach
    Select From List By Index        xpath://select[@class='form-control']      2
    Select From List By Label        css:select[class='form-control']           Student
    # Select Terms and Conditions
    Select Checkbox                   terms
    # verify checkbox is selected
    Checkbox Should Be Selected       css:input[name='terms']
    # Click 'Sign in' button
    #Click Button         id:signInBtn
    # wait for user logs to home page
    #Wait Until Page Contains Element            css:a[href='/angularpractice']

    

Verify and retrieve email from child window
    [Tags]            REGRESSION
    Start browser with test site
    Click Element        css:a[href="https://rahulshettyacademy.com/documents-request"]
    Switch Window        NEW
    Wait Until Page Contains        Documents request
    Element Text Should Be        css:div[class='inner-box'] h1        DOCUMENTS REQUEST
    # Read the text from red paragraph
    ${red_text}=  Get Text              css:.im-para.red
    # ${red_text}= Please email us at mentor@rahulshettyacademy.com with below template to receive response
    Log To Console        ${red_text}
    # Split the string based on separator 'at'
    @{words_list}=  Split String        ${red_text}        at
    #  @{words_list}= ['Please email us' , 'mentor@rahulshettyacademy.com with below template to receive response']
    Log To Console        ${words_list}
    # retrieve email id part from list
    ${emailid_phrase}=  Get From List         ${words_list}        1
    #Again split emailid phrase based on space deleimiter
    ${final_list}=    Split String        ${emailid_phrase}
    Log To Console        ${final_list}
    # Get first element from final_list which is 'emailid'
    ${emailid} =    Get From List      ${final_list}        0
    Log To Console        ${emailid}
    Set Global Variable     ${emailid}
    
switch back to parent window and enter emailid
    [Tags]            NEWFEATURE
    Switch Window        MAIN
    Sleep                2s
    Title Should Be      LoginPage Practise | Rahul Shetty Academy
    Input Text           css:input[name='username']                  ${emailid}


*** Keywords ***
Start browser with test site
    Open Browser        https://rahulshettyacademy.com/loginpagePractise/        Chrome
    Maximize Browser Window