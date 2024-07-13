package stepdefinitions;


import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.actors.Cast;
import net.serenitybdd.screenplay.actors.OnStage;
import net.thucydides.core.util.EnvironmentVariables;
import org.openqa.selenium.WebDriver;
import questions.LastResponseStatusCode;
import questions.Valida;
import task.Consumo;

import java.io.IOException;
import java.util.*;
import java.util.List;

import static net.serenitybdd.screenplay.GivenWhenThen.seeThat;
import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

public class ApiDemoStepDefinitions extends PageObject {
    WebDriver wd;
    private EnvironmentVariables environmentVariables;

    @Before
    public void setStage() {
        OnStage.setTheStage(new Cast());
    }

    @Given("^quiero ejecutar el API (.+) con la peticion (.+)$")
    public void quieroEjecutarElAPIConLaPeticion(String api, String peticion) {
    }

    @When("^consumo el api (.+) con la data data de prueba$")
    public void consumoElApiConLaDataDePrueba(String api, DataTable datosPeticion) throws IOException {
        List<String> datos = datosPeticion.topCells();
        String url, body, metodo, adjunto, query;
        String[] pathFile, nameKeys;
        String body2 = "";
        String body3 = "";

        url = environmentVariables.getProperty(datos.get(0)) + datos.get(1);
        body = datos.get(4);
        pathFile = datos.get(5).split("#");
        nameKeys = datos.get(6).split("#");
        for (int i = 0; i < pathFile.length; i++) {
            pathFile[i] = pathFile[i].replace("vacio", "");
        }

        metodo = datos.get(2);

        if (datos.size() >= 8) {
            query = datos.get(7);
        } else {
            query = null;
        }
        System.out.println(url);
        Map<String, String> headers = new HashMap<>();



        OnStage.theActorCalled("Operador/ambos").wasAbleTo(
                Consumo.elApi(metodo, url, headers, body, pathFile, nameKeys, query));


    }

    @Then("^verifico el status code (.+)$")
    public void verificoElStatusCode(int sc) {
        System.out.println(sc);
        OnStage.theActorInTheSpotlight().should(seeThat("El status code: ", LastResponseStatusCode.is(), equalTo(sc)));
        // System.out.println("El status code: "+ SerenityRest.lastResponse().prettyPeek());
    }

    @Then("^las respuestas esperadas (.+) en las rutas (.+) del response$")
    public void lasRespuestasEsperadasEnLasRutasDelResponse(String respuestasEsperadas, String rutas) {
        System.out.println(respuestasEsperadas);
        System.out.println(rutas);
        String[] respuestasE, rutasList;
        respuestasE = respuestasEsperadas.split("#");
        rutasList = rutas.split("#");
        List<String> re;
        List<String> ru;
        re = Arrays.asList(respuestasE);
        ru = Arrays.asList(rutasList);
        OnStage.theActorInTheSpotlight().should(seeThat("Respuesta esperada", Valida.bodyRespuesta(ru), equalTo(re)));
    }

}