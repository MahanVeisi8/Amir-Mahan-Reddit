import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;

public class DataBase {
    // static int restaurantCounter = 0;
    // static int clientCounter = 0;
    private final HashMap<String, Controller> dataBase = new HashMap<>();
    static private DataBase singleTone;

    static public DataBase getSingleTone() {
        if (singleTone == null) {
            singleTone = new DataBase();
        }
        return singleTone;
    }

    void addDataBase(String str, Controller controller) {
        dataBase.put(str, controller);
    }

    Controller getController(String str) {
        return dataBase.get(str);
    }
}

class Controller {
    File path;
    Scanner read;
    FileWriter write;
    String command;
    String commandType;

    Controller(File path) {
        this.path = path;

    }

    public String readFile(String command) {
        this.command = command;
        String splitedCommand[] = command.split("-");
        String commandType = splitedCommand[0];
        try {
            read = new Scanner(path);
        } catch (FileNotFoundException e) {
            System.out.println("not connected to file");
        }
        try {
            write = new FileWriter(path, true);
        } catch (IOException e) {
            System.out.println("could not write to file");
        }
        if (commandType.equals("check1")) {
            Map<String, String> map = new HashMap<String, String>();
            while (read.hasNext()) {
                String line = read.nextLine();
                String[] splited = line.split("-");
                map.put(splited[0], splited[1]);
            }
            String username = splitedCommand[1];
            String password = splitedCommand[2];
            if (map.containsKey(username)) {
                if (map.get(username).equals(password)) {
                    return "true";
                } else {
                    return "false";
                }
            }
            return "false";
        } else if (commandType.equals("check2")) {
            Map<String, String> map = new HashMap<String, String>();
            while (read.hasNext()) {
                String line = read.nextLine();
                String[] splited = line.split("-");
                map.put(splited[0], splited[2]);
            }
            String username = splitedCommand[1];
            String email = splitedCommand[2];
            if (map.containsKey(username) || map.containsValue(email)) {
                return "true";
            } else {
                return "false";
            }
        } 
        else if(commandType.equals("get")){
            StringBuilder returningString = new StringBuilder();
            while (read.hasNext()) {
                String line = read.nextLine();
                returningString.append(line+"\n");
            }
            return returningString.toString();
        }
        else if(commandType.equals("getUserInfo") || commandType.equals("getPostInfo")
        || commandType.equals("getCommentInfo")){
            while(read.hasNext()){
                String line = read.nextLine();
                String[] splited = line.split("-");
                if(splited[0].equals(splitedCommand[1])){
                    return line;
                }
            }
        }
        else if(commandType.equals("AddPost")){
            int postId = 0;
            while(read.hasNext()) {
                String line = read.nextLine();
                ++postId;
            }
        return postId+"";

        }
    
        else if (commandType.equals("set")) {
            return "";
        } else {
            return "";
        }
        return "";
    }

    public void writeFile(String content) {
        try {
            FileWriter fw = new FileWriter(path, true);
            fw.write("\n"+content);
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeAllinFile(String content){
        try {
            FileWriter fw = new FileWriter(path, false);
            fw.write(content);
        
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}