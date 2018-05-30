package sample;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.Initializable;
import javafx.scene.control.*;

import java.net.URL;
import java.util.ResourceBundle;

public class Controller implements Initializable {

    public Label welcomeLabel;
    public ChoiceBox<String> choiceLabel;
    public TextField textLabel;
    public Button buttonLabel;
    private static final String C_TO_F_TEXT ="Celcius to Farenheit";
    private static final String F_TO_C_TEXT ="Farenheit to Celcius";
    private boolean isC_TO_F = true;
    @Override
    public void initialize(URL location, ResourceBundle resources) {

        buttonLabel.setOnAction(event -> { 
            convert();
        } );
        choiceLabel.getItems().add(C_TO_F_TEXT);
        choiceLabel.getItems().add(F_TO_C_TEXT);
        choiceLabel.setValue(C_TO_F_TEXT);
        choiceLabel.getSelectionModel().selectedItemProperty().addListener((observable, oldValue, newValue) -> {
            if(newValue.equals(C_TO_F_TEXT)){
                isC_TO_F = true;
            }
            else {
                isC_TO_F = false;
            }
        });

    }

    private void convert() {
        try {


            String input = textLabel.getText();
            float enteredTemperature = Float.parseFloat(input);
            float newTemperature = 0.0f;
            if (isC_TO_F) {
                newTemperature = (enteredTemperature * 9 / 5) + 32;
            } else {

                newTemperature = (enteredTemperature - 32) * 5 / 9;

            }
            display(newTemperature);
        }
        catch (Exception e )
        {
            Alert a =  new Alert(Alert.AlertType.WARNING);
            a.setTitle("Warning");
            a.setHeaderText("Invalid Input Entered");
            a.setContentText("You Have Entered Wrong Input");
            a.show();
            return;
        }
    }
    private void display(float newTemperature)
    {
        String unit = isC_TO_F? "F" : "C";
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Result");
        alert.setContentText("The New Temperature is :" + newTemperature+ " "+unit);
        alert.show();
    }
}
