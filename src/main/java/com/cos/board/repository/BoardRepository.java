package com.cos.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.board.model.Board;

//자동 ioc 등록됨 원래 @이런거 붙여야하는데 jpa 레파지토리있어서 자동 등록
public interface BoardRepository extends JpaRepository<Board, Integer>{

	//public abstract 생략
	@Query(value = "SELECT * FROM board WHERE id=:id", nativeQuery=true)
	Board mFindById(int id);
	
	@Modifying//수정, 삭제, 저장
	@Query(value = "DELETE FROM board WHERE id=:id", nativeQuery=true)
	int mDeleteById(int id);
}
