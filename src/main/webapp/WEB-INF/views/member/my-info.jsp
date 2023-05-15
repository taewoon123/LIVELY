<%@ page pageEncoding="UTF-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>MY INFOMATION</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">


  </head>


  <body>

    <!-- header 올자리 -->

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

      <!-- ================ HTML은 이 아래에다가 ================== -->

      <div class="wrap">
        <div class="container">
          <main>

            <div id="" class="row g-5">

              <!-- //////////////아래부터 회원정보수정란////////////////// -->

              <div class="py-5 text-center" id="title">
                <h4>나의 정보 수정</h4>
              </div>

              <div class="col-md-7 col-lg-8">
                <form action="${rootContext}/member/mypage" method="post" class="needs-validation">
                  <div class="row g-3" id="edit-form">

                    <input type="hidden" name="no" value="${loginMember.no}">

                    <table id="join-form">
                      <tbody>
                        <tr>
                          <td>
                            ID
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="text" name="id" id="id" placeholder="" value="sopia" readonly>
                            </div>
                          </th>
                          <td id="id-validity">
        
                          </td>
                        </tr>
        
                        <tr>
                          <td>
                            Password
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="password" name="password" id="password" placeholder="문자,특수문자 포함 6~12글자">
                            </div>
                          </th>
                          <td id="password-validity">
        
                          </td>
                        </tr>
        
                        <tr>
                          <td>
                            Password Check
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="password" name="password2" id="password2" placeholder="">
                            </div>
                          </th>
                          <td id="passwordCheck-validity">
                            
                          </td>
                        </tr>
        
                        <tr>
                          <td> 
                            Name
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="text" name="Name" id="name" placeholder="" value="정연우" readonly>
                            </div>
                          </th>
                          <td>
        
                          </td>
                        </tr>
        
                        <tr>
                          <td>
                            E-mail
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="email" name="email" id="email" placeholder=" ex) kim@naver.com" value="sopia@happy.com" >
                            </div>
                          </th>
                          <td id="email-validity">
        
                          </td>
                        </tr>
        
                        <tr>
                          <td>
                            Birth
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="text" name="birth" id="birth" placeholder=" ex) 19951231" value="20001212">
                            </div>
                          </th>
                          <td id="birth-validity">
        
                          </td>
                        </tr>
        
                        <tr>
                          <td>
                            HP
                          </td>
                          <th>
                            <div class="input-group">
                              <input type="text" name="phone" id="phone" placeholder=" ex) 01055550000" value="01077775555">
                            </div>
                          </th>
                          <td id="hp-validity">
        
                          </td>
                        </tr>
        
                        <tr>
                          <td>
                            Gender
                          </td>
                          <th>
                            <div class="selections">
                              <span id="Female">
                                <input type="radio" name="gender" id="female" value="0"checked> <label for="female">Female</label>
                              </span>
                              <span id="Male">
                                <input type="radio" name="gender" id="male" value="1"> <label for="male">Male</label>
                              </span>
                            </div>
                          </th>
                          <td id="gender-validity">
        
                          </td>
                          
                        </tr>
        
                        <tr>
                          <td>
                            Location
                          </td>
                          <th>
                            <div>
                              <select class="location-option" name="location" id="location">
                                <option value="0" selected>Select</option>
                                <option value="1">강동구</option>
                                <option value="2">강서구</option>
                                <option value="3" selected>강남구</option>
                                <option value="4">강북구</option>
                              </select>
                            </div>
                          </th>
                          <td id="location-validity">
        
                          </td>
                        </tr>
        
                        <tr>
                          <th colspan="3">
                            <button id="edit-submit-button" class="w-100 btn btn-lg" type="submit">회원정보 변경하기</button>
                          </th>
                        </tr>
                      </tbody>
        
                    </table>

                  </div>
                </form>
              </div>

              <!-- //////////////////아래부터 사이드바////////////////// -->

              <div class="col-md-5 col-lg-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                  <span id="side-bar-title">나의 정보</span>
                </h4>
                <ul class="list-group mb-3">

                  <!-- 아코디언 -->
                  <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn" onclick="location.href='${rootContext}/member/my-info'">나의 정보 수정</button>
                    <button type="button" class="btn" onclick="location.href='${rootContext}/member/my-board'">내가 올린 글</button>
                    <button type="button" class="btn" onclick="location.href='${rootContext}/member/my-feed'">내가 올린 피드</button>
                  </div>

                </ul>
              </div>
              <!-- //////////////////위까지 사이드바////////////////// -->
            </div>
          </main>
        </div>
      </div>

      <br>
      <br>

      <!-- ================ HTML은 이 위에다가 ==================== -->

      <!-- FOOTER  올 자리 -->

      <%@include file="/WEB-INF/views/common/footer.jsp" %>

        <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    if (${myInfoAlert != null}){
      alert(${myInfoAlert});
    }
  </script>
  </body>

  <link rel="stylesheet" href="${rootContext}/resources/css/member/join.css">
  <script src="${rootContext}/resources/js/member/join.js"></script>
  <link rel="stylesheet" href="${rootContext}/resources/css/member/my-info.css">
  <!-- <link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css"> -->

  </html>