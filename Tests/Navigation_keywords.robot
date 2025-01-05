*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}        https://www.log2base2.com/ 
${url1}       https://www.log2base2.com/dsa/?lb_content=www.log2base2.com/&lb_cta=hmp-pkg-icon
${url2}       https://www.upwork.com/freelance-jobs/automated-testing/
${url3}       https://www.legalnomads.com/
${browser}        Chrome

*** Test Cases ***
Navigation Test
    Open Browser        ${url}        ${browser}
    Maximize Browser Window
    ${location}            Get Location
    Log To Console          ${location}
    
    Go To        ${url1}
    ${location}    Get Location
    Log To Console    ${location}
    Sleep    3s
    
    Go Back
    ${location}    Get Location
    Log To Console    ${location}
    Sleep    3s

    Go To        ${url2}
    ${location}    Get Location
    Log To Console    ${location}
    Sleep    3s
    
    Go To    ${url3}
    ${location}    Get Location
    Log To Console      ${location}
    Capture Page Screenshot          C:\Users\chysk\PycharmProjects\RobotFramework\Screenshots\LegalNomad.png