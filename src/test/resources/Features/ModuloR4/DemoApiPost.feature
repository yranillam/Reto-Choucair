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
    ##@externaldata@src/test/resources/Datadriven/ModuloR4/ModuloR4UAT.xlsx@API_CREATE_POST
|DEMO-API|Create a Member |URL_BASE_REDIRECCIONAR_LINK2|/members|POST|Content-Type:application/json|{"name":"Juana","gender":"Male"}|200|name|Juana|||||
|DEMO-API|Create a member con nombre vacio|URL_BASE_REDIRECCIONAR_LINK2|/members|POST|Content-Type:application/json|{"name":"","gender":"Male"}|400|msg|Please provide only name and gender|||||

