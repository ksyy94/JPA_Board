package com.cos.board.config.ex;
//내가 만든 exception
public class MyArgsNotFound extends Exception{
	
	private String message; 
	
	public MyArgsNotFound(String message) {
		// TODO Auto-generated constructor stub
		this.message=message;
	}
	
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return message;
	}
 
}
