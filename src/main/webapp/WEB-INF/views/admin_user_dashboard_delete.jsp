<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin_main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="https://laptop-react-web.web.app/static/media/logo_tran_phat.d761b569.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <title>Delete User</title>
</head>

<body>
    <div class="admin_page">
        <div class="left_admin_page">
            <a class="laptop_homepage_logo_link" href="">
                <img class="laptop_homepage_logo"
                    src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAABkCAMAAABqx9+wAAAAq1BMVEUAAAD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Nr6iZAAAAOHRSTlMABPsHC/iCLCYV5YbTvj2j3knisKwiEMUxtaj0Q9kdGe1bi06QXzV0V5XpOZ59ZPGZznhqUrnJb0+y2lcAABGJSURBVHja7Jp9f5owEMcv8iRaRYagIGpBrFjFqtWa9//Kdjke4gbuM9d/NrtfW5pcYuS+3F3SB/gdMQYobxxla8vxfd9xHP/sO8G++x7O8xnw9URU1DCzHEvfhYbHSrvqbtLjfhgk0ewLshHueune376P1dKkCLEShJvGTrBqfy00wtX+2l/bBEWpe67ktvHRCZbql0Ej3Fw6QaoKAmQxx4vdsdvd75OufonCNvFidH1Jzt3Zl0AjXLyc10ZBRd1c1sPhNs526QJ1ii76Ohha3agNYhRnezj7C6BhAFEvmeUJZEZ7xzrargJSxUbVDZxuyHC+GNv14gdPKIa54VsugEiTxdaPbbMYMI1NuDid7P7YVYHU3m397hhoLluNdo9MRgGIeyG5ah79fVF7jSj2p2+8lNb5sFb5OWb+PhymOU9z67sPS4bBZpTlWLq9bEZl97R+IhyTb4eeMxyeR9Nn6r+djy+A6m97S0ZI7Y8LPKQYwHE0Fj6ybLRShcW2BIWOoy/G8yoaVLe/2x9aOHA4igo8ToqDnmINVXg8IY/hlsIlHenCQfMiYmWUbVR5GJa5Mku3Hc5bw/Aa7O78eGQUmH28i29mMHSx72WvnE91o0ZEdtVFgHFzttFQojEfDowCL08hXiH9iAD13sFgSRWiAI0iu9tFfP4Yew/6M6UC9sEVabT2TVGDPxCLXaPSxMbLcL9K1AdkknNZHEzk4vV0QMWcD6LfCQCaMl/jdPsRw4XixUMuxuGE7faBQuB3HWVAARY/IBkFNhQv4ZOB7XTCB+EdXtLULuc989HIMHCfRH2xD3PkknE+vK9iEJmwwzszeDCxj76Ilw8PGOw5z9ByP9z5iBuPFjLODlTMJsEl4Dz6w7Bjc3goKaCvQaVsUpBLy77/sT/kEYZBfyTwHDbIZc9bIX77r7zAiNLgLEEVddf+z6UMmPUK1DybUs6j/1yqRDpTNuGlrfHs4SrFn+v8gnhGBrYOPID/KgNmtwcVkiNeYj741bnui+1USm8O8NIT2cR5+BlH2L8LoS4Gqy4o4AsiB55ILqx9QzNAuTWz6zXEB4PFGv5RqT0TILVAhXdMJOmRO2k1SeMj8aIB134eeD2s7Z/RKBBP4J8Ug/cYFDgbAF6Hp8AkGI03qZWD+cYbNd39SIZB9g3+UfltgGhNR7sRsB/AtH4FplUbQXE+ml2TUUDvwL8oBraFFydcgvfKbSDJiLkHDAnRTDbAmsCwmmo2uJK0XPUbO6SmdW525HxqNt4ZbJGGnURbWPEegHlRPgMGhXEmydwbMezvOSLMfQYIx2rDlJ8AEu59Egzan816xCB8vXstvaubsIx1abj0GUhdcEhP+qWP/eSq2451XY9dkJp19Wrd46LwIU10tJrVenq8qt4hFevFETXLm5ASh7surhqEASz4VAGTo63alXjrWjfAyEkyZobAfgRDv/yqyYDej4bBsnriY076qGo4dTsqdRbUCa92ipBf6zkjo0+dMU1jHdGeKJBLfaOxNw8Hz7wmtFp9hPmeLSHguFrGTVlj+H0RIw0tec8STMx/3P61lmaAwzVqo3K0cfnuST69dAtWoj/ha2wyOHF8Ne9fgdnkz6da5yyMAa1h5Cs8cU3jA6WYH9GQxpeg0LSfBGA6CiCcQPXeOK7wbMn0VNNIanmKeasZzDrTUd3glcugcupgkjpJA3xpxBY6Vx4Y1I7o41dSgilmboAxWFLnGkz/h/qPHoszyJCmFWCmYuBbGTG9YvkeMJr2k4DOpW0r3EIq/LX5y8261b8FZga5vLV0cTKvpVIJVk5qlWA0oVZufAIUuU59Sh4JhsYZROLVDWAoYggx3UEJBq7ByEQtEq0ZjL4ESHerHVj8iFMGt3ZABaG16EOCwTcSn2NQii2uy1ul0ydgEgxpPjYMox1OxOhH2xBSwaE46Xuz+Xy2yl/alk8URSEkweDlCGozGLRY6mzeTgc0mpYe5/enlGDkU6LPGGBmoNw0D3XXEAII8AtjzoUBBouq6cBunnd4qQ/sqR2ZEPJP1tPKHb0GJpf5lgdwrgKMCyjyo8yVsYyrs4yYktxNMGtsl6MZLSgj+qkAIxMVhRYVchnU3Zb36dAf5R00D1QIb2cSg7D1+iz0qvli6acJdkltOSer3m9fB0NRNSvAMFIdDPpdPVHttQDBZCoRqZtg9qAytYhtvQRzsU/i/yk7FRgGEQ10ioikgIIX6lnUY7DZAl4XCez4ECB+httSzFIeIa3EJJhTBWZ7I2JmTRFjU/xmrarGUKLy0a7wUIKhtXewvAEmqQDjrHrxEGBkoj6fNGHyi+o+zsEUa+4yAeb4DmtRYg406Y/FIK3AJHeAKbI9VwSM1qFkmAg+A1lj3nxheGPpDTADKwiCKSe1SzCtXBUYVmSND4ciRFkdjE73se8jwwWo2vFTYBRYV2Aud4EhUetI5nNRNR0CsABWgmlTCU3sJjDXC2k8AOUmmLgIqayMyDqYPS0+nMGAGwgyBPYZLvNJBaZ/Dxh569wGJp8ohHTnwwqMpob0LeD85nat0cGtY4LSnEqMEhWbACZtkdOmVApcbHhDMLVnE07c/VzEjGq1/p6IoRdqc1CKJ3rYW0Ma1Vy0EZjJDAJ6RTMYqYOLMAswx3QZ4UdRfKuE72wt65nWsYHVwDgeNtwADMFtpanw5/JOU3nPMbDfB9M6RsvlrvtKOJbF4VESo6NLBcZ8xsYtMNqr0NSJhIk1b9eMElWKIrIGxifTFtcdASSdX/7z7+Dw9Cu9cskFHbgjYrQ5tfM9KIbiieY/+BQ7FSvA4MxlMxiybJnpeR4jC7DmAx4lqlwepc2gDkaYwu/cmouWmjAQhv9AUHBR8IaKoqziDa03vOT9n6yTQdq1dm097ban/c8RJgNMkm/DQDYsMVFNwHMfgamrH4hr4YrUHOIJMEYZpjBRYzBLoHeXGgYowHz5gz94wYMQvL2bEigG83IXnpv7HTDHMY4qpEIH4hEYy3goVXDRkPEMGLuYIPM7Wjnvd0PLj/PmvgVjvz9iduwpnN+fRJo+eyscPy3mX3c5ht8DEwLTAk7nx2AM9RPSqwjm02AE9y0HM77uAyklulzpdvgFDAQOZL4zYh6DUfqhcOTwZyFJZuBzaQDzu2BefhcYvp1aAuJdMKOtMm7AWIayNBgeMUQ1QT49XSFXVVnkveCgz9yO2Lcn27gFwxd/Cybk865g8uQr0eOAGXIlXFprMByhANP6OmJ+9VZiKRVngHgwYphupyj2GGcxYrTGdd65xeUXLkY4MPfhlQLr/qm0vgXTZOcVjK/tmFMv53vx9v2HgHfZCt/mmPqYet37UfKdqJ+QX3LAenfEuA0/SsOiuEsj34/aXMGsQmZ8SOKIdhnElWTkkyrD1y0ZLkcXKOnLKrM3YGYNfXHpFswy1hfbealK4StnZDp8ykMrd3OtC6Dsa2P8FkxtR+DOQJI+AjM7n6oP1VvPVwIQ92CekvjYRXFx5/iut2mSr+zBVr7ExZK/qd5/f8Gt6UBgGCLoU8Kf/OKUQAgB/CdgPJ2ZzFaASHV/cRLJ+m/ALAkF4+mpBWT/8AiMKHRbEj8LRrBMoNhrC3w9b7huM7duDoJVONhg75sSCuP23HfqwNUSptAqSm/b+GlDNpIjXlQJ2Pf+8ogRz5wlfi0LPo64eNFgsk9YqBOQxHhfwWqWa1UGqauLLPlzYNqh5y09r2U7S4/UHADIOlH1CKDEiwrjAYbeACbsRMecn6PqFDCTFVjs4Hlz23Pd5QjBrk4FXD6BNUp2NgrVT9H5wl2ddziMSDIqyXEZM8+GiVoJmHqkcCeB9tp1dyM469Bbrr1mDV0PpJV+LMUOBqr7C6sEPwLTCnuq6vXaZXXyyCYwTfUyXSrqV7yDCZC10oumVJUDdFSJDnqQapOP8jM71sBMdTaZ27cRKgmsrsfNqNdryC//lV9PPxlN5GESHYZfpgN1xFTtITDvA1W1boWtdYCu2mcb1xrJMGyp8/o0gGzqUAFtXUUl49Hyyd2C2zNgWLLfhu6XA9ZU2bx1EL2AlF5Qi+MQGGxHKKkhdK8XsKYQEHhRI172OyJtguSegErIP04QZQUou7CnAGw1oDB5la9oVCIgiOuYbrclIPOBXgu5oipIvgfStsYubwYhsK4hUS9A0weeA2P8PBgTbWsFiW7R/E4PpqBeSPg7jBynP0dtO1AT1C0HlQRSmOh1YGgwQDxmR7XXvb5VOJpb92BI5KqGvdO1reOU3x1sCrMswlhHP4HTnxCSiSpzs069guMMpgnHhglpHcE3csZJpkT9dgUmijh93IgZWjOerflR5O8d+OPiyrNK4zhVGWoKJYuaEQjGIehqYTGYwFqwY+xO+xKj3Xp5EQJJv38sgngqggi4rd7+6pTX4fapIoxaV9mCwGy26LncrJZy/Sg94GiMvqRe05qwVVvrnd3SPV1BxOs/ASYbTCZ1iWgHob1khe1Vt2tdCIyDdLxSAawMJkwkPqhvpqAubtixOx+NAKP17syfdMTNovaOOzFewzFzWLvsHQWin4cZN0AEW67u9iaGVIssBfGhhhzLGKg2UxwCMPs5GNkLQGp1sVQJUFIBPh6MA1YY6eNlowyfc0w8R80YYdVPtg72Vei4DQ/GK7TcHjvSpaNW2nhNNYLOS56ZOXO9Wv0Zg8mUpoF4U4TxQxgTyHS3ZTCYpmsfOLXAGvFyJMIqRAFGYEl7gUsJNZU6dEoJ4oPBzNRKOo4jyfgEmNEe8BPyiy2B0dBKKh1hwEtMO2XDyOAEAdU/B7Amx6kSAF2johHsky8LiV3AvaYfaTU1eCPAQNeBpQ4zAcVQdQ1GoKX2Aqeq0AurhMRqA0d1hChuJf4+WeQfnHVUplsiP37EpJVKo38BXlXl3HcdBiMADcagElwrADZ0MLbqCNJ+oxJXgYtqkGMAyI7R6aTLs9Rg8jzFyJqVMNTMyLPabs/pdgXzGmYCST+TujfgEQOnHwGh8ivUlCFkVe1dRngdMcW9JLB7xVSn35Gimj4KjGib2mWXtRxQbZtDHaS2w9sA0taxAhskZ3pYSO0uk9oARuzQGsyzIYbM2kGhwYVidYO8tebisDDzh9frNYzeCFsiaHN02o7ylnCunWfazecVjzZO+rMmzEhNwQ9+8QFgnp4BiHx753ju4sJ6erIgMGvxrlVHpiKCHFffA2PdfjJvXPUQjCAwd+1lFeb7/SgO3p5dGHdip7gp/aiO2299v8XTWoGcgyaEq+YgABuIh1OCPZVk+mBK8F98Mv+5vXNZUhQIougtoRXEZ6OAgKLiqxW1BdH7/182TMbMxhmnx2g3omcFteNEFpURWZWlcExkifOPODLoA4lMpquVyINkzlo+LF6FPi4oxyGLgtyQvLgJ2LQBVe/gjix2eEwU5p8SMrMUxp47wGAPL36Se1CA5vaRMTCAIy2o19E/ha4tIRMPgB4PAJZcPu733NOMPxczH1uYHalSWi8zwiiE4IZYvNGSTU3VB54Ed0ahf4qwIs/QkLL9MvMbDbELnMkMGlY8lK570DfMnG0gpfxhvD3jV9D8QsHyxcwUgG6zXfI+tLeYmflARvY0yEbA3SNnIndFzMQBGx4UHJ+dGIBSJU7k/hOFba7Da7CyRMHC5XCFr92oZzAzP9WgJ2TTQ0HL5d4yvu52ka3TkrtR2JwmwKpOzkwUeEmFjdRT/5pEoUtaJRcDDY79qRAl5HgrapxJLkdjrwQLNj3yfYLSI5sEukArJ8dTQ8bMln7FiooHZGA5eA6MQTIC4ibJwSSSoctOCfJUqw7J/ewJ7iQQpMV1s6oDof9GBnbm6fgDs2sdSA7T6Fm0iBlo2zx1gNHZZcH7wJqHhunoBc7I656L8jHJddJ9gqX6Uo25zaceACPzOxQq4/p6vQ4oBKdp6DxBbvc3NfrO9ncRAFU7bttuZy3VpaDeGHxkYVS6jl23qMHCstvnBQTlRAUjUy9jH7Pb1WCzbDetCwuqxFJ+AMN4J12IuF32AAAAAElFTkSuQmCC"
                    alt="">
            </a>
            <a href="${pageContext.request.contextPath}/admin_dashboard" class="left_list_item ">
                <i class="fa-solid fa-house"></i>
                Danh sách sản phẩm
            </a>
           	<a href="${pageContext.request.contextPath}/admin_user_dashboard" class="left_list_item active">
                <i class="fa-solid fa-user"></i>
                Tài khoản quản lý
            </a>
            <a href="${pageContext.request.contextPath}/admin_page_logout" class="left_list_item left_list_item_logout">
                Đăng xuất
            </a>
        </div>
        <div class="right_admin_page">
            <div class="right_admin_page_header">
                <h2>XÓA SẢN PHẨM</h2>
            </div>
            <div class="right_list_form">
                <table style="width:50%">
                    <tr>
                        <td><strong>ID</strong></td>
                        <td>${userDel.getId() }</td>
                    </tr>
                    <tr>
                        <td><strong>Email</strong></td>
                        <td>${userDel.getEmail() }</td>
                    </tr>
                    <tr>
                        <td><strong>Password</strong></td>
                        <td>${userDel.getPassword() }</td>
                    </tr>
                    <tr>
                        <td><strong>Role</strong></td>
                        <td>${userDel.getRole() }</td>
                    </tr>
                </table>
                <a href="admin_user_dashboard_delete_confirm?id=${userDel.getId()}" type="button"
                    class="btn btn-danger">Xác nhận xóa</a>
            </div>
        </div>
    </div>
