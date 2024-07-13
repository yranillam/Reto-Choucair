package questions;

import groovy.json.JsonParser;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.response.ResponseBody;
import io.restassured.response.ResponseBodyData;
import net.serenitybdd.rest.SerenityRest;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Question;
import org.apache.poi.hpsf.Decimal;
import org.json.JSONArray;
import org.json.JSONObject;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class Valida implements Question<List<String>> {

    private List<String> listaPath;

    public Valida(List<String> listaPath) {
        this.listaPath = listaPath;
    }

    public static Valida bodyRespuesta(List<String> listaPath) {
        return new Valida(listaPath);
    }

    @Override
    public List<String> answeredBy(Actor actor) {

        Response lastResponse = SerenityRest.lastResponse();
        List<String> resultado = new ArrayList<>();

        for (String s : listaPath) {
            Object path = lastResponse.path(s);

            if (path.toString().equals("")) {
                resultado.add("no tiene mensaje");
                } else {
                    resultado.add(path.toString());
                }
            }

        return resultado;
    }
}


