package com.cos.board.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data //-> getter, setter 합쳐져 있음.+toString() 규현되어 있음.
//@Getter
//@Setter
@AllArgsConstructor //전체 파라메터를 가진 생성자
@NoArgsConstructor //파라메터가 없는 생성자
@Builder //빌더패턴
@Entity //ORM(오브젝트릴레이션매핑)이 가능 // primary key가 필요
public class Board {
	
	@Id//기본키 설정
	@GeneratedValue(strategy = GenerationType.IDENTITY)//해당 데이터베이스 번호증가 전략을 따라가기
	private int id;
	private String title;
	private String content;
	private int readCount;
	@CreationTimestamp//now 값이 자동으로 들어감
	private Timestamp createDate;
	
//	public String getCreateDate() {
//		
//		return createDate.toString().substring(0,10);
//	}
}
