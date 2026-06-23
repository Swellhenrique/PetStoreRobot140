*** Settings ***
Library    RequestsLibrary

*** Variables ***

${url}    https://petstore.swagger.io/v2/store

${id}            1213
${petId}        12450899002
${quantity}     1
${shipDate}     2026-06-10T23:15:00.732Z
${status}      delivered
${complete}    true


*** Test Cases ***

Post Order
    ${body}    Create Dictionary    id=${id}    petId=${petId}      quantity=${quantity}    
    ...    shipDate=${shipDate}    status=${status}    complete=${complete}

    ${response}    POST    url=${url}/order    json=${body}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    
    Status Should Be    200
    Should Be Equal    ${response_body}[id]    ${{int($id)}}
    Should Be Equal    ${response_body}[petId]    ${{int($petId)}}
    Should Be Equal    ${response_body}[status]    ${status}
    Should Be Equal    ${response_body}[complete]    ${True}

Get Order
    ${response}    GET    url=${url}/order/${id}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[id]    ${{int($id)}}
    Should Be Equal    ${response_body}[petId]    ${{int($petId)}}
    Should Be Equal    ${response_body}[status]    ${status}
    Should Be Equal    ${response_body}[complete]    ${True}


DeLete Order
    ${response}    DELETE    url=${url}/order/${id}

    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal  ${response_body}[code]        ${{int(200)}}  
    Should Be Equal    ${response_body}[type]        unknown
    Should Be Equal    ${response_body}[message]    ${id}
