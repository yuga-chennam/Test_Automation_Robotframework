*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn



*** Variables ***
${url}                        https://www.irctc.co.in/nget/train-search
${borwser_name}                Chrome
${block_notification}          id:block
${timeout}                     10s


*** Test Cases ***
Validate Login to Irctc
    Navigate to irctc website
    Login with user creds


*** Keywords ***
Navigate to irctc website
    Open Browser        ${url}        ${borwser_name}
    Maximize Browser Window
    Wait Until Element Is Visible        css:.h_menu_drop_button.hidden-xs
    Click Element                        css:.h_menu_drop_button.hidden-xs
    Click Element                        xpath://button[@class='search_btn']
                                        # xpath://button[contains(text(),LOGIN)]

Login with user creds
    Input Text            xpath://input[@placeholder='User Name']           chyskumar
    Input Password        xpath://input[@placeholder='Password']           Yuga@123
    sleep     10s
    #Dismiss notification popup
    Click Element             xpath://button[contains(text(),'SIGN IN')]
    Sleep        ${timeout}
    Wait Until Page Contains Element            xpath://*[contains(text(),' Last Transaction Detail ')]         ${timeout}
    Page Should Contain Element                xpath://*[contains(text(),' Last Transaction Detail ')]


Dismiss notification popup
    ${notification_denied}=      Set Variable         Notification.permission='denied'
    Execute Javascript           ${notification_denied}
    Handle Alert    dismiss


