*** Settings ***
Library        SeleniumLibrary


*** Keywords ***
start browser with test url
    Open Browser        https://rahulshettyacademy.com/loginpagePractise/        Chrome
    Maximize Browser Window