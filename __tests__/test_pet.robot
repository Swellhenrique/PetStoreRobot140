*** Settings ***
# bibliotecas e configuraçoes 
Library    RequestsLibrary

*** Variables ***
# objetos, atributos e variaveis
${url}       https://petstore.swagger.io/v2/pet

${id}        12450899001                        # $ sinaliza uma variavel simples 
${name}      Thor
&{categoty}    id=1    name=cachorro            # = uma lista com campos determinados. Ex: id e name - seria {}  ---////-- e @ sinaliza uma lista com varios registros 
@{photoUrls}                                                             
&{tag}    id=1    name=vacinado 
@{tags}    ${tag}                               # fez uma lista de outra lista
${status}    available


*** Test Cases ***
# Descritivo de Negócio + passos de Automaçao

Post Pet
    ${body}    Create Dictionary    id=${id}    category=${categoty}    name=${name}    
    ...             photoUrls=${photoUrls}    tags=${tags}    status=${status}

    #executar
    ${response}    POST    url=${url}    json=${body}
    
    #validar
    ${response_body}    Set Variable    ${response.json()}                # tive que por o Set Variable para reconhecer ${response_body} / recebe o conteudo da outra variavel
    Log To Console    ${response.json()}                          # imprimir o retorno da API no terminal / console

    Status Should Be    200
    Should Be Equal    ${response_body}[id]               ${{int($id)}}
    Should Be Equal    ${response_body}[name]             ${name}
    Should Be Equal    ${response_body}[tags][0][id]      ${{int(${tag}[id])}}
    Should Be Equal    ${response_body}[tags][0][name]    ${tag}[name]
    Should Be Equal    ${response_body}[status]               ${status}


Get pet

    # Executa
    ${response}    GET    ${{$url + '/' + $id}}

    # Valida
    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[id]    ${{int($id)}}
    Should Be Equal    ${response_body}[name]    ${name}
    Should Be Equal    ${response_body}[category][id]    ${{int(${categoty}[id])}}
    Should Be Equal    ${response_body}[category][name]    ${categoty}[name]

Put pet
    # Montar a mensagem / body com a mudança
    ${body}    Evaluate    json.loads(open('./fixtures/json/pet2.json').read())

    # Executa
    ${response}    PUT    url=${url}    json=${body}

    # Valida
    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[id]                   ${{int($id)}}
    Should Be Equal    ${response_body}[category][id]         ${{int(${categoty}[id])}}
    Should Be Equal    ${response_body}[category][name]       ${categoty}[name] 
    Should Be Equal    ${response_body}[name]                 ${name}
    Should Be Equal    ${response_body}[tags][0][id]          ${{int(${tag}[id])}}
    Should Be Equal    ${response_body}[tags][0][name]        ${tag}[name]
    Should Be Equal    ${response_body}[status]               sold
    Should Be Equal    ${response_body}[status]               ${body}[status]


Delete Pet
    # Executa
    ${response}    DELETE    ${{$url + '/' + $id}}

    # Valida
    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[code]        ${{int(200)}}
    Should Be Equal    ${response_body}[type]        unknown
    Should Be Equal    ${response_body}[message]    ${id}


*** Keywords ***
# Descritivo de Negócio (se estruturar separadamente)
# DSL = Domain Spefic Languages = Linguagem Especifica de dominio 

