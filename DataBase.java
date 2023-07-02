package database;

import items.Account;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

public class DataBase {
    private static DataBase instance = null;

    private DataBase() {
    }

    public static DataBase getInstance() {
        if (instance == null) {
            instance = new DataBase();
        }
        return instance;
    }

    public String isLoginValid(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        if (lines.size() == 0) {
            return null;
        }
        for (String line : lines) {
            if ((line.split(",")[0].equals(map.get("username")) || line.split(",")[1].equals(map.get("username")) && map.get("password").equals(line.split(",")[2]))) {
                return line;
            }
        }
        return null;
    }

    public void insertAccount(Account account) throws IOException {
        FileWriter fileWriter = new FileWriter("src/data/Accounts.txt", true);
        if (Files.readAllLines(Paths.get("src/data/Accounts.txt")).size() != 0) {
            fileWriter.write("\n");
        }
        fileWriter.write(account.username + "," + account.email + "," + account.password+","+account.money+","+account.birthDate+","+account.phoneNumber);

        fileWriter.close();

    }




    public String changeAccountInfo(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        Map<String, String> isvalid = new HashMap<>();
        isvalid.put("username", map.get("username"));
        isvalid.put("email", map.get("email"));
        isvalid.put("password", map.get("password"));
        if (isLoginValid(isvalid) == null) {
            for (int i = 0; i < lines.size(); i++) {
                if (lines.get(i).split(",")[0].equals(map.get("lastUsername")) && lines.get(i).split(",")[1].equals(map.get("lastEmail")) && lines.get(i).split(",")[2].equals(map.get("lastPassword"))) {
                    String hold = map.get("username") + "," + map.get("email") + "," + map.get("password") + "," + lines.get(i).split(",")[3] + "," + lines.get(i).split(",")[4] + "," + lines.get(i).split(",")[5] + "," + lines.get(i).split(",")[6] + "," + lines.get(i).split(",")[7] + ",";
                    lines.set(i, hold);
                    break;
                }
            }
            Files.write(path, lines);
            return "yes";
        }
        return "no";
    }

    public String addMoney(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        Map<String, String> isvalid = new HashMap<>();
        isvalid.put("username", map.get("username"));
        isvalid.put("email", map.get("email"));
        isvalid.put("password", map.get("password"));
        String person = isLoginValid(isvalid);
        String javab = null;
        if (person != null) {
            for (int i = 0; i < lines.size(); i++) {
                if (lines.get(i).split(",")[0].equals(map.get("username")) && lines.get(i).split(",")[1].equals(map.get("email")) && lines.get(i).split(",")[2].equals(map.get("password"))) {
                    javab = String.valueOf(Double.parseDouble(lines.get(i).split(",")[3]) + Double.parseDouble(map.get("money")));
                    String hold = lines.get(i).split(",")[0] + "," + lines.get(i).split(",")[1] + "," + lines.get(i).split(",")[2] +","+ javab+ "," + lines.get(i).split(",")[4] + "," + lines.get(i).split(",")[5] ;
                    System.out.println(Double.parseDouble(map.get("money")));
                    lines.set(i, hold);
                    break;
                }
            }
            Files.write(path, lines);
            return javab;
        }
        return "no";
    }

    public String bookHotel(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/hotels.txt");
        List<String> lines = Files.readAllLines(path);
        String person = isLoginValid(map);
        if (person != null) {

                }
          return "Hotel have been Booked";
    }
    public String numberOf(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/Accounts.txt");
        List<String> lines = Files.readAllLines(path);
        String person = isLoginValid(map);
        if (person != null) {

        }
        return "saved";
    }
    public String bookFlightA(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/flights.txt");
        List<String> lines = Files.readAllLines(path);
        String person = isLoginValid(map);
        if (person != null) {

        }
        return "Flight Ticket have Booked";
    }

    public String bookFlightB(Map<String, String> map) throws IOException {
        Path path = Paths.get("src/data/flights.txt");
        List<String> lines = Files.readAllLines(path);
        String person = isLoginValid(map);
        if (person != null) {

        }
        return "Booked";
    }


}
