*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}        https://demo.automationtesting.in/Windows.html
${browser}    Chrome


*** Test Cases ***

Handling Multiple Windows
    Open Browser      ${url}    ${browser}
    Click Element     css:a[href='#Seperate']
    
    FOR    ${i}     IN RANGE   4
        Click Element     xpath://div[@id='Seperate']/button
    END
    
    ${Main_handle}    Switch Window    MAIN
    Log To Console    ${Main_handle}
    Log Title


    @{Handles}        Get Window Handles
    FOR    ${handle}     IN    @{Handles}
        Run Keyword If   '${handle}' != '${Main_handle}'     Switch Window    ${handle}
        Log To Console    ${handle}
        Log Title
    END

    

