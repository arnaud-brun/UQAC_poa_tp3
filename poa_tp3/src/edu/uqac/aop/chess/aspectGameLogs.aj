package edu.uqac.aop.chess;

import edu.uqac.aop.chess.agent.Move;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;

/**
 * Created by Arnaud on 31/03/2016.
 */
public aspect aspectGameLogs {

    boolean test = false;
    private String log_path="C:\\Users\\Utilisateur\\IdeaProjects\\UQAC_poa_tp3\\poa_tp3\\resources\\gameLog.txt";
   // private String log_path= getClass().getClassLoader().getResource("gameLog.txt").getPath();

    pointcut addLog(Move mv) : args(mv) && call(void Board.movePiece(Move));

    after(Move mv): addLog(mv){

        if(!test){
            File file = new File(log_path);
            if(file.exists()){
                file.delete();
                test=true;
            }
        }
        try {
            FileWriter writer = new FileWriter(log_path,true);
            writer.write(mv.toString()+ "\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }



}
