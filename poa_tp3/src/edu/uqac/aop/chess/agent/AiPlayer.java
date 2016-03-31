package edu.uqac.aop.chess.agent;

import edu.uqac.aop.chess.Board;

import java.util.Random;

public class AiPlayer extends Player {
	// dies roooooll
	private Random Dies = new Random(0);

	public AiPlayer(int arg, Board board) {
		setColor(arg);
		this.playGround = board;
	}



	public Move makeMove() {
		Move mv;
		int iniX = -1, iniY = -1, finX = -1, finY = -1;

		do {
			iniX = Dies.nextInt(8);
			iniY = Dies.nextInt(8);
			finX = Dies.nextInt(8);
			finY = Dies.nextInt(8);
			mv = new Move(iniX, iniY, finX, finY);
		} while (!makeMove(mv));

		System.out.println("Votre coup? <" + mv.toString()+ ">");
		return mv;
	}

}
