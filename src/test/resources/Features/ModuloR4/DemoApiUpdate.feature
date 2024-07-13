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
    ##@externaldata@src/test/resources/Datadriven/ModuloR4/ModuloR4UAT.xlsx@API_UPDATE
|DEMO-API|Update a member  by Id|URL_BASE_REDIRECCIONAR_LINK2|/members/5|PATCH|Content-Type:application/json|{"name":"Alee"}|200|msg|Member with id 5 is updated successfully|||||
|DEMO-API|Update a member id invalido|URL_BASE_REDIRECCIONAR_LINK2|/members/6|PATCH|Content-Type:application/json|{"name":"Alee"}|404|msg|Member with id 6 doesn't exist|||||

