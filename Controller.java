package controller;

import database.DataBase;
import items.Account;
import utills.Convertor;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Controller {
    public String  login (String data ) throws IOException {

        Map<String,String> map= Convertor.stringToMap(data);
        if(DataBase.getInstance().isLoginValid(map)==null){
            return "no";
        }
        return DataBase.getInstance().isLoginValid(map);
    }
    public String signup(String data) throws IOException {
        Map<String ,String > map=Convertor.stringToMap(data);
        if(DataBase.getInstance().isLoginValid(map)==null){
            DataBase.getInstance().insertAccount(new Account(map.get("username"),map.get("email"),map.get("password")));
            return "yes";
        }
        return "no";
    }
    private String addItem(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().addMoney(map);
    }
    private String bookHotel(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().bookHotel(map);
    }
    private String numberOf(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().numberOf(map);
    }
    private String bookFlightA(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().bookFlightA(map);
    }
    private String bookFlightB(String data) throws IOException {
        Map<String,String> map=Convertor.stringToMap(data);
        return DataBase.getInstance().bookFlightB(map);
    }
    public String run(String command,String data) throws IOException {
//        System.out.println(command);
        switch (command){
            case "login":{
                return login(data);
            }
            case "signup":{
              return signup(data);
            }
            case "addMoney":{
                return addItem(data);
            }
            case  "bookFlightB":{
                return bookFlightB(data);
            }
            case  "bookFlightA":{
                return bookFlightA(data);
            }
            case "bookHotel":{
                return bookHotel(data);
            }
        }
        return "";
    }



}
