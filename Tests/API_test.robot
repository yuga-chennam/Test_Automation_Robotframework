*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${Baseurl}    https://jsonplaceholder.typicode.com/users

*** Test Cases ***
Validate API reponse for get
    [Tags]        SMOKE
    ${response}=     GET    ${Baseurl}
    Request Should Be Successful
    Log Many         ${response.json()}           ${response.json()}[0][name]    ${response.json()}[1][name]
    Should Be Equal As Strings        ${response.json()}[0][name]        Leanne Graham
    Dictionary Should Contain Item        ${response.json()}[9][address]    city    Lebsackbury


Validate API reponse for post
    &{req_params}=    Create Dictionary    id=11   name=Ervin Antonette   username= Samantha 	email= Nathan@yesenia.net    phone= 1-463-123-4447    website= ramiro.info
    ${post_resp}=     POST      ${Baseurl}       json=${req_params}        expected_status=201
    Status Should Be    201     ${post_resp}
    

Retrieve the data for specific user
    [Tags]            USER
    ${resp_user}=     GET    ${Baseurl}     params=id=8    expected_status= 200
    Get From Dictionary    ${resp_user.json()}[0][address]    city
    Log To Console        ${resp_user.json()}


Delete the resource
    [Tags]        DELETE
    DELETE        url= https://jsonplaceholder.typicode.com//users   params=id=8        expected_status=404




