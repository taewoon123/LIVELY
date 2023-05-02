<%@ page language="java" charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MY PAGE</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
  <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    /* ======================== CSS 는 이 밑에다가 =================== */

    .accordion-item {
      background: white;
    }

    #no-accodian {
      --bs-accordion-btn-active-icon: none;
    }

    .accordion-button:not(.collapsed) {
      color: black;
      /* background-color: var(--bs-accordion-active-bg); 없앨까 */
    }

    body {
      margin-top: 0;
    }
    #accordionPanelsStayOpenExample a{
      text-decoration: none;
      color: black;
    }
    /* ======================== CSS 는 이 위에다가 =================== */
  </style>

  <!-- Custom styles for this template -->
  <link href="form-validation.css" rel="stylesheet">

</head>

<body>
          <!-- ================ HTML은 이 아래에다가 ================== -->

      <div class="container">
        <main>
          <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="/app01/resources/img/cat1_update.jpg" alt="고양이" width="100%">
            <h2>내 정보 수정</h2>
          </div>

          <div class="row g-5">

            <!-- 아래부터 사이드바 -->
            <div class="col-md-5 col-lg-4 order-md-last">
              <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-primary">&nbsp나의 정보</span>
              </h4>
              <ul class="list-group mb-3">

                <!-- 아코디언 -->
                <div class="accordion" id="accordionPanelsStayOpenExample">

                  <!-- 아코디언 빼고싶 -->
                  <div id="no-accodian">

                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                        <button onclick="location.href='${root}/member/edit'" class="accordion-button" type="button" data-bs-toggle="collapse"
                          data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
                          aria-controls="panelsStayOpen-collapseOne">
                          <a href="#" >내 정보 수정</a>
                        </button>
                      </h2>
                    </div>


                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                        <button onclick="location.href='${root}/member/myBoard'" class="accordion-button" type="button" data-bs-toggle="collapse"
                          data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true"
                          aria-controls="panelsStayOpen-collapseTwo">
                          <a href="#">내가 작성한 글</a> 
                        </button>
                      </h2>
                    </div>

                    <div class="accordion-item">
                      <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                        <button onclick="location.href='${root}/chat/list'" class="accordion-button" type="button" data-bs-toggle="collapse"
                          data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="true"
                          aria-controls="panelsStayOpen-collapseThree">
                          <a>나의 채팅</a> 
                        </button>
                      </h2>
                    </div>

                  </div>

                  <!-- 아코디언 -->

                  <div class="accordion-item">
                    <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                      <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseFour">
                        <a href="#">나의 입양활동</a> 
                      </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse"
                      aria-labelledby="panelsStayOpen-headingFour">
                      <div class="accordion-body">
                        <a href="/app01/myAdoptBookmarktList.jsp">내가 즐겨찾기한 동물</a>
                      </div>
                      <div class="accordion-body">
                        <a href="/app01/myAdoptList.jsp">내가 입양한 동물</a>
                      </div>
                    </div>
                  </div>

                  
                </div>
              </ul>
            </div>
            <!-- 요기까지 사이드바 -->
            <!-- 아래부터 회원정보수정란 -->
            <div class="col-md-7 col-lg-8">
              <form action="${root}/member/edit" method="post" class="needs-validation">
                <div class="row g-3">
                
                	<input type="hidden" name="no" value="${loginMember.no}">

                  <div class="col-12 input">
                    <label for="id" class="form-label">아이디</label>
                    <div class="input-group has-validation">
                      <input name="memberId" type="text" class="form-control" id="id" placeholder="회원아이디">
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="password" class="form-label">비밀번호<span class="text-muted"></span></label>
                    <input name="memberPwd" type="password" class="form-control" id="password" placeholder="password" required>
                    <div class="invalid-feedback">
                      변경할 비밀번호를 입력해주세요.
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="password" class="form-label">비밀번호 확인<span class="text-muted"></span></label>
                    <input name="memberPwdConfirm" type="password" class="form-control" id="password-check" placeholder="password check"
                      required>
                    <div class="invalid-feedback">
                      변경할 비밀번호를 한번 더 입력해주세요.
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="nick" class="form-label">닉네임<span class="text-muted"></span></label>
                    <input name="memberNick" type="text" class="form-control" id="nick" placeholder="회원닉네임" required>
                    <div class="invalid-feedback">
                      변경할 닉네임을 입력해주세요.
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="name" class="form-label">이름<span class="text-muted"></span></label>
                    <input name="memberName" type="text" class="form-control" id="name" placeholder="회원이름">
                  </div>

                  <div class="col-12 input">
                    <label for="phone" class="form-label">휴대전화 번호<span class="text-muted"></span></label>
                    <input name="memberHp" type="text" class="form-control" id="phone" placeholder="회원 휴대폰번호" required>
                    <div class="invalid-feedback">
                      변경할 휴대폰번호를 00000000000 형식으로 입력해주세요.
                      ( 하이픈(-) 제외 )
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="email" class="form-label">이메일 <span class="text-muted"></span></label>
                    <input name="memberEmail" type="email" class="form-control" id="email" placeholder="회원 이메일" required>
                    <div class="invalid-feedback">
                      변경할 이메일이 유효하지 않습니다.
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="birth" class="form-label">생년월일<span class="text-muted"></span></label>
                    <input name="memberBirth" type="text" class="form-control" id="birth" placeholder="회원 생년월일 (8자리)" required>
                    <div class="invalid-feedback">
                      변경할 생년월일 숫자만 8개 입력해주세요
                    </div>
                  </div>

                  <div class="col-12 input">
                    <label for="address" class="form-label">주소</label>
                    <input name="memberAddress" type="text" class="form-control" id="address" placeholder="회원 주소" required>
                    <div class="invalid-feedback">
                      변경할 주소를 입력해주세요.
                    </div>
                  </div>

                  <hr class="my-4">

                  <button class="w-100 btn btn-primary btn-lg" type="submit">회원정보 변경하기</button>

                </div>
              </form>
            </div>
          </div>
        </main>
      </div>

    <br>
    <br>

    <!-- ================ HTML은 이 위에다가 ==================== -->
    <!-- FOOTER  올 자리 -->
    <!-- <%@include file="/WEB-INF/views/common/footer.jsp" %> -->
    
    <script src="form-validation.js"></script>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>