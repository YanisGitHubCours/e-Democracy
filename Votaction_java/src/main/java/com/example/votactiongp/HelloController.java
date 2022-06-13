package com.example.votactiongp;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.Objects;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.ResponseBody;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import com.fasterxml.jackson.databind.ObjectMapper;

public class HelloController {


    public Label LabelConnexionKo;
    @FXML
    private Button ConnexionButton;

    @FXML
    private TextField Password;

    @FXML
    private TextField Username;

    public HelloController() {
    }

    // SI UN EMAIL INCORRECT EST ENTRER CRASH
    @FXML
    void OnClickConnexionButton(ActionEvent event) throws IOException {
        String username = Username.getText();
        String password = Password.getText();
        System.out.println(tryConnexion(username, password));
        login(event, tryConnexion(username, password));
    }

    @FXML
    private void login(javafx.event.ActionEvent event, String UserToken) throws IOException {
        if (!Objects.equals(UserToken, "BadCredentials")) {
            Parent Home = FXMLLoader.load(Objects.requireNonNull(HelloApplication.class.getResource("connected-view.fxml")));
            Scene scene = new Scene(Home);
            Stage appStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            appStage.setScene(scene);
            appStage.show();
        } else {
            LabelConnexionKo.setText("Password or login is incorrect. Please Try Again");
        }
    }

    private String tryConnexion(String username, String password) {
        try {
            OkHttpClient client = new OkHttpClient().newBuilder()
                    .build();
            MediaType mediaType = MediaType.parse("application/json");
            RequestBody body = RequestBody.create("{\"email\": \"" + username + "\",\"password\": \"" + password + "\"}", mediaType);
            Request request = new Request.Builder()
                    .url("http://localhost:8081/uLogin")
                    .method("POST", body)
                    .addHeader("Content-Type", "application/json")
                    .build();
            ResponseBody response = client.newCall(request).execute().body();
            if (!"application/json; charset=utf-8".equals(response.contentType().toString())){
                return "BadCredentials";
            }
            ObjectMapper objectMapper = new ObjectMapper();
            User UserToken = objectMapper.readValue(response.string(), User.class);
            return UserToken.getToken();
        } catch (Exception e) {
            return e.toString();
        }
    }
}
