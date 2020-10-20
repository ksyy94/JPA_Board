package com.cos.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.board.config.ex.MyArgsNotFound;
import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.repository.BoardRepository;
import com.cos.board.service.BoardService;

@Controller
public class BoardController {

	// 의존성 주입
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private BoardService boardService;

	// http://localhost:8000/board/saveForm
	@GetMapping("/saveForm")
	public String saveForm() {

		return "saveForm";
	}

	@PostMapping("/save")
	@ResponseBody
	public String save(@RequestBody BoardSaveRequestDto dto) {
		System.out.println(dto);
		boardService.글쓰기(dto);
		// 그냥리스트페이지로 가면 데이터를 같이 못들고 가기때문에 앞에 redirect:/ 를 붙여야함
		return "ok";
	}

	// 스프링에서 Controller의 메서드의 파라메터 부분은 자동 DI가 됨
	@GetMapping({"/list","/",""})
	public String list(Model model, @PageableDefault(size =5, sort="id", direction = Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.글목록보기(pageable));
		return "list";
	}
	
	@GetMapping("/list/test")
	@ResponseBody
	public Page<Board> list(@PageableDefault(size =5, sort="id", direction = Direction.DESC) Pageable pageable) {
		return boardService.글목록보기(pageable);
	}
	@GetMapping("/board/{id}")
	public String detail(@PathVariable int id, Model model) throws MyArgsNotFound {

		// Board board = boardrepository.findById(id).orElseGet(()->new Board());
		// 위아래 동일
//		Board board = boardrepository.findById(id).orElseGet(new Supplier<Board>() {// null일때 다른 일을 할수있는 함수가 들어간다.
//			@Override
//			public Board get() {
//				// TODO Auto-generated method stub
//				System.out.println("못 찾으면 어떻게 할지");
//				return new Board();
//			}
//		});
		//예외처리 상세히 처리할때 쓰는법
//		Board board = boardRepository.findById(id).orElseThrow(new Supplier<MyArgsNotFound>() {
//
//			@Override
//			public MyArgsNotFound get() {
//				// TODO Auto-generated method stub
//				return new MyArgsNotFound(id + "는 잘못된 id 값입니다.");
//			}
//		});

		model.addAttribute("board", boardService.글상세보기(id));
		return "detail";
	}
	
	@DeleteMapping("/board/{id}")//주소에는 명사만 넣는다. 동사x
	@ResponseBody
	public String delete(@PathVariable int id) {
		boardService.글삭제하기(id);
		return "ok";
	}
	
	@PutMapping("/board/{id}")
	@ResponseBody
	public String update(@PathVariable int id, @RequestBody BoardSaveRequestDto dto) {
		boardService.글수정하기(id, dto);
		return "ok";
	}
	
}
