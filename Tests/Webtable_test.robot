*** Settings ***
Library     SeleniumLibrary

Test Setup      Start browser with test site

*** Variables ***


*** Test Cases ***
Verify data in static web table
    Identify the table
    Get the rows of data from table
    Compare table values with expected data


*** Keywords ***
Start browser with test site
    Open Browser        https://www.techlistic.com/2017/02/automate-demo-web-table-with-selenium.html        Chrome
    Maximize Browser Window

Identify the table
    ${get_table}    Get Webelement     css:#customers
    Log     ${get_table}
    Get Table Cell         css:#customers        3     2

Get the rows of data from table
   ${row_count}        Get Element Count    xpath://table[@id='customers']/tbody/tr
   ${column_count}     Get Element Count    xpath://table[@id='customers']/tbody/tr/td
   Log Many          ${row_count}    ${column_count} 
   #@{rows_locator}    Get Webelements
   FOR   ${row}  IN RANGE    1   ${row_count}+1
       FOR    ${column}  IN RANGE   1   ${column_count}+1
           ${cell_value}   Run Keyword And Continue On Failure      Get Table Cell     xpath://div[@dir='ltr']/table[@id='customers']/tbody/tr[${row}]/td[${column}]     ${row}   ${column}
           Run Keyword If    '${cell_value}'  != 'FAIL'
           Log To Console        ${cell_value}
       END
   END
   
Compare table values with expected data
    Pass Execution        PASS