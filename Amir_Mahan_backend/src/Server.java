import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;

import javax.xml.crypto.Data;
import javax.xml.transform.Source;

public class Server {
    static boolean isServerUp = true;
    static int port = 8080;
    public static void main(String[] args) {
         try {
             ServerSocket serverSocket = new ServerSocket(port);
             Controller controller1 = new Controller(new File("C:/Users/mahan/Desktop/sample/DataBases/Users.txt"));
             DataBase.getSingleTone().addDataBase("Users", controller1);
             Controller controller2 = new Controller(new File("C:/Users/mahan/Desktop/sample/DataBases/UsersFullInfo.txt"));
             DataBase.getSingleTone().addDataBase("UsersFullInfo", controller2);
             Controller controller3 = new Controller(new File("C:/Users/mahan/Desktop/sample/DataBases/Comments.txt"));
             DataBase.getSingleTone().addDataBase("Comments", controller3);
             Controller controller4 = new Controller(new File("C:/Users/mahan/Desktop/sample/DataBases/Posts.txt"));
             DataBase.getSingleTone().addDataBase("Posts", controller4);
             Controller controller5 = new Controller(new File("C:/Users/mahan/Desktop/sample/DataBases/Community.txt"));
             DataBase.getSingleTone().addDataBase("Community", controller5);
             while (isServerUp) {
                 Socket socket = serverSocket.accept();
                 System.out.println("Connected");
                 RequestHandler requestHandler = new RequestHandler(socket);
                 requestHandler.start();
             }
         } catch (IOException e) {
             e.printStackTrace();
         }
    }
}

class RequestHandler extends Thread {
    Socket socket;
    DataInputStream dis;
    DataOutputStream dos;

    public RequestHandler(Socket socket) throws IOException {
        this.socket = socket;
        dis = new DataInputStream(socket.getInputStream());
        dos = new DataOutputStream(socket.getOutputStream());
    }

