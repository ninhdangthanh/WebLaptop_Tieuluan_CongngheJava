<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
                    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="icon" href="https://laptop-react-web.web.app/static/media/logo_tran_phat.d761b569.png">
                <title>LapTop Web</title>
            </head>

            <body>
                <div class="header">
                    <div class="top_header container">
                        <div class="logo_header w-25">
                            <a href="/TieuluanJava_WebLaptop">
                                <img src="https://laptop-react-web.web.app/static/media/logo_tran_phat.d761b569.png"
                                    alt="">
                            </a>
                        </div>
                        <div class="search_header w-25">
                            <form  action="${pageContext.request.contextPath}/search_laptop" method="post" class="search_header_wrap">
                                <input class="search_header_input" id="searchingPage" name="searchingPage" type="text"
                                    placeholder="Nhập tên sản phẩm">
                                <button type="submit"><i class="fa-solid fa-magnifying-glass search_header_icon"></i></button>
                            </form>
                        </div>
                        <div class="advertisement_header w-25">
                            <div class="advertisement_header_wrap">
                                <div class="ad_day_day">
                                    <div class="number">
                                        07
                                    </div>
                                    <div class="letter">
                                        NGÀY
                                    </div>
                                </div>
                                <div class="ad_day_text">
                                    DÙNG THỬ MIỄN PHÍ
                                </div>
                                <div class="ad_day_day">
                                    <div class="number">
                                        30
                                    </div>
                                    <div class="letter">
                                        NGÀY
                                    </div>
                                </div>
                                <div class="ad_day_text">
                                    ĐỔI TRẢ HƯ HỎNG
                                </div>
                            </div>
                        </div>
                        <div class="cart_admin_header w-25">
                            <div class="cart_am_hd_wrap">
                                <div class="cart_admin_header_div">
                                    <div class="cart_header_icon">
                                        <i class="fa-solid fa-cart-shopping cart_admin_header_div_faw"></i>
                                    </div>
                                    <div class="">Giỏ hàng</div>
                                </div>
                                <a href="login" class="cart_admin_header_div">
                                    <div class="cart_header_icon">
                                        <i class="fa-solid fa-circle-user cart_admin_header_div_faw"></i>
                                    </div>
                                    <div class="">Tài khoản</div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="bot_header">
                        <div class="bot_header_item">
                            <a href="/TieuluanJava_WebLaptop" class=" bot_header_item_link">Trang chủ</a>
                        </div>
                        <div class="bot_header_item">
                            <a href="all_product" class="bot_header_item_link">Tất cả sản phẩm</a>
                        </div>
                        <div class="bot_header_item">
                            <a href="laptop_trademark?trademark=Dell&series=noSeries"
                                class="bot_header_item_link">Laptop
                                Dell</a>
                        </div>
                        <div class="bot_header_item">
                            <a href="laptop_trademark?trademark=Acer&series=noSeries"
                                class="bot_header_item_link">Laptop
                                Acer</a>
                        </div>
                        <div class="bot_header_item">
                            <a href="laptop_trademark?trademark=Asus&series=noSeries"
                                class="bot_header_item_link">Laptop
                                Asus</a>
                        </div>
                    </div>
                </div>

                <div class="body container">
                    <div class="slide_container">
                        <div class="carousel-item-left">
                            <img src="https://laptop-react-web.web.app/static/media/bannerL5.f740da53.jpg"
                                class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item-right">
                            <img src="https://laptop-react-web.web.app/static/media/bannerR1.3569a80a.jpg" alt="">
                            <img src="https://laptop-react-web.web.app/static/media/bannerR2.9fd22025.jpg" alt="">
                            <img src="https://laptop-react-web.web.app/static/media/bannerR3.6209d530.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="body_products container">
                    <div class="body_products_item">
                        <div class="body_products_item_left">
                            <h2>LAPTOP DELL</h2>
                            <img src="https://laptop-react-web.web.app/static/media/dell.d97e6b8f.jpg" alt="">
                        </div>
                        <div class="body_products_item_right">
                            <a href="laptop_trademark?trademark=Dell&series=noSeries"
                                class="body_products_see_all">
                                Xem tất cả
                            </a>
                            <div class="body_products_item_right_list_product">
                                <c:forEach items="${threeLaptopDell}" var="laptop">
                                    <a href="laptop_detail?id=${laptop.id}" class="body_products_item_right_item">
                                        <img src="${laptop.link_img}" alt="">
                                        <div class="body_products_item_right_item_name">
                                            ${laptop.getName()}
                                        </div>
                                        <div class="body_products_item_right_item_price">
                                            <div class="body_products_item_right_item_price_left">
                                                ${laptop.getPrice()}
                                            </div>
                                            <div class="body_products_item_right_item_price_right">
                                                ${laptop.getPast_price()}
                                            </div>
                                        </div>
                                        <div class="body_products_item_right_item_rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <div>10 đánh giá</div>
                                        </div>
                                        <div class="body_products_item_right_item_specification">
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-laptop"></i>
                                                ${laptop.getScreen_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-microchip"></i>
                                                ${laptop.getCpu_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-sim-card"></i>
                                                ${laptop.getRam_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-database"></i>
                                                ${laptop.getMemory_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-flag-usa"></i>
                                                NVIDIA
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="body_products_item">
                        <div class="body_products_item_left">
                            <h2>LAPTOP ACER</h2>
                            <img src="https://laptop-react-web.web.app/static/media/dell.d97e6b8f.jpg" alt="">
                        </div>
                        <div class="body_products_item_right">
                            <a href="laptop_trademark?trademark=Acer&series=noSeries"
                                class="body_products_see_all">
                                Xem tất cả
                            </a>
                            <div class="body_products_item_right_list_product">
                                <c:forEach items="${threeLaptopAcer}" var="laptop">
                                    <a href="laptop_detail?id=${laptop.id}" class="body_products_item_right_item">
                                        <img src="${laptop.link_img}" alt="">
                                        <div class="body_products_item_right_item_name">
                                            ${laptop.getName()}
                                        </div>
                                        <div class="body_products_item_right_item_price">
                                            <div class="body_products_item_right_item_price_left">
                                                ${laptop.getPrice()}
                                            </div>
                                            <div class="body_products_item_right_item_price_right">
                                                ${laptop.getPast_price()}
                                            </div>
                                        </div>
                                        <div class="body_products_item_right_item_rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <div>10 đánh giá</div>
                                        </div>
                                        <div class="body_products_item_right_item_specification">
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-laptop"></i>
                                                ${laptop.getScreen_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-microchip"></i>
                                                ${laptop.getCpu_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-sim-card"></i>
                                                ${laptop.getRam_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-database"></i>
                                                ${laptop.getMemory_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-flag-usa"></i>
                                                NVIDIA
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="body_products_item">
                        <div class="body_products_item_left">
                            <h2>LAPTOP ASUS</h2>
                            <img src="https://laptop-react-web.web.app/static/media/dell.d97e6b8f.jpg" alt="">
                        </div>
                        <div class="body_products_item_right">
                            <a href="laptop_trademark?trademark=Asus&series=noSeries"
                                class="body_products_see_all">
                                Xem tất cả
                            </a>
                            <div class="body_products_item_right_list_product">
                                <c:forEach items="${threeLaptopAsus}" var="laptop">
                                    <a href="laptop_detail?id=${laptop.id}" class="body_products_item_right_item">
                                        <img src="${laptop.link_img}" alt="">
                                        <div class="body_products_item_right_item_name">
                                            ${laptop.getName()}
                                        </div>
                                        <div class="body_products_item_right_item_price">
                                            <div class="body_products_item_right_item_price_left">
                                                ${laptop.getPrice()}
                                            </div>
                                            <div class="body_products_item_right_item_price_right">
                                                ${laptop.getPast_price()}
                                            </div>
                                        </div>
                                        <div class="body_products_item_right_item_rating">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <div>10 đánh giá</div>
                                        </div>
                                        <div class="body_products_item_right_item_specification">
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-laptop"></i>
                                                ${laptop.getScreen_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-microchip"></i>
                                                ${laptop.getCpu_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-sim-card"></i>
                                                ${laptop.getRam_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-database"></i>
                                                ${laptop.getMemory_compact()}
                                            </div>
                                            <div class="body_products_item_right_item_specification_detail">
                                                <i class="fa-solid fa-flag-usa"></i>
                                                NVIDIA
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="body_news container">
                    <div class="body_news_bar">
                        <div class="body_news_bar_laptop">
                            VIDEO VỀ LAPTOP
                        </div>
                        <div class="body_news_bar_news_title">
                            TIN TỨC
                        </div>
                    </div>
                    <div class="body_news_bottom">
                        <div class="body_news_video">
                            <iframe width="654" height="400" src="https://www.youtube.com/embed/-7Q3sCTJxOU"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                allowfullscreen></iframe>
                        </div>
                        <div class="body_news_list_news">
                            <div class="body_news_list_news_wrap">
                                <div class="body_news_list_news_item">
                                    <div class="body_news_list_news_item_img">
                                        <img class="body_news_list_news_item_img_img"
                                            src="https://laptop-react-web.web.app/static/media/imgFB1.eb42532b.jpg"
                                            alt="">
                                    </div>
                                    <div class="body_news_list_news_item_content">
                                        <div class="body_news_list_news_item_content_title">
                                            Top 10 Thương Hiệu Laptop Xách Tay tốt nhất Thế Giới 2021
                                        </div>
                                        <div class="body_news_list_news_item_content_day">
                                            20/9
                                        </div>
                                    </div>
                                </div>
                                <div class="body_news_list_news_item">
                                    <div class="body_news_list_news_item_img">
                                        <img class="body_news_list_news_item_img_img"
                                            src="https://laptop-react-web.web.app/static/media/imgFB2.b86acddf.jpg"
                                            alt="">
                                    </div>
                                    <div class="body_news_list_news_item_content">
                                        <div class="body_news_list_news_item_content_title">
                                            Top 10 Laptop Workstation đáng mua nhất hiện nay
                                        </div>
                                        <div class="body_news_list_news_item_content_day">
                                            20/9
                                        </div>
                                    </div>
                                </div>
                                <div class="body_news_list_news_item">
                                    <div class="body_news_list_news_item_img">
                                        <img class="body_news_list_news_item_img_img"
                                            src="	https://laptop-react-web.web.app/static/media/imageFB3.51855277.png"
                                            alt="">
                                    </div>
                                    <div class="body_news_list_news_item_content">
                                        <div class="body_news_list_news_item_content_title">
                                            Trải nghiệm giao diện mới của "hệ điều hành của tương lai" Window
                                            11
                                        </div>
                                        <div class="body_news_list_news_item_content_day">
                                            20/9
                                        </div>
                                    </div>
                                </div>
                                <div class="body_news_list_news_item">
                                    <div class="body_news_list_news_item_img">
                                        <img class="body_news_list_news_item_img_img"
                                            src="https://laptop-react-web.web.app/static/media/imgFB4.5c9aca4a.jpg"
                                            alt="">
                                    </div>
                                    <div class="body_news_list_news_item_content">
                                        <div class="body_news_list_news_item_content_title">
                                            Top 10 laptop pin "trâu" không thể bỏ qua
                                        </div>
                                        <div class="body_news_list_news_item_content_day">
                                            20/9
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="evaluate container">
                    <h2>Trải nghiệm người dùng</h2>
                    <div class="evaluate_body">
                        <div class="evaluate_item">
                            <img src="https://laptop-react-web.web.app/static/media/user1.34f1a584.jpg" alt=""
                                class="evaluate_item_img">
                            <div class="evaluate_item_name">MAI NGUYỄN</div>
                            <div class="evaluate_item_company">IT tại FPT Software</div>
                            <div class="evaluate_item_content">
                                Mình là dân IT. Mình đã mua máy bên chỗ anh Tuấn Trần Phát từ 2017 tới giờ. Chủ yếu là
                                mình mua máy
                                Dell Hiện tại mình vẫn đang lấy hàng thường xuyên chỗ anh này cho công ty dùng. Vì mình
                                thấy cấu
                                hình này so với máy mới thì rẻ hơn nhiều. Chúc anh thành công hơn nữa !
                            </div>
                        </div>
                        <div class="evaluate_item">
                            <img src="https://laptop-react-web.web.app/static/media/user2.0990586a.jpg" alt=""
                                class="evaluate_item_img">
                            <div class="evaluate_item_name">lương đặng chi</div>
                            <div class="evaluate_item_company">Sinh viên Đại Học Bách Khoa TPHCM</div>
                            <div class="evaluate_item_content">
                                Lời khuyên cho các bác mua máy tính cấu hình tốt kèm theo giá hợp túi tiền sinh viên.
                                Giá không cần
                                phải bàn rồi. Còn về chất lượng thì khỏi phải chê, có vấn đề gì thì cứ mang máy tới ảnh
                                bảo hành từ
                                A tới Á luôn. Mua của ảnh an tâm lắm, cho nên mình giới thiệu cho bạn bè cùng mua thì
                                chúng nó có
                                có cảm nhận giống mình. Cho 5* bự.
                            </div>
                        </div>
                        <div class="evaluate_item">
                            <img src="https://laptop-react-web.web.app/static/media/user3.ad564800.jpg" alt=""
                                class="evaluate_item_img">
                            <div class="evaluate_item_name">trinh nguyễn</div>
                            <div class="evaluate_item_company">Account Manager tại Sapo</div>
                            <div class="evaluate_item_content">
                                Vì mình cần gấp 1 em laptop nhỏ gọn nhưng chạy đồ họa tốt nên nhờ a chủ tư vấn giúp ngay
                                nửa đêm,
                                ảnh vẫn rất nhiệt tình :) và máy thì mới quá mới, quá mượt mà ToT bạn nào thực sự muốn
                                mua laptop
                                thì cứ yên tâm với chất lượng hàng hóa shop nhé (y) (y)
                            </div>
                        </div>
                        <div class="evaluate_item">
                            <img src="data:image/jpeg;base64,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"
                                alt="" class="evaluate_item_img">
                            <div class="evaluate_item_name">đào trần</div>
                            <div class="evaluate_item_company">Designer tại Điền Quân Media</div>
                            <div class="evaluate_item_content">
                                Sau một thời gian mua và sử dụng con Thinkpad T460s tại Trần Phát. Cảm ơn anh Tuấn Trần
                                Phát dễ
                                thương, tâm lý đã tư vấn và giúp mình chọn được em laptop hơn cả sự mong đợi với chi phí
                                hợp lý. Tin
                                mình đi, các bạn không chọn sai đâu.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer">
                    <div class="footer_info container">
                        <div class="footer_info_column">
                            <div class="footer_info_logo_web">
                                <a href="/">
                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAABkCAMAAABqx9+wAAAAq1BMVEUAAAD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Nr6iZAAAAOHRSTlMABPsHC/iCLCYV5YbTvj2j3knisKwiEMUxtaj0Q9kdGe1bi06QXzV0V5XpOZ59ZPGZznhqUrnJb0+y2lcAABGJSURBVHja7Jp9f5owEMcv8iRaRYagIGpBrFjFqtWa9//Kdjke4gbuM9d/NrtfW5pcYuS+3F3SB/gdMQYobxxla8vxfd9xHP/sO8G++x7O8xnw9URU1DCzHEvfhYbHSrvqbtLjfhgk0ewLshHueune376P1dKkCLEShJvGTrBqfy00wtX+2l/bBEWpe67ktvHRCZbql0Ej3Fw6QaoKAmQxx4vdsdvd75OufonCNvFidH1Jzt3Zl0AjXLyc10ZBRd1c1sPhNs526QJ1ii76Ohha3agNYhRnezj7C6BhAFEvmeUJZEZ7xzrargJSxUbVDZxuyHC+GNv14gdPKIa54VsugEiTxdaPbbMYMI1NuDid7P7YVYHU3m397hhoLluNdo9MRgGIeyG5ah79fVF7jSj2p2+8lNb5sFb5OWb+PhymOU9z67sPS4bBZpTlWLq9bEZl97R+IhyTb4eeMxyeR9Nn6r+djy+A6m97S0ZI7Y8LPKQYwHE0Fj6ybLRShcW2BIWOoy/G8yoaVLe/2x9aOHA4igo8ToqDnmINVXg8IY/hlsIlHenCQfMiYmWUbVR5GJa5Mku3Hc5bw/Aa7O78eGQUmH28i29mMHSx72WvnE91o0ZEdtVFgHFzttFQojEfDowCL08hXiH9iAD13sFgSRWiAI0iu9tFfP4Yew/6M6UC9sEVabT2TVGDPxCLXaPSxMbLcL9K1AdkknNZHEzk4vV0QMWcD6LfCQCaMl/jdPsRw4XixUMuxuGE7faBQuB3HWVAARY/IBkFNhQv4ZOB7XTCB+EdXtLULuc989HIMHCfRH2xD3Pk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"
                                        alt="">
                                </a>
                            </div>
                            <div class="footer_info_address">
                                <i class="fa-solid fa-location-dot"></i>
                                <span>
                                    103/16 Nguyễn Hồng Đào, P.14, Q.Tân Bình, Tp.HCM
                                </span>
                            </div>
                            <div class="footer_info_address">
                                <i class="fa-solid fa-location-dot"></i>
                                <span>
                                    169 Võ Văn Ngân, Phường Linh Chiểu, TP.Thủ Đức
                                </span>
                            </div>
                            <div class="footer_info_address">
                                <i class="fa-solid fa-phone"></i>
                                <span>
                                    035.9814.518
                                </span>
                            </div>
                            <div class="footer_info_address">
                                <i class="fa-solid fa-envelope-open"></i>
                                <span>
                                    ninhnam027@gmail.com
                                </span>
                            </div>
                            <div class="footer_info_address">
                                <i class="fa-solid fa-envelope-open"></i>
                                <span>
                                    nd272002@gmail.com
                                </span>
                            </div>
                            <div class="footer_info_address">
                                <i class="fa-solid fa-globe"></i>
                                <span>
                                    https://laptops.vn
                                </span>
                            </div>
                            <div class="footer_info_thue">
                                CÔNG TY TNHH MTV TIN HỌC TRẦN PHÁT
                            </div>
                            <div class="footer_info_thue_detail">
                                <div>Mã số thuế: 0313886932</div>
                                <div>Người đại diện: Trần Minh Tuấn</div>
                                <div>Ngày cấp: 29/06/2016</div>
                                <div>Nơi cấp: Chi cục Thuế Quận Tân Bình</div>
                            </div>
                        </div>
                        <div class="footer_info_column">
                            <div class="footer_info_customer">
                                <div class="footer_info_customer_title">
                                    CHÍNH SÁCH CHUNG
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Chính sách vận chuyển </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Chính sách đổi trả </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Chính sách bảo mật </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Chính sách bảo hành </span>
                                </div>
                            </div>
                            <div class="footer_info_customer">
                                <div class="footer_info_customer_title">
                                    TƯ VẤN KHÁCH HÀNG
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Tư vấn mua hàng </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Hỗ trợ kỹ thuật </span>
                                </div>
                            </div>
                        </div>
                        <div class="footer_info_column">
                            <div class="footer_info_customer">
                                <div class="footer_info_customer_title">
                                    THÔNG TIN HỖ TRỢ
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span>Giới thiệu</span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Hướng dẫn mua hàng online </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Hướng dẫn thanh toán </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span> Mua hàng trả góp </span>
                                </div>
                                <div class="footer_info_customer_item">
                                    <i class="fa-solid fa-chevron-right"></i>
                                    <span>Tuyển dụng</span>
                                </div>
                            </div>
                            <div class="footer_info_thue_info">
                                <img src="data:image/png;base64,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"
                                    alt="">
                                <img src="data:image/png;base64,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"
                                    alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>


            <style>
                *,
                body {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
                }

                .container {
                    width: 1140px !important;
                    margin: 0 auto;
                }

                .top_header {
                    display: flex;
                    align-items: center;
                    flex-wrap: wrap;
                    height: 160px;
                    margin: 0 auto;
                    text-align: center;
                    align-items: center;
                }

                .w-25 {
                    max-width: 25%;
                    padding: 16px;
                    flex: 1;
                }

                .logo_header img {
                    width: 100%;
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

                .advertisement_header_wrap {
                    display: flex;
                }

                .ad_day_day {
                    color: #1e73ac;
                    padding-left: 10px;
                }

                .number {
                    font-size: 42px;
                    line-height: 1;
                    font-weight: 700;
                }

                .letter {
                    font-size: 12px;
                    text-transform: uppercase;
                }

                .ad_day_text {
                    width: 100px;
                    line-height: 1.4;
                    text-align: left;
                    font-weight: 700;
                    position: relative;
                    top: 6px;
                    padding-left: 8px;
                    font-size: 12px;
                }

                .cart_am_hd_wrap {
                    display: flex;
                    align-items: center;
                }

                .cart_admin_header_div {
                    width: 50%;
                    font-size: 16px;
                    font-weight: 700;
                    color: #1e73ac;
                    color: #1e73ac;
                    position: relative;
                    text-decoration: none;
                }

                .cart_admin_header_div_faw {
                    font-size: 40px;
                    cursor: pointer;
                }

                .bot_header {
                    background-color: #123d69;
                    width: 100%;
                    display: flex;
                    flex-wrap: wrap;
                    box-sizing: border-box;
                    justify-content: center;
                    align-items: center;
                }

                .bot_header_item {
                    overflow: hidden;
                    padding-top: 18px;
                    padding-bottom: 18px;
                }

                .bot_header_item:hover {
                    color: #fff;
                    background-color: #0186cf;
                }

                .bot_header_item_link {
                    color: #fff;
                    cursor: pointer;
                    padding: 20px;
                    position: relative;
                    font-size: 18px;
                    text-decoration: none;
                }

                .body_news_bar {
                    display: flex;
                    font-size: 15px;
                    font-size: 15px;
                    border-bottom: 1px solid #dee2e6;
                    margin-bottom: 16px;
                }

                .body_news_bar_laptop {
                    padding: 8px 16px;
                    font-weight: bold;
                    border-bottom: 2px solid #0186cf;
                }

                .body_news_bar_news_title {
                    padding: 8px 16px;
                }

                .body_news_bottom {
                    display: flex;
                }

                .body_news_list_news_item {
                    cursor: pointer;
                    display: flex;
                    margin-bottom: 20px;
                    justify-content: space-between;
                }

                .body_news_list_news_item_img {
                    width: 30%;
                    display: flex;
                    justify-content: flex-end;
                }

                .body_news_list_news_item_img_img {
                    height: 90px;
                    max-width: 97%;
                    margin-right: 20px;
                }

                .body_news_video {
                    width: 60%;
                    padding-right: 30px;
                }

                .body_news_list_news_item_content_title {
                    font-size: 13px;
                    font-weight: bold;
                }

                .body_news_list_news_item_content_day {
                    color: #828282;
                    font-size: 12px;
                }

                .body_news_list_news_item_content {
                    width: 70%;
                }

                .evaluate h2 {
                    margin-top: 30px;
                    text-align: center;
                    margin-bottom: 30px;
                    font-size: 2rem;
                }

                .evaluate_item_img {
                    width: 50%;
                    border-radius: 50%;
                    margin-bottom: 5px;
                }

                .evaluate_item_name {
                    color: #123D69;
                    font-size: 15px;
                    text-align: center;
                    font-weight: bold;
                    line-height: 1.3;
                    margin-bottom: 3px;
                    text-transform: uppercase;
                }

                .evaluate_item_company {
                    margin-bottom: 10px;
                }

                .evaluate_item_content {
                    padding-left: 20px;
                    margin-bottom: 50px;
                    padding-right: 20px;
                }

                .evaluate_body {
                    width: 100%;
                    display: flex;
                }

                .evaluate_item {
                    width: 25%;
                    font-size: 13px;
                    text-align: center;
                }

                .footer {
                    background-color: #123d69;
                }

                .footer_info_logo_web {
                    margin-bottom: 20px;
                }

                .footer_info {
                    display: flex;
                    flex-wrap: wrap;
                    color: white;
                    font-size: 16px;
                    padding: 60px 0;
                }

                .footer_info_column {
                    width: 33.33333%;
                    padding: 16px;
                }

                .footer_info_address {
                    margin-bottom: 16px;
                }

                .footer_info_address span {
                    padding-left: 6px;
                }

                .footer_info_address i {
                    font-size: 20px;
                }

                .footer_info_thue {
                    padding: 16px 0 10px;
                }

                .footer_info_thue_detail div {
                    margin-bottom: 6px;
                }

                .footer_info_customer_title {
                    font-size: 16px;
                    max-width: 280px;
                    font-weight: bold;
                    border-bottom: 1px solid #fff;
                    margin-bottom: 18px;
                    padding-bottom: 15px;
                    text-transform: uppercase;
                }

                .footer_info_customer_item {
                    cursor: pointer;
                    display: flex;
                    align-items: center;
                    padding-bottom: 14px;
                    display: flex;
                    align-items: center;
                }

                .footer_info_customer_item span {
                    transition: all 0.3s linear;
                }

                .footer_info_customer_item:hover span {
                    transform: translateX(6px);
                    text-decoration: underline;
                }

                .footer_info_customer_item i {
                    padding-right: 6px;
                }

                .footer_info_customer {
                    margin-bottom: 40px;
                }

                .footer_info_thue_info {
                    display: flex;
                    align-items: center;
                }

                .footer_info_thue_info img {
                    margin-right: 16px;
                }

                .slide_container {
                    display: flex;
                    height: 270px;
                    justify-content: space-between;
                    margin-top: 15px;
                }

                .carousel-item-left {
                    max-width: 66.66667%;
                    height: 100%;
                }

                .carousel-item-left img {
                    height: 100%;
                    width: 100%;
                }

                .carousel-item-right {
                    max-width: 33.33333%;
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                }

                .carousel-item-right img {
                    width: 100%;
                    height: 33.3333333%;
                }

                .body_products {
                    margin-top: 40px;
                }

                .body_products_item {
                    cursor: pointer;
                    display: flex;
                    padding: 20px;
                    padding-left: 0;
                    margin-bottom: 40px;
                    background-color: #1d73ac;
                }

                .body_products_item_left {
                    max-width: 30%;
                    padding: 0 20px;
                }

                .body_products_item_left img {
                    width: 100%;
                }

                .body_products_item_left h2 {
                    text-align: center;
                    color: #fff;
                    font-size: 29px;
                    text-align: center;
                    font-weight: bold;
                    margin-bottom: 15px;
                    text-transform: uppercase;
                }

                .body_products_item_right {
                    width: 70%;
                }

                .body_products_see_all {
                    color: #fff;
                    display: flex;
                    font-size: 18px;
                    padding-top: 10px;
                    margin-right: 30px;
                    margin-bottom: 8px;
                    justify-content: flex-end;
                }

                .body_products_see_all:hover {
                    text-decoration: underline;
                }

                .body_products_item_right_list_product {
                    display: flex;
                    overflow: hidden;
                    border: 6px solid #113d69;
                    margin-right: 20px;
                    border-radius: 12px;
                    background-color: #fff;
                }

                .body_products_item_right_item {
                    color: black;
                    text-decoration: none;
                    max-width: 33.333333%;
                    flex-basis: 33.333333%;
                    padding: 10px;
                    background-color: #f8f9fa;
                    overflow: hidden;
                    transition: all 0.2s linear;
                }

                .body_products_item_right_item:hover {
                    box-shadow: 0 0 10px rgb(0 0 0 / 30%);
                    z-index: 10;
                }

                .body_products_item_right_item img {
                    width: 100%;
                    height: 180px;
                }

                .body_products_item_right_item_name {
                    color: #000;
                    font-size: 16px;
                    font-weight: bold;
                    line-height: 1.2;
                    margin-bottom: 10px;
                }

                .body_products_item_right_item_price_left {
                    color: #C42525;
                    font-size: 16px;
                    font-weight: bold;
                }

                .body_products_item_right_item_price_right {
                    font-size: 12px;
                    padding-right: 3px;
                    text-decoration: line-through;
                }

                .body_products_item_right_item_price {
                    display: flex;
                    justify-content: space-between;
                }

                .body_products_item_right_item_rating {
                    display: flex;
                    margin-top: 8px;
                    margin-bottom: 6px;
                }

                .body_products_item_right_item_rating i {
                    color: #ffc120;
                }

                .body_products_item_right_item_rating div {
                    font-size: 12px;
                    margin-top: 2px;
                    margin-left: 4px;
                }

                .body_products_item_right_item_specification_detail {
                    font-size: 14px;
                    margin-right: 14px;
                    margin-bottom: 5px;
                }

                .body_products_item_right_item_specification_detail i {
                    color: #b6bfc7;
                    font-size: 12px;
                    margin-right: 4px;
                }

                .body_products_item_right_item_specification {
                    display: flex;
                    padding: 10px 8px 12px;
                    flex-wrap: wrap;
                    border-radius: 5px;
                    background-color: #f8f9fa;
                }
            </style>