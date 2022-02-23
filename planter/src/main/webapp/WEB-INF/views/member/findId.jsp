<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<script type="text/javascript">
	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}
</script>

		<!-- #contents 부분만 본문에 넣기-->
            <div id="contents">
                <div class="find">
                    <div class="titleArea">
                        <h2>FIND ID</h2>
                    </div><!--.titleArea-->
                    <form action="/member/findId" method="post">
                        <div class="tab_box">
                            <div class="tab_contents">

                                <div class="find_id">
                                    <p class="find_texts">
                                        <span class="find_text1">등록된 이메일로 찾기</span><!--.find_text1-->
                                        <br>
                                        <span class="find_text2">아이디는 가입 시 입력한 이메일로 찾으실 수 있습니다.</span><!--.find_text2-->
                                    </p><!--.find_texts-->

                                    <input name="email" class="find_input" placeholder="EMAIL" value="" type="text">
                                    <p>
                                        <input type="submit" value="FIND ID" id="findid_submit">
                                    </p>
                                </div><!--.find_id-->

                            </div><!--.tab_contents-->
                        </div><!--.tab_box-->
                    </form>
                </div><!--.login-->

            </div><!--#contents-->
            
<%@ include file="../includes/footer.jsp" %>