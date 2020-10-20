<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<div class="container-fluid">
		<h1>게시글 상세보기</h1>
	</div>
	<table class="table">
		<tr>
			<td>ID</td>

			<td>${board.id}</td>
		<tr>
			<td>TITLE</td>
			<td><input id="title" type="text" value="${board.title}" /></td>
		</tr>
		<tr>
			<td>CONTENT</td>
			<td><textarea id="content">${board.content}</textarea></td>
		</tr>
		<tr>
			<td>READCOUNT</td>
			<td>${board.readCount}</td>
		</tr>
		<tr>
			<td>CREATEDATE</td>
			<td>${board.createDate}</td>
		</tr>
	</table>
	<button class="btn btn-secondary" onclick="updateBoard(${board.id})">수정</button>
	<button class="btn btn-secondary" onclick="deleteBoard(${board.id})">삭제</button>

</main>

<script>
$(document).ready(function() {
	  $('#content').summernote();
});
function deleteBoard(id){
	fetch("/board/"+id,{method: "delete"})
	.then(res=> res.text())
	.then(res=>{
		if(res=="ok"){
			alert("삭제 성공");
			location.href="/list";
		}
	});
}
function updateBoard(id){
	//id, title, content

	let title=document.querySelector("#title").value;
	let content=document.querySelector("#content").value;

	let board={
		title: title,//board의 키 값: 위의 밸류
		content: content
	};
	
	fetch("/board/"+id,{
		method: "put",
		headers:{
			'Content-Type':'application/json; charset=utf-8',
		},
		body: JSON.stringify(board)//
		})
		.then(res=> res.text())
		.then(res=>{
			if(res=="ok"){
				alert("수정완료");
				location.reload();//수정하고 홈페이지 다시로딩
			}else{
				alert("수정실패");
			}
		}
	);
}

</script>
<%@ include file="layout/footer.jsp"%>