</body>

</html>


<style>

*, body {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Roboto",arial,sans-serif;
}

.container {
    width: 1140px !important;
    margin: 0 auto;
}

.admin_page {
    display: flex;
    width: 100%;
}

.left_admin_page {
    width: 20%;
    height: 100vh;
    position: fixed;
    left: 0;
    top: 0;
    padding: 8px;
    padding-left: 16px;
    background-color: #123d69;
}

.laptop_homepage_logo {
    width: 80%;
}

.right_admin_page {
    width: 80%;
    margin-left: 20%;
}

.left_list_item {
    display: block;
    text-decoration: none;
    color: white;
    font-weight: bold;
    font-size: 18px;
    padding: 20px;
    border-radius: 6px;
}

.left_list_item i {
    margin-right: 10px;
}

.left_list_item:hover {
    background-color: #0186cf;
}

.active {
    background-color: #0186cf;
}

.left_list_item_logout:hover {
    background-color: rgb(255, 112, 112);
}

.laptop_homepage_logo_link {
    display: block;
    margin-top: 16px;
    padding-bottom: 16px;
    border-bottom: 1px solid white ;
    margin-bottom: 18px;
}

.search_header_wrap {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    border: 1px solid #333;
    height: 36px;
    border-radius: 20px;
    position: relative;
    background-color: white;
}

