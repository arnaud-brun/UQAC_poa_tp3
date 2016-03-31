package edu.uqac.aop.chess;

import edu.uqac.aop.chess.agent.AiPlayer;
import edu.uqac.aop.chess.agent.HumanPlayer;
import edu.uqac.aop.chess.agent.Move;

/**
 * Created by Arnaud on 31/03/2016.
 */

interface ValidationMove {
    boolean makeMove(Move mv);
}

public aspect aspectMoveValidation {



    /*
    * Force the HumanPlayer class to implements ValidationMove
    * Write the implementation of the method makeMove
    */
    declare parents: HumanPlayer implements ValidationMove;

    public boolean HumanPlayer.makeMove(Move mv) {

        Board playGround = this.getBoard();

        if(mv == null)
            return false;
        if(!playGround.getGrid()[mv.xI][mv.yI].isOccupied())
            return false;
        if(playGround.getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == this.getColor())
            return false;
        if(!playGround.getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv))
            return false;
        playGround.movePiece(mv);
        return true;
    }


    /*
    * Force the AiPlayer class to implements ValidationMove
    * Write the implementation of the method makeMove
    */
    declare parents: AiPlayer implements ValidationMove;

    public boolean AiPlayer.makeMove(Move mv) {

        Board playGround = this.getBoard();

        if (mv == null)
            return false;
        if (!playGround.getGrid()[mv.xI][mv.yI].isOccupied())
            return false;
        if (playGround.getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == this.getColor())
            return false;
        if (!playGround.getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv))
            return false;
        playGround.movePiece(mv);
        return true;
    }

}
