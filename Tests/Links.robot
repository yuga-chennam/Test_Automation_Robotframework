*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}        https://mail.google.com
${browser}    Chrome

*** Test Cases ***
Validate all links on Gmail page
    Navigate To Gmail
    Capture all links shown on page
    Quit the browser instance

*** Keywords ***
Navigate to gmail
    Open Browser        ${url}        ${browser}
    Maximize Browser Window

Capture all links shown on page
    @{links}    Get Webelements      xpath://a
    FOR  ${link}  IN   @{links}:
        Click Link        ${link}
        Log To Console    ${link}
        Go Back
        Wait Until Element Is Visible        //input[type='email']
    END

Quit the browser instance
    Close Browser