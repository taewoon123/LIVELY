<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JOIN</title>
</head>

<body>
<div>
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
</div>

<div id="wrap">


  <div class="form-container">
      <p class="titl">Only Superuser can access this page.</p>
    <p class="title">Sign Up for Admin</p>


    <form class="form" action="${rootContext}/admin/signup" method="post">

      <table id="join-form">
        <tbody>

        <tr>
          <td>
            ID
          </td>
          <th>
            <div class="input-group">
              <input type="text" name="adminId" id="id" placeholder="">
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
                      <input type="password" name="adminPwd" id="pwd">
                    </div>
                  </th>
                  <td id="pwd-validity">

                  </td>
              </tr>

              <tr>
                <th colspan="3">
                  <input type="submit" id="join-button" value="Submit">
                </th>
              </tr>
        </tbody>

      </table>
    </form>

  </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
<link rel="stylesheet" href="${rootContext}/resources/css/member/join.css">
<script src="${rootContext}\resources\js\member\join.js"></script>
<link rel="stylesheet" href="${rootContext}/resources/css/common/wrap-style.css">

</html>
