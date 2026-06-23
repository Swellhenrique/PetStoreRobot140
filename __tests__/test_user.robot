*** Settings ***
Library    RequestsLibrary
Variables    ../resources/variables.py



*** Test Cases ***

Post User
    ${body}    Evaluate    json.loads(open('./fixtures/json/user1.json').read())

    ${response}    POST    url=${url}    json=${body}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response.json()}

    Status Should Be    200
    Should Be Equal    ${response_body}[code]        ${{int(200)}}
    Should Be Equal    ${response_body}[type]        unknown
    Should Be Equal    ${response_body}[message]     ${id}


Get User
    ${response}    GET    ${url}/${username}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[id]            ${{int($id)}}
    Should Be Equal    ${response_body}[username]      ${username}
    Should Be Equal    ${response_body}[email]         ${email}
    Should Be Equal    ${response_body}[userStatus]    ${{int($userStatus)}}


Put User

    ${body}    Evaluate    json.loads(open('./fixtures/json/user2.json').read())

    ${response}    PUT    url=${url}/${username}    json=${body}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[code]        ${{int(200)}}
    Should Be Equal    ${response_body}[type]        unknown
    Should Be Equal    ${response_body}[message]     ${id}



Delete User 
    ${body}    Evaluate    json.loads(open('./fixtures/json/user1.json').read())

    ${response}    DELETE    url=${url}/${body}[username]

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[code]        ${{int(200)}}
    Should Be Equal    ${response_body}[type]        unknown
    Should Be Equal    ${response_body}[message]     ${username}


