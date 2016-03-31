package edu.uqac.aop.chess;

import edu.uqac.aop.chess.agent.Move;

import java.io.File;
import java.io.FileOutputStream;

/**
 * Created by Arnaud on 31/03/2016.
 */
public aspect aspectGameLogs {

    String resourcePath = "gameLog.txt";

    pointcut addLog(Move mv) : target(mv) && execution(void Board.movePiece(Move));

    /*
    pointcut fuckIt() : execution(* *.*(..)) && !within(aspectGameLogs);

    before() : fuckIt(){
        System.out.println("BEFORE fucking it !!!!!!!!!!!");


        try {
            File file = new File(getClass().getClassLoader().getResource("gameLog.txt").getPath());

            if(file.exists()){
                System.out.println("file exists :"+file.getAbsolutePath());
            }else{
                System.out.println("file doesnt exist :"+file.getAbsolutePath());
            }

            FileOutputStream f=new FileOutputStream(file);
            f.write("fucking it\n".getBytes());

            f.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    */

    before(Move mv): addLog(mv){

        System.out.println("BEFORE !!!!!!!!!!!");

        try {
            File file = new File(getClass().getClassLoader().getResource("gameLog.txt").getPath());

            if(file.exists()){
                System.out.println("file exists :"+file.getAbsolutePath());
            }else{
                System.out.println("file doesnt exist :"+file.getAbsolutePath());
            }

            FileOutputStream f=new FileOutputStream(file);
            f.write(mv.toString().getBytes());
            f.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
