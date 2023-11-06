<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='answer-article'>
		<div class='answer-article-header'>
			<div class='answer-left'>└</div>
			<div class='answer-right'>
				<div><span class='bold'>${vo.mname}</span></div>
				<div>
					<span>${vo.reg_date}</span> |
					<c:choose>
						<c:when test="${sessionScope.member.mid==vo.mid || sessionScope.member.mid=='admin'}">
							<span class='deleteReplyAnswer' data-replyNum='${vo.replyNum}' data-answer='${vo.answer}'>삭제</span>
						</c:when>
						<c:otherwise>
							<span class='notifyReply'>신고</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class='answer-article-body'>
			${vo.content}
		</div>
	</div>
</c:forEach>