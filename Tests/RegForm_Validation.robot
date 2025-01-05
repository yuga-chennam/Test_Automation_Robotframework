*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.tutorialspoint.com/selenium/selenium_automation_practice.htm
${browser}    Chrome


*** Test Cases ***
Validate Reg Form
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed        3s
    Input Text    name:firstname     Jack
    Input Text    name:lastname      Ryans
    Wait Until Element Is Visible        css:input[name='sex'][type='radio'][value='Male']
    #Select Radio Button     sex    Male
    Click Element      xpath://input[@value='Male']
    #Wait Until Element Is Visible       css:input[name='exp'][value='7']       timeout=5s
    #Execute Javascript     window.scrollTo(0, document.querySelector('css:input[name='exp'][value='7']'))
    #Click Element        css:input[name='exp'][value='7']
    #Select Radio Button   exp     7
    Input Text     xpath://*[@id="mainContent"]/div[3]/div/form/div/table/tbody/tr[5]/td[2]/input    23/01/2002
    Wait Until Element Is Visible     css:input[name='profession'][value='Automation Tester']
    Select Checkbox     link:Automation Tester
    Select Checkbox     css:input[value='Selenium Webdriver']
    Select From List By Label     name:continents         Australia
    Select From List By Value     name:selenium_commands      Navigation Commands    Wait Commands
    Click Element            name:submit
    # Click Element        xpath://*[contains(text(),'submit')]