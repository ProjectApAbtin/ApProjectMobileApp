package items;

import database.DataBase;

import java.io.Serializable;
import java.util.ArrayList;

public class Account implements Serializable {
    public String username;
    public String email;
    public String password;
    public String phoneNumber=" ";
    public String birthDate = " ";

    public double money=0;

    public Account(){}
    public Account(String username,String email,String password){
        this.username=username;
        this.email=email;
        this.password=password;

    }

    @Override
    public String toString() {
        return username+email+password;
    }
}
