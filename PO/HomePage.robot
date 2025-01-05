*** Settings ***
Documentation        resource which contains all
...                  keywords and locators related
...                  to Home page
# Library            SeleniumLibrary
Library              String


*** Keywords ***
Verify and retrieve email from child window
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
    ${emailid}=    Get From List      ${final_list}        0
    Log To Console          ${emailid}
    Set Global Variable     ${emailid}
    
switch back to parent window and enter emailid
    Switch Window        MAIN
    Sleep                2s
    Title Should Be      LoginPage Practise | Rahul Shetty Academy
    Input Text           css:input[name='username']                ${emailid}