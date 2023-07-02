package items;

import java.io.IOException;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class hotels implements Serializable {
    public String hotelName;
    public String  guests;
    public String  price;
    public String dateFrom;
    public String dateTo;

    String data;
    public List<String> infoTicket;
    public hotels(String data) throws IOException {
        this.data=data;
        infoTicket= new ArrayList<>();
        Path path= Paths.get("src/data/hotels.txt");
        List<String> flightsLine= Files.readAllLines(path);
        for(String line : flightsLine){

        }
    }

}