.search_header_input {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
    border: none;
    outline: none;
    left: 20px;
    font-size: inherit;
 }

.search_header_icon {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 20px;
    right: 10px;
    font-size: 20px;
    color: #1e73ac;
    font-weight: bold;
}

.search_header {
    width: 300px;
}

.right_admin_page_header {
    display: flex;
    background-color: #257bfc;
    align-items: center;
    padding: 20px 40px;
    justify-content: space-between;
    position: fixed;
    top: 0;
    right: 0;
    width: 80%;
}

.right_admin_page_header h2 {
    color: white;
}


.add_product_button {
    display: block;
    color: blue;
    background-color: white;
    text-decoration: none;
    padding: 10px 20px;
    font-weight: bold;
    font-size: 20px;
    border-radius: 10px;
    border: 3px solid #333;
}

.add_product_button:hover {
    background-color: rgb(187, 187, 255);
}

.right_list_product {
    display: flex;
    flex-wrap: wrap;
    padding: 30px;
    margin-top: 100px;
}

.right_list_form {
    padding: 30px;
    margin-top: 100px;
}

.list_product_item {
    display: block;
    width: 25%;
    text-align: center;
    padding: 20px;
    border: 1px solid #bcbcbc;
}

.list_product_item img {
    width: 100%;
}

