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

public class HelloController {

    public Label LabelConnexionKo;
    @FXML
    private Button ConnexionButton;

    @FXML
    private TextField Password;

    @FXML
    private TextField Username;

    @FXML
    void OnClickConnexionButton(ActionEvent event) throws IOException {
        login(event);
    }

    @FXML
    private void login(javafx.event.ActionEvent event) throws IOException {
        System.out.println(Username.getText().equals("admin"));
        if(Username.getText() == "admin" && Password.getText() == "admin") {
            Parent Home = FXMLLoader.load(Objects.requireNonNull(HelloApplication.class.getResource("connected-view.fxml")));
            Scene scene = new Scene(Home);
            Stage appStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
            appStage.setScene(scene);
            appStage.show();
        } else {
            LabelConnexionKo.setText("Password or login is incorrect. Please Try Again");
        }
    }

}
