Feature: TI-EA2023-12608-R3 Compliance getExtenalLink

  @UAT @DemoApi @Ejecutar
    #EXT00001_Redireccionar_Link
  Scenario Outline: <Peticion>

    Given quiero ejecutar el API <API> con la peticion <Peticion>
    When consumo el api <API> con la data data de prueba
      | <UrlBase> | <EndPoint> | <METODO> | <HEADERS> | <BODY> | <PathFile> | <NameKeys> |
    Then verifico el status code <StatusCode>
    And las respuestas esperadas <RespuestasEsperadas> en las rutas <PATHS> del response
    ##And valido los <CamposVariables> con url del response <urlEsperada>

    Examples:
      | API                         | Peticion                                                      | UrlBase                     | EndPoint                                                  | METODO | HEADERS                                                                                                                                                                                                            | BODY                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | StatusCode | PATHS                                                                  | RespuestasEsperadas                                                          | CamposVariables                                     | urlEsperada                                                                           | PathFile | NameKeys |
    ##@externaldata@src/test/resources/Datadriven/ModuloR4/ModuloR4UAT.xlsx@API_MEMBERS_PUT
|DEMO-API|Update a Member Via PUT|URL_BASE_REDIRECCIONAR_LINK2|/members/4|PUT|Content-Type:application/json|{ "name": "Jose", "gender": "Male"}|200|msg|Member with id 4 is updated successfully|||||
|DEMO-API|Update a Member Via PUT con nombre vacio|URL_BASE_REDIRECCIONAR_LINK2|/members/4|PUT|Content-Type:application/json|{ "name": "", "gender": "Male"}|400|msg|Name should be 4 to 25 characters long|||||
|DEMO-API|Update a Member Via PUT con gender vacio|URL_BASE_REDIRECCIONAR_LINK2|/members/4|PUT|Content-Type:application/json|{ "name": "Alberto", "gender": ""}|400|msg|Name should be 4 to 25 characters long|||||

