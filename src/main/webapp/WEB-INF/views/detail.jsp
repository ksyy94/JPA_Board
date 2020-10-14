<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<h1>게시글 상세보기</h1>
	<hr />
	<table border="1">
		<tr>
			<td>ID</td>
			<td>TITLE</td>
			<td>CONTENT</td>
			<td>READCOUNT</td>
			<td>CREATEDATE</td>
		</tr>
			<tr>
				<td>${board.id}</td>
				<td><input id="title" type="text" value="${board.title}"/></td>
				<td><input id="content" type="text" value="${board.content}"/></td>
				<td>${board.readCount}</td>
				<td>${board.createDate}</td>
			</tr>
	</table>
		<button onclick="updateBoard(${board.id})">수정</button>
		<button onclick="deleteBoard(${board.id})">삭제</button>
</main>

<script>
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
