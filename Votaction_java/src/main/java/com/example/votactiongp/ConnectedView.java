package com.example.votactiongp;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import java.io.IOException;
import java.util.Objects;

public class ConnectedView {

    @FXML
    private Button DecoButton;

    @FXML
    void OnClickDeconnexionButton(ActionEvent event) throws IOException {
        Parent Home = FXMLLoader.load(Objects.requireNonNull(HelloApplication.class.getResource("hello-view.fxml")));
        Scene scene = new Scene(Home);
        System.out.println(scene.getWidth());
        System.out.println(scene.getHeight());
        Stage appStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        appStage.setScene(scene);
        appStage.show();
    }

}

