*** Settings ***
Library    Collections

*** Test Cases ***
Getting handson with robot dictionary
    &{dict}=  Create Dictionary    key1=value1  key2=value2  key3=value3
    &{dict1}=  Create Dictionary    first_name=Yuga    middle_name=Srinivas    last_name=Chennam
    Log Many             ${dict}     ${dict1}[middle_name]
    Dictionary Should Contain Key        ${dict1}        last_name
    Dictionary Should Contain Item            ${dict}        key2        value2
    ${value}=    Get From Dictionary        ${dict}    key1
    Log To Console      ${value}