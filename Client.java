import network.Server;

import java.io.*;
import java.net.Socket;
import java.util.Formatter;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) throws IOException {
//        new Server().start();
        Socket socket=new Socket("127.0.0.1",8001);
        DataOutputStream dos=new DataOutputStream(socket.getOutputStream());
        DataInputStream dis=new DataInputStream(socket.getInputStream());

        dos.writeUTF("addMoney\nusername:abtin,email:abtin@gmail.com,password:1234,money:100");
        dos.flush();
        System.out.println(dis.readUTF());
//        System.out.println(dis.readUTF());
        socket.close();
        dos.close();
        dos.close();
    }
}

//addMoney\nusername:abtin,email:abtin@gmail.com,password:1234,money:250
//login\nusername:abtin,password:1234
//signup\nusername:abtin,email:abtin@gmail.com,password:1234
//changeAccountInfo\nusername:abtin,email:abtin@gmail.com,password:1234,birthday:2222,phoneNumber:09102091575