.list_product_item_title {
    color: #000;
    font-size: 16px;
    font-weight: bold;
    line-height: 1.2;
    margin-bottom: 10px;
    margin-top: 10px;
}

.list_product_item_button {
    display: block;
    color: black;
    font-weight: bold;
    text-decoration: none;
    font-size: 18px;
    padding: 8px;
    margin-bottom: 4px;
    border-radius: 8px;
    border: 1px solid #333;
}

.list_product_item_detail {
    background-color: #0dcaf0;
}

.list_product_item_edit {
    background-color: #ffc107;
    width: 49%;
}

.list_product_item_delete {
    background-color: #dc3545;
    width: 49%;
}

.list_product_item_manipulate {
    display: flex;
    justify-content: space-between;
}

.right_admin_table_list {
    margin-top: 100px;
    padding: 30px 50px;
}

.th-bg {
    background-color: aqua !important;
}

.delete-restaurant-link {
    cursor: pointer;
    color: #0d6efd;
}

.add-user-btn {
    display: flex;
    justify-content: flex-end;
    margin: 12px;
    margin-bottom: 16px;
}

th, td {
    padding: 10px;
}

.create-new-product {
    display: flex;
    justify-content: left;
    margin-top: 20px;
    margin-left: 200px;
}

.img_product_delete_page {
    height: 200px;
    background-size: contain;
}


</style>