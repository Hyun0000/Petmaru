<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <section id="carousel">
    <div class="section">
      <input type="radio" name="slide" id="slide01" checked>
      <input type="radio" name="slide" id="slide02">
      <input type="radio" name="slide" id="slide03">
      <div class="slidewrap">

        <ul class="slidelist">
          <!-- 슬라이드 영역 -->
          <li class="slideitem">
            <a href="#">
              <img
                src="https://file.cafe24cos.com/banner-admin-live/upload/gang2yang2/36d1ad07-aa2e-4b40-d5f5-d36000fd7dd4.jpeg">
            </a>
          </li>
          <li class="slideitem">
            <a href="#">
              <img
                src="https://file.cafe24cos.com/banner-admin-live/upload/gang2yang2/541ff3a2-7257-484f-bdad-2392daf4fb08.jpeg">
            </a>
          </li>
          <li class="slideitem">
            <a href="#">
              <img
                src="https://file.cafe24cos.com/banner-admin-live/upload/gang2yang2/31e7bbac-a156-41bc-a3bd-95ab2147a417.jpeg">
            </a>
          </li class="slideitem">

          <!-- 좌,우 슬라이드 버튼 -->
          <div class="slide-control">
            <div>
              <label for="slide03" class="left"></label>
              <label for="slide02" class="right"></label>
            </div>
            <div>
              <label for="slide01" class="left"></label>
              <label for="slide03" class="right"></label>
            </div>
            <div>
              <label for="slide02" class="left"></label>
              <label for="slide01" class="right"></label>
            </div>
          </div>

        </ul>
        <!-- 페이징 -->
        <ul class="slide-pagelist">
          <li><label for="slide01"></label></li>
          <li><label for="slide02"></label></li>
          <li><label for="slide03"></label></li>
        </ul>
      </div>

    </div>
  </section>