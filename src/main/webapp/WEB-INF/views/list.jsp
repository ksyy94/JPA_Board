<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<div class="container-fluid">
		<h1>게시글 목록</h1>
		<br/>
	</div>
	<table class="table">
		<tr>
			<td>ID</td>
			<td>TITLE</td>
			<td>CONTENT</td>
			<td>READCOUNT</td>
			<td>CREATEDATE</td>
		</tr>
		<c:forEach var="board" items="${boards.content}">
			<tr>
				<td>${board.id}</td>
				<td><a href="/board/${board.id}">${board.title}</a></td>
				<td>${board.content}</td>
				<td>${board.readCount}</td>
				<td>${board.createDate}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${boards.first}">
					<li class="page-item disabled"><a class="page-link"
						href="/list?page=${boards.pageable.pageNumber-1}">Prev</a></li>
				</c:when>
				<c:otherwise>
				<li class="page-item"><a class="page-link"
						href="/list?page=${boards.pageable.pageNumber-1}">Prev</a></li>
					
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${boards.last}">
					<li class="page-item disabled"><a class="page-link"
						href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>

				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</main>
<%@ include file="layout/footer.jsp"%>
