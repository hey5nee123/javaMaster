<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
  ul {
    list-style: none;
  }

  span {
    display: inline-block;
    margin-right: 10px;
  }
</style>
<jsp:include page="../layout/menu.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<h3>상세화면</h3>

<form name="myForm" action="modifyForm.do">
  <input type="hidden" name="bno" value="${vo.boardNo }">
  <table class="table">
    <tbody>
      <tr>
        <td>글번호</td>
        <td colspan="3">${vo.boardNo }</td>
      </tr>
      <tr>
        <td>제목</td>
        <td colspan="3">${vo.title }</td>
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="3">${vo.content }</td>
      </tr>
      <tr>
        <td>작성자</td>
        <td colspan="3">${vo.writer }</td>
      </tr>
      <tr>
        <td>작성일</td>
        <td>
          <fmt:formatDate pattern="yyyy-MM-dd" value="${vo.writeDate }" />
        </td>
        <td>조회수</td>
        <td>${vo.clickCnt }</td>
      </tr>
      <tr>
        <td>이미지</td>
        <td colspan="3">
          <c:if test="${!empty vo.image }">
            <img width="150px" src="images/${vo.image }">
          </c:if>
        </td>
      </tr>
      <tr>
        <td colspan="4" align="center">
          <c:choose>
            <c:when test="${logName eq vo.writer }">
              <input type="submit" value="수정">
              <input type="button" onclick="deleteFun()" value="삭제">
            </c:when>
            <c:otherwise>
              <input type="submit" disabled value="수정">
              <input type="button" disabled onclick="deleteFun()" value="삭제">
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
    </tbody>
  </table>
</form>
<br>
댓글내용: <input type="text" id="content"><button id="addReply">등록</button>
<p />
<p>댓글목록</p>
<div id="show">
  <ul id="list">
  </ul>
</div>

<a href="boardList.do">글목록으로</a>
<script>
  function deleteFun() {
    console.log(window);
    document.forms.myForm.action = "removeForm.do";
    document.forms.myForm.submit();
  }

  const bno = '${vo.boardNo }';
  // Ajax호출.
  const xhtp = new XMLHttpRequest();
  xhtp.open('get', 'replyListJson.do?bno=' + bno)
  xhtp.send()
  xhtp.onload = function () {
    let ul = document.querySelector('#list');
    let data = JSON.parse(xhtp.responseText); //json문자열 -> 객체.
    data.forEach(reply => {

      let li = document.createElement('li');
      let span = document.createElement('span');
      span.innerText = '글번호:' + reply.replyNo;
      li.appendChild(span);
      span = document.createElement('span');
      span.innerText = ' ' + reply.reply;
      li.appendChild(span);
      span = document.createElement('span');
      span.innerText = ' ' + reply.replyer;
      li.appendChild(span);

      // 삭제버튼.
      let btn = document.createElement('button');
      btn.addEventListener('click', function () {
        // 댓글번호 삭제 후 화면에서 제거.
        let delHtp = new XMLHttpRequest();
        delHtp.open('get', 'delReplyJson.do?rno=' + reply.replyNo)
        delHtp.send()
        delHtp.onload = function () {
          let result = JSON.parse(delHtp.responseText)
          if (result.retCode == 'OK') {
            alert('삭제됨.');
            btn.parentElement.remove();
          } else if (result.retCode == 'NG') {
            alert('처리중 에러.');
          }
        }
      })
      btn.innerText = '삭제';
      li.appendChild(btn);

      ul.appendChild(li);
    })
  }
  
  // 등록버튼 클릭 이벤트 생성.
  //document.querySelector('#addReply').addEventListener('click', function () { });
  document.querySelector('#addReply').onclick = function () {
	  let reply = document.querySelector('#content').value;
	  let replyer = '${logId}';
	  
	  const addAjax = new XMLHttpRequest();
	  addAjax.open('get', 'addReplyJson.do?reply='+reply+'&replyer='+replyer+'&bno='+bno);
	  addAjax.send();
	  addAjax.onload = function () {
		  console.log(addAjax.responseText)
	  }
	  
  }
  
  
  
  
</script>
<jsp:include page="../layout/foot.jsp"></jsp:include>