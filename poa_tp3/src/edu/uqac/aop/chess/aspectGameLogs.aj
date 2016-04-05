package edu.uqac.aop.chess;

import edu.uqac.aop.chess.agent.Move;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by Arnaud on 31/03/2016.
 */
public aspect aspectGameLogs {

    boolean test = false;
    private String log_directory = System.getProperty("user.dir") + "/resources/";
    private String log_path = log_directory + "gameLog.log";

    pointcut addLog(Move mv) : args(mv) && call(void Board.movePiece(Move));

    after(Move mv): addLog(mv){
        if(!test){
            File file = new File(log_path);
            file.getParentFile().mkdirs();
            if(file.exists()){
                file.delete();
                test=true;
            }
        }
        try {
            FileWriter writer = new FileWriter(log_path,true);
            writer.write(mv.toString()+ System.getProperty("line.separator"));
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }



}
