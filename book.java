package items;

import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class book implements Serializable {
    public String flightFrom;
    public String flighTo;
    public String airline;
    public String  passengers;
    public String  price;
    public String dateFrom;
    public String dateTo;

    String data;
    public List<String> infoTicket;
    public book(String data) throws IOException {
        this.data=data;
        infoTicket= new ArrayList<>();
        Path path= Paths.get("src/data/flights.txt");
        List<String> flightsLine= Files.readAllLines(path);
        for(String line : flightsLine){

        }
    }

}
