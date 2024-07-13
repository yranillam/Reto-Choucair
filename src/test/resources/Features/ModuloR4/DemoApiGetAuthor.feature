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
    ##@externaldata@src/test/resources/Datadriven/ModuloR4/ModuloR4UAT.xlsx@API_AUTHOR
|DEMO-API|Get a Single Author by ID|URL_BASE_REDIRECCIONAR_LINK2|/authors/2|GET|||200|books[1].name|Cypress Tutorial|||||
|DEMO-API|Get a Single Author by ID invalido|URL_BASE_REDIRECCIONAR_LINK2|/authors/15|GET|||404|msg|Author with id 15 doesn't exist|||||

