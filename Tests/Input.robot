*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}            https://www.google.com/
${browser}        Chrome

*** Test Cases ***
Validate Input Box on Google page
    #Create Webdriver        Chrome        excutable_path=
    Open Browser        ${url}        ${browser}
    Maximize Browser Window
    Input Text         css:.gLFyf        Ladakh
    Wait Until Element Is Visible        xpath://div[@class='pcTkSc']
    Click Element          xpath://div[@class='pcTkSc']
    Wait Until Page Contains Element          css:div[class='M2vV3 vOY7J']
    Click Element           xpath://*[@id="tsf"]/div[1]/div[1]/div[2]/div/div[3]/div[1]/div

