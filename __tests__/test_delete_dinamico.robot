*** Settings ***
Library    RequestsLibrary
Library    DataDriver    ../fixtures/json/csv/users.csv    dialect=excel
Variables    ../resources/variables.py

Test Template    Executar Delete User Dinamico

*** Test Cases ***


TC002 Delete    ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}
TC003 Delete    ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}


*** Keywords ***
Executar Delete User Dinamico
    [Arguments]    ${id}    ${username}    ${firstName}    ${lastName}    ${email}    ${password}    ${phone}    ${userStatus}
    ${headers}=    Create Dictionary    Content-Type=${content_type}

    ${body}=    Create Dictionary    id=${id}    username=${username}   firstName=${firstName}    lastName=${lastName}  email=${email}  password=${password}    phone=${phone}
    ...    userStatus=${userStatus}

    ${response}=    DELETE   url=${url}/${body}[username]   headers=${headers}

    ${response_body}=    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[type]    unknown
    Should Be Equal As Strings    ${response_body}[message]    ${username}