    String listener() {
        StringBuilder listen = new StringBuilder();
        char i;
        try {
            while ((i = (char) dis.read()) != ';') {
                listen.append(i);
            }
        } catch (IOException e) {
            try {
                dis.close();
                dos.close();
                socket.close();
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
            e.printStackTrace();
        }
        return listen.toString();
    }//\n

    void writer(String write) {
        if (write != null && !write.isEmpty()) {
            try {
                dos.writeBytes(write);
                System.out.println("write: " + write);
            }
             catch (IOException e) {
                try {
                    dis.close();
                    dos.close();
                    socket.close();
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
                e.printStackTrace();
            }
            return;
        }
        System.out.println("invalid write");
    }

    @Override
    public void run() {
        String request = listener();
        String[] requestSplit = request.split("-");
        String command = requestSplit[0];
        String[] args = new String[requestSplit.length - 1];
        for (int i = 1; i < requestSplit.length; i++) {
            args[i - 1] = requestSplit[i];
        }

        String response = "";
        switch (command) {
            case "signIn":
            {
                String exists = DataBase.getSingleTone().getController("Users").readFile("check1" + "-" + args[0] + "-" + args[1]);
                if (exists.equals("true")) {
                    response = "true";
                } else {
                    response = "false";
                }
                break;
            }
            case "signUp":
            {
                String exists = DataBase.getSingleTone().getController("UsersFullInfo").readFile("check2" + "-" + args[0] + "-" + args[2]);
                if (exists.equals("true")) {
                    response = "false";
                } 
                else{
                    DataBase.getSingleTone().getController("UsersFullInfo").writeFile(args[0] + "-" +
                     args[1] + "-" + args[2] + "-" + "-" + "-" + "1" + "-" + "-" + "Not named" + "-" + "Not registered" + "-" + args[3] );
                    DataBase.getSingleTone().getController("Users").writeFile(args[0] + "-" + args[1]);
                    response = "true";
                }
                break;
            }
            case "getCommunities":
            {
                response = DataBase.getSingleTone().getController("Community").readFile("get");
                break;
            }
            case "getPostInfo":
            {
                response = DataBase.getSingleTone().getController("Posts").readFile("getPostInfo" + "-" + args[0]);
                break;
            }
            case "getCommentInfo":
            {
                response = DataBase.getSingleTone().getController("Comments").readFile("getCommentInfo" + "-" + args[0]);
                break;
            }
            case "AddPost" :
            {
                String id = DataBase.getSingleTone().getController("Posts").readFile("AddPost" + "-" + args[0] + "-" + args[1] + "-" + args[2] + "-" + args[3]);
                DataBase.getSingleTone().getController("Posts").writeFile("\n"+id + "-" + args[0] + "-" + args[1] + "-" + args[2] + "-" + args[3] + "-0-0" );
                response = id;
                break;
            }
            case "addPostToCommunity":
            {
                String allContent = DataBase.getSingleTone().getController("Community").readFile("get");
                System.out.println("all content: " + allContent);
                String[] allContentSplit = allContent.split("\n");
                StringBuilder newContent = new StringBuilder();
                for (int i = 0; i < allContentSplit.length; i++) {
                    String[] contentSplit = allContentSplit[i].split("-");
                    if (contentSplit[0].equals(args[0])) {
                        System.out.println("selelcted community: " + allContentSplit[i]);
                        for(int j = 0; j < contentSplit.length; j++) {
                            if(j == 3) {
                                newContent.append(contentSplit[j] + "," + args[1] + "-");
                            }
                            else {
                                if(j==0 && i!=0) {
                                    newContent.append("\n" + contentSplit[j]);
                                }
                                else {
                                    newContent.append(contentSplit[j] + "-");
                                }
                            }
                        }
                        System.out.println("changed community: " + newContent.toString());
                    }
                    else{
                        newContent.append(allContentSplit[i]);
                    }
                }
                DataBase.getSingleTone().getController("Community").writeAllinFile(newContent.toString());
                response = "post added to community";
                break;
            }
            case "addPostToUser":
            {
                String allContent = DataBase.getSingleTone().getController("UsersFullInfo").readFile("get");
                System.out.println("all content: " + allContent);
                String[] allContentSplit = allContent.split("\n");
                StringBuilder newContent = new StringBuilder();
                for (int i = 0; i < allContentSplit.length; i++) {
                    String[] contentSplit = allContentSplit[i].split("-");
                    if (contentSplit[0].equals(args[0])) {
                        System.out.println("selelcted user: " + allContentSplit[i]);
                        for(int j = 0; j < contentSplit.length; j++) {
                            if(j == 3) {
                                newContent.append(contentSplit[j] + "," + args[1] + "-");
                            }
                            else {
                                if(j==0 && i!=0) {
                                    newContent.append("\n" + contentSplit[j]);
                                }
                                else {
                                    newContent.append(contentSplit[j] + "-");
                                }
                            }
                        }
                        System.out.println("changed user: " + newContent.toString());
                    }
                    else{
                        newContent.append(allContentSplit[i]);
                    }
                }
                DataBase.getSingleTone().getController("UsersFullInfo").writeAllinFile(newContent.toString());
                response = "post added to user";
                break;
            }
            case "AddCommunity":
            {
                DataBase.getSingleTone().getController("Community").writeFile(args[0] + "-" +
                        args[1] + "-" + args[1] + "--" + args[2] + "-" + args[3]);
                //add community to user
                String allContent = DataBase.getSingleTone().getController("UsersFullInfo").readFile("get");
                System.out.println("all content: " + allContent);
                String[] allContentSplit = allContent.split("\n");
                String username = args[1];
                StringBuilder newContent = new StringBuilder();
                for (int i = 0; i < allContentSplit.length; i++) {
                    String[] contentSplit = allContentSplit[i].split("-");
                    if (contentSplit[0].equals(username)) {
                        System.out.println("selelcted user: " + allContentSplit[i]);
                        for(int j = 0; j < contentSplit.length; j++) {
                            if(j == 4) {
                                newContent.append(contentSplit[j] + "," + args[0] + "-");
                            }
                            else {
                                if(j==contentSplit.length-1) {
                                    newContent.append(contentSplit[j]);
                                }
                                else {
                                    newContent.append(contentSplit[j] + "-");
                                }
                            }
                        }
                        System.out.println("changed user: " + newContent.toString());
                    }
                    else{
                        newContent.append(allContentSplit[i]);
                    }
                }
                response = "community added";
                break;
            }
            case "Follow":
            {
                String allContent = DataBase.getSingleTone().getController("UsersFullInfo").readFile("get");
                String[] splitedContent = allContent.split("\n");
                String communityName = args[0];
                String username = args[1];
                StringBuilder newContent = new StringBuilder();
                for(int i = 0; i < splitedContent.length; i++) {
                    if(i!=0){
                        newContent.append("\n");
                    }
                    String[] contentSplited = splitedContent[i].split("-");
                    if(contentSplited[0].equals(username)) {
                        for(int j = 0; j < contentSplited.length; j++) {
                            if(j == 4) {
                                if(contentSplited[j].equals("")) {
                                    newContent.append(communityName + "-");//
                                }
                                else {
                                    newContent.append(contentSplited[j] + "," + communityName + "-");
                                }
                            }
                            else {
                                if(j==contentSplited.length-1) {
                                    newContent.append(contentSplited[j]);
                                }
                                else {
                                    newContent.append(contentSplited[j] + "-");
                                }
                            }
                        }
                    }
                    else {
                        newContent.append(splitedContent[i]);
                    }
                }
                DataBase.getSingleTone().getController("UsersFullInfo").writeAllinFile(newContent.toString());
                //add to community
                StringBuilder newContent2 = new StringBuilder();
                allContent = DataBase.getSingleTone().getController("Community").readFile("get");
                splitedContent = allContent.split("\n");
                for(int i = 0; i < splitedContent.length; i++) {
                    if(i!=0){
                        newContent2.append("\n");
                    }
                    String[] contentSplited = splitedContent[i].split("-");
                    if(contentSplited[0].equals(communityName)) {
                        for(int j = 0; j < contentSplited.length; j++) {
                            if(j == 2) {
                                if(contentSplited[j].equals("")) {
                                    newContent2.append(username + "-");//
                                }
                                else {
                                    newContent2.append(contentSplited[j] + "," + username + "-");
                                }
                            }
                            else {
                                if(j==contentSplited.length-1) {
                                    newContent2.append(contentSplited[j]);
                                }
                                else {
                                    newContent2.append(contentSplited[j] + "-");
                                }
                            }
                        }
                    }
                    else {
                        newContent2.append(splitedContent[i]);
                    }
                }
                DataBase.getSingleTone().getController("Community").writeAllinFile(newContent2.toString());
                response = "user added to community";
                break;
            }//unfollow kharabe
            case "Unfollow":
            {
                String allContent = DataBase.getSingleTone().getController("UsersFullInfo").readFile("get");
                String[] splitedContent = allContent.split("\n");
                String communityName = args[0];
                String username = args[1];
                StringBuilder newContent = new StringBuilder();
                for(int i = 0; i < splitedContent.length; i++) {
                    if(i!=0){
                        newContent.append("\n");
                    }
                    String[] contentSplited = splitedContent[i].split("-");
                    if(contentSplited[0].equals(username)) {
                        for(int j = 0; j < contentSplited.length; j++) {
                            if(j == 4) {
                                //delete community from user
                                String[] contentSplited2 = contentSplited[j].split(",");
                                StringBuilder newContent2 = new StringBuilder();
                                System.out.println("contentSplited2 lenght: " + contentSplited2.length);
                                for(int k = 0; k < contentSplited2.length; k++) {
                                    if(contentSplited2[k].equals(communityName)) {
                                        if(newContent2.length() != 0){
                                            if(k == contentSplited2.length-1 ) {
                                                if(newContent2.charAt(newContent2.length()-1) == ','){
                                                    newContent2.deleteCharAt(newContent2.length()-1);
                                                }
                                            }
                                        }
                                        continue;
                                    }
                                    if(k==contentSplited2.length-1) {
                                        newContent2.append(contentSplited2[k]);
                                    }
                                    else {
                                        newContent2.append(contentSplited2[k] + ",");
                                    }
                                }
                                newContent2.append("-");
                                newContent.append(newContent2);
                            }
                            else {
                                if(j==contentSplited.length-1) {
                                    newContent.append(contentSplited[j]);
                                }
                                else {
                                    newContent.append(contentSplited[j] + "-");
                                }
                            }
                        }
                    }
                    else {
                        newContent.append(splitedContent[i]);
                    }
                }
                DataBase.getSingleTone().getController("UsersFullInfo").writeAllinFile(newContent.toString());
                //remove user  from community
                DataBase.getSingleTone().getController("UsersFullInfo").writeAllinFile(newContent.toString());
                //add to community
                StringBuilder newContent5 = new StringBuilder();
                allContent = DataBase.getSingleTone().getController("Community").readFile("get");
                splitedContent = allContent.split("\n");
                for(int i = 0; i < splitedContent.length; i++) {
                    if(i!=0){
                        newContent5.append("\n");
                    }
                    String[] contentSplited = splitedContent[i].split("-");
                    if(contentSplited[0].equals(communityName)) {
                        for(int j = 0; j < contentSplited.length; j++) {
                            if(j == 2) {
                                //remove user from the community
                                System.out.println("members : " + contentSplited[j]);
                                String[] contentSplited2 = contentSplited[j].split(",");
                                StringBuilder newContent3 = new StringBuilder();

                                for(int k = 0; k < contentSplited2.length; k++) {
                                    if(contentSplited2[k].equals(username)) {
                                        if (newContent3.length() != 0){
                                            if( k==contentSplited2.length-1) {
                                                if( newContent3.charAt(newContent3.length()-1) == ','){
                                                    newContent3.deleteCharAt(newContent3.length()-1);
                                                }
                                            }
                                        }
                                        continue;
                                    }
                                    if(k==contentSplited2.length-1) {

                                        newContent3.append(contentSplited2[k]);

                                    }
                                    else {

                                        newContent3.append(contentSplited2[k] + ",");

                                    }

                                }
                                newContent5.append(newContent3.toString() + "-");
                            }
                            else {
                                if(j==contentSplited.length-1) {
                                    newContent5.append(contentSplited[j]);
                                }
                                else {
                                    newContent5.append(contentSplited[j] + "-");
                                }
                            }
                        }
                    }
                    else {
                        newContent5.append(splitedContent[i]);
                    }
                }
                DataBase.getSingleTone().getController("Community").writeAllinFile(newContent5.toString());
                response = "user deleted from community";
                break;
            }
            case "updateUserInfo":
            {
                String allContent = DataBase.getSingleTone().getController("UsersFullInfo").readFile("get");
                String[] splitedContent = allContent.split("\n");
                String username = args[0];
                String password = args[1];
                String email = args[2];
                String profilePic = args[3];
                String name = args[4];
                String phone = args[5];
                StringBuilder newContent = new StringBuilder();
                for(int i = 0; i < splitedContent.length; i++) {
                    if(i!=0){
                        newContent.append("\n");
                    }
                    String[] contentSplited = splitedContent[i].split("-");
                    if(contentSplited[0].equals(username)) {
                        for(int j = 0; j < contentSplited.length; j++) {
                            if(j == 0){
                                newContent.append(username + "-");
                                continue;
                            }
                            if(j == 1) {
                                newContent.append(password + "-");
                                continue;
                            }
                            else if(j == 2) {
                                newContent.append(email + "-");
                                continue;
                            }
                            else if(j == 5) {
                                newContent.append(profilePic + "-");
                                continue;
                            }
                            else if(j == 7) {
                                newContent.append(name + "-");
                                continue;
                            }
                            else if(j == 8) {
                                newContent.append(phone + "-");
                                continue;
                            }
                            else {
                                if(j==contentSplited.length-1) {
                                    newContent.append(contentSplited[j]);
                                    continue;
                                }
                                else {
                                    newContent.append(contentSplited[j] + "-");
                                    continue;
                                }
                            }
                        }
                    }
                    else {
                        newContent.append(splitedContent[i]);
                    }
                }
                DataBase.getSingleTone().getController("UsersFullInfo").writeAllinFile(newContent.toString());
                System.out.println("here");
                response = "user info updated";
                break;
            }
            case "getUserInfo1":
            {
                String allContent = DataBase.getSingleTone().getController("UsersFullInfo").readFile("get");
                String[] splitedContent = allContent.split("\n");
                String username = args[0];
                StringBuilder newContent = new StringBuilder();
                for(int i = 0; i < splitedContent.length; i++) {
                    String[] contentSplited = splitedContent[i].split("-");
                    if(contentSplited[0].equals(username)) {
                        response = splitedContent[i];
                        break;
                    }
                }
                break;
            }

            // case "set":
            //     DataBase.getSingleTone().getDataBase(args[0]).set(args[1], args[2]);
            //     break;
            // case "delete":
            //     DataBase.getSingleTone().getDataBase(args[0]).delete(args[1]);
            //     break;
            // case "getAll":
            //     response = DataBase.getSingleTone().getDataBase(args[0]).getAll();
            //     break;
            // case "getAllKeys":
            //     response = DataBase.getSingleTone().getDataBase(args[0]).getAllKeys();
            //     break;
            // case "getAllValues":
            //     response = DataBase.getSingleTone().getDataBase(args[0]).getAllValues();
            //     break;
            // case "getAllEntries":
            //     response = DataBase.getSingleTone().getDataBase(args[0]).getAllEntries();
            //     break;
            // case "getAllKeysAndValues":
            //     response = DataBase.getSingleTone().getDataBase(args[0]).getAllKeysAndValues();
            //     break;
            // case "getAllKeysAndValuesWithSeparator":
            //     response = DataBase.getSingleTone().getDataBase(args[0]).getAllKeysAndValuesWithSeparator(args[1]);
            //     break;
            // case "getAllKeysAndValuesWithSeparatorAndPrefix":
            //     response = DataBase.getSingleTone().getDataBase
    }
    writer(response);
    try {
        dis.close();
        dos.close();
        socket.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
    }
}