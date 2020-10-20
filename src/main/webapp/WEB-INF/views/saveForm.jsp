<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main class= "container">

	<h1>글쓰기 페이지</h1>
	<hr />
	<table class="table">
		<tr>
			<td>TITLE</td>
			<td><input id="title" type="text" /></td>
		<tr>
			<td>CONTENT</td>
			<td><textarea id="content"></textarea></td>
	</table>
	<button class="btn btn-secondary" onclick="insertBoard()">글쓰기
		완료</button>

</main>

<script>
$(document).ready(function() {
	  $('#content').summernote();
});
function insertBoard(){


	let title=document.querySelector("#title").value;
	let content=document.querySelector("#content").value;

	
	let board={
		title: title,//board의 키 값: 위의 밸류
		content: content
	};
	
	console.log(board);
	
	fetch("/save",{
		method: "post",
		headers:{
			'Content-Type': "application/json; charset=utf-8",
		},
		body: JSON.stringify(board)
	})
	.then(res=>res.text())
	.then(res=>{
		if(res=="ok"){
			alert("등록 완료");
			location.href="/list";
		}else{
			console.log(res);
			alert("등록 실패");
		}
	});
}
</script>
<%@ include file="layout/footer.jsp"%>