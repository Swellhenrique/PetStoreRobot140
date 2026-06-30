*** Settings ***
Library    RequestsLibrary
Library    DataDriver    ../fixtures/json/csv/users.csv
Variables    ../resources/variables.py

Test Template    Executar Post User Dinamico

*** Test Cases ***

TC001     ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}
TC002     ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}
TC003     ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}


*** Keywords ***
Executar Post User Dinamico
    [Arguments]    ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}
    &{body}=    Create Dictionary
    ...    id=${id}
    ...    username=${username}
    ...    firstName=${firstName}
    ...    lastName=${lastName}
    ...    email=${email}
    ...    password=${password}
    ...    phone=${phone}
    ...    userStatus=${userStatus}

    ${response}=    POST    ${url}    json=${body}

    ${response_body}=    Set Variable    ${response.json()}

    Status Should Be    200
    Should Be Equal    ${response_body}[type]    unknown
    Should Be Equal As Strings    ${response_body}[message]    ${id}