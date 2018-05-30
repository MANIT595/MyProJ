package sample;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import java.util.Optional;

public class Main extends Application {
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start (Stage primaryStage) throws Exception {
        FXMLLoader loader = new
                FXMLLoader(getClass().getResource("app_layout.fxml"));
        VBox rootNode = loader.load();
        MenuBar menuBar = createMenu();
        rootNode.getChildren().add(0,menuBar);

        Scene scene = new Scene(rootNode);

        primaryStage.setScene(scene);
        primaryStage.setTitle("Hello JavaFX");
        primaryStage.show();

    }
    private MenuBar createMenu()
    {
        Menu fileMenu = new Menu("File"); // creating file menu
        MenuItem newMenuItem = new MenuItem("New");
        newMenuItem.setOnAction(event -> System.out.println("Hello"));

        SeparatorMenuItem separatorMenuItem = new SeparatorMenuItem();
        MenuItem quitMenuItem = new MenuItem("Quit");
        quitMenuItem.setOnAction(event -> { Platform.exit();  System.exit(0); });

        fileMenu.getItems().addAll(newMenuItem,separatorMenuItem,quitMenuItem);
        Menu helpMenu = new Menu("Help");
        helpMenu.setOnAction(event -> aboutApp());
        MenuItem aboutApp = new MenuItem("About");
        helpMenu.getItems().addAll(aboutApp);
        MenuBar menuBar = new MenuBar();
        menuBar.getMenus().addAll(fileMenu,helpMenu);
        return menuBar;
    }
    private void aboutApp()
    {
        Alert alertDialog = new Alert(Alert.AlertType.INFORMATION);
        alertDialog.setTitle("My First Desktop APP");
        alertDialog.setHeaderText("Learning JavaFX");
        alertDialog.setContentText("I am Not Pro");
        ButtonType yes = new ButtonType("Yes");
        ButtonType no = new ButtonType("No");
        alertDialog.getButtonTypes().setAll(yes,no);


        Optional<ButtonType> clickedBtn  = alertDialog.showAndWait();
        if(clickedBtn.isPresent() &&clickedBtn.get()==yes){

        }
        if (clickedBtn.isPresent() && clickedBtn.get()==no)
        {

        }


    }
}
