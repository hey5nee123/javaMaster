package Honja;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	//데이터값을 넘겨주는 매개
	//필드
	private int boardNum;
	private String boardHead;
	private String boardWho;
	private String boardCon;
	private String boardDt;
	//
	public Board(int boardNum, String boardHead, String boarWho, String boardCon) {
		Date today = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		this.boardNum = boardNum;
		this.boardHead = boardHead;
		this.boardWho = boarWho;
		this.boardCon = boardCon;
		this.boardDt = sdf.format(today);
	}
	public Board(int boardNum, String boardHead, String boarWho, String boardCon, String boardDt) {
		this.boardNum = boardNum;
		this.boardHead = boardHead;
		this.boardWho = boarWho;
		this.boardCon = boardCon;
		this.boardDt = boardDt;
	}
	String showInfo() {
		return boardNum + "." + boardHead +"( "+boardWho+")"+boardDt;
	}
	String showDetailInfo() {
		String result = "번호: " +boardNum+"번 \n" +"제목: "+boardHead;
		result += "\n작성자: " +boardWho;
		result += "\n내용: " +boardCon;
		result += "\n일시: " +boardDt;
		return result;
	}
	void setBN(int boardNum) {
		this.boardNum = boardNum;
	}
	void setBH(String boardHead) {
		this.boardHead = boardHead;
	}
	void setBW(String boardWho) {
		this.boardWho = boardWho;
	}
	void setBC(String boardCon) {
		this.boardCon = boardCon;
	}
	void setBDT(String boardDt) {
		this.boardDt = boardDt;
	}
	
	int getBN() {
		return boardNum;
	}
	String getBH() {
		return boardHead;
	}
	String getBW() {
		return boardWho;
	}
	String getBC() {
		return boardCon;
	}
	String getBDT() {
		return boardDt;
	}

}	