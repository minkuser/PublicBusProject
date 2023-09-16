"use strict";

// 헤더 gnb 스크립트
$(function(){
  var header = $('.header');
  var gnb = $('.header .header-gnb');
  var gnbMenu = $('.header-gnb .gnb-depth-1 .depth-1');
  var depthMenu = $('.header-gnb .gnb-depth-2');
  var maxHeight = calculateMaxHeight();
  if (window.innerWidth > 1024) {
    changeMenuHeight(maxHeight);
  }
  
  gnb.on('mouseenter focusin', function(){
    gnbOpen(header);
  })
  gnb.on('mouseleave focusout', function(){
    gnbClose(header);
  })

  gnbMenu.on('mouseenter focusin', function(){
    $(this).addClass('current');
  })
  gnbMenu.on('mouseleave focusout', function(){
    $(this).removeClass('current');
  })

  $(window).on('resize', function(){
    if (window.innerWidth > 1024) {
      maxHeight = calculateMaxHeight();
      changeMenuHeight(maxHeight);
    }
  });

  function gnbOpen(header){
    var headerHeight = maxHeight + 90;
    header.css("height", headerHeight + "px");
    header.addClass('open');
  }

  function gnbClose(header){
    header.removeAttr("style");
    header.removeClass('open');
  }

  function calculateMaxHeight(){
    var heights = [];
    depthMenu.each(function(){
      var height = $(this).innerHeight();
      heights.push(height);
    });
    var maxHeight = Math.max.apply(null, heights);
    return maxHeight;
  }

  function changeMenuHeight(height) {
    depthMenu.css("height", height + "px");
  }
});

// 모바일 헤더 gnb 스크립트
$(function(){
  var html = $('html');
  var mobileGnb = $('.mobile-gnb');
  var sidebarButton = $('.mobile-gnb .sidebar-btn');
  var mobileMenu = $('.mobile-gnb .depth-1 > a');

  sidebarButton.on('click', function(){
    if (mobileGnb.hasClass('open')) {
      mobileGnbClose(mobileGnb);
    } else {
      mobileGnbOpen(mobileGnb);
    }
  });

  mobileMenu.on('click', function(){
    var $this = $(this);
    var target = $this.parent();
    var depthTarget = $this.siblings('ul');
    var otherLinks = target.siblings('li');
    var otherItems = otherLinks.find('ul');

    if (target.hasClass('current')){
      target.removeClass('current');
      depthTarget.stop().slideUp(300);
    } else {
      otherLinks.removeClass('current');
      otherItems.stop().slideUp(300);
      target.addClass('current');
      depthTarget.stop().slideDown(300);
    }
  });
  
  $(window).on('resize', function(){
    if (window.innerWidth > 1024) {
      mobileGnbClose(mobileGnb);
    }
  });

  function mobileGnbOpen(gnb){
    gnb.addClass('open');
    html.addClass('not-scroll');
  }

  function mobileGnbClose(gnb){
    gnb.removeClass('open');
    html.removeClass('not-scroll');
  }
});

// 푸터 위로가기 버튼
$(function(){
  var scrollTopButton = $('.footer .top-btn');
  scrollTopButton.on('click', function(){
    $("html, body").animate({
      scrollTop: 0,
    }, 200);
  })
});

// 아코디언
$(document).on('click', '.accordion-list .accordion-item a', function(e){
  e.preventDefault();
  var $this = $(this);
  var target = $this.parent();
  var description = $this.siblings('.accordion-desc');
  accordionToggle(target, description);
});

function accordionToggle(target, description){
  var otherItems = target.siblings('.accordion-item');
  var otherDescriptions = otherItems.find('.accordion-desc');

  if (target.hasClass('active')) {
    target.removeClass('active');
    description.stop().slideUp(300);
  } else {
    target.addClass('active');
    description.stop().slideDown(300);
  }
  otherItems.removeClass('active');
  otherDescriptions.stop().slideUp(300);
};

// 탭 콘텐츠
$(document).on('click', '.tab-js .tab-item a', function(e){
  e.preventDefault();
  var $this = $(this);
  var num = $this.data('num');
  var target = $this.parent();
  var otherButtons = target.siblings('.tab-item');
  var targetTabContent = target.closest(".tab-container").find('.tab-contents').first();
  var targetTabInner = targetTabContent.find('> .tab-inner[data-num="'+ num +'"]');
  var otherTabInner = targetTabContent.find('> .tab-inner');

  $this.attr('title', '선택됨');
  otherButtons.removeClass('active');
  otherButtons.find('> a').removeAttr('title');
  target.addClass('active');
  otherTabInner.removeClass('active');
  targetTabInner.addClass('active');
});

// 반응형 테이블 Swipe
function table_mobile() {
  $(".table-responsive").each(function () {
    var $this = $(this);
    if ($this.hasClass("no-mobile")) return;

    var option = $this.find(".table-icon");

    var window_w = $(window).width();
    if (option.length == 0) {
      var icon = $('<button class="table-icon icon--hide"><svg class="swipe-icon" xmlns="http://www.w3.org/2000/svg"><g fill="#F0542B"><path d="M17.506 12.59c-.452-2.69-2.19-3.17-3.018-3.245-.624-.816-1.514-1.262-2.54-1.262-.22 0-.443.02-.668.06-.607-.725-1.444-1.12-2.397-1.12-.72 0-1.355.225-1.793.482l-1.785-5.61C4.94.732 3.975 0 2.792 0 1.897 0 1.056.427.542 1.128c-.5.677-.625 1.525-.357 2.38l2.253 7.088c-.32.184-.604.43-.84.727-.46.58-.737 1.347-.82 2.28-.124 1.387.335 2.933 1.363 4.595.7 1.12 1.47 1.994 1.79 2.334l1.06 2.48c.26.606.85.988 1.51.988h7.05c.806 0 1.487-.563 1.62-1.354l.01-.05.297-2.468.048-.108c1.58-3.596 2.23-6.025 1.997-7.43zm-3.118 7.18c-.015.037-.026.075-.033.114l-.31 2.57c-.04.247-.255.417-.504.417H6.5c-.205 0-.39-.11-.472-.3L4.92 19.99c-.023-.057-.057-.106-.1-.15-.452-.475-3.158-3.432-2.918-6.13.143-1.597.92-2.114 1.45-2.28.268-.085.413-.373.33-.64l-2.42-7.61c-.38-1.21.584-2.026 1.53-2.026.6 0 1.195.33 1.436 1.097l2.07 6.5c.073.23.284.36.495.36.148 0 .297-.06.4-.2.085-.113.188-.222.31-.316.272-.21.8-.432 1.38-.432.594 0 1.24.237 1.707.96.1.15.264.24.437.24.048 0 .095-.007.143-.02.205-.06.478-.116.78-.116.58 0 1.268.21 1.773 1.01.095.15.258.24.434.24h.07c.607 0 1.822.266 2.166 2.316.32 1.903-1.766 6.43-2.004 6.992z" fill="#F0542B"></path><path class="swipe-arrow" d="M9.766 3.294h5.505l-1.21 1.213c-.22.22-.22.578 0 .8.11.11.26.164.4.164.15 0 .29-.05.4-.16l2.11-2.11c.22-.22.22-.58 0-.8L14.8.24c-.22-.22-.577-.22-.797 0-.22.22-.22.578 0 .798l1.128 1.13H9.77c-.312 0-.564.252-.564.563 0 .31.252.56.564.56z" fill="#F0542B"></path></g></svg></button>').prependTo($(this));
    }
    if (window_w < 768) {
      $this.removeClass("table-pc").addClass("table-responsive");
      option.removeClass('icon--hide');
    } else {
      $this.addClass("table-pc");
      option.addClass('icon--hide');
    }
  });
}

function table_mobile1() {
  $(".flip-scroll").each(function () {
    var $this = $(this); //버튼
    var option = $this.find(".table-icon");
    var window_w = $(window).width();
    if (option.length == 0) {
      var icon = $('<button class="table-icon icon--hide"><svg class="swipe-icon" xmlns="http://www.w3.org/2000/svg"><g fill="#F0542B"><path d="M17.506 12.59c-.452-2.69-2.19-3.17-3.018-3.245-.624-.816-1.514-1.262-2.54-1.262-.22 0-.443.02-.668.06-.607-.725-1.444-1.12-2.397-1.12-.72 0-1.355.225-1.793.482l-1.785-5.61C4.94.732 3.975 0 2.792 0 1.897 0 1.056.427.542 1.128c-.5.677-.625 1.525-.357 2.38l2.253 7.088c-.32.184-.604.43-.84.727-.46.58-.737 1.347-.82 2.28-.124 1.387.335 2.933 1.363 4.595.7 1.12 1.47 1.994 1.79 2.334l1.06 2.48c.26.606.85.988 1.51.988h7.05c.806 0 1.487-.563 1.62-1.354l.01-.05.297-2.468.048-.108c1.58-3.596 2.23-6.025 1.997-7.43zm-3.118 7.18c-.015.037-.026.075-.033.114l-.31 2.57c-.04.247-.255.417-.504.417H6.5c-.205 0-.39-.11-.472-.3L4.92 19.99c-.023-.057-.057-.106-.1-.15-.452-.475-3.158-3.432-2.918-6.13.143-1.597.92-2.114 1.45-2.28.268-.085.413-.373.33-.64l-2.42-7.61c-.38-1.21.584-2.026 1.53-2.026.6 0 1.195.33 1.436 1.097l2.07 6.5c.073.23.284.36.495.36.148 0 .297-.06.4-.2.085-.113.188-.222.31-.316.272-.21.8-.432 1.38-.432.594 0 1.24.237 1.707.96.1.15.264.24.437.24.048 0 .095-.007.143-.02.205-.06.478-.116.78-.116.58 0 1.268.21 1.773 1.01.095.15.258.24.434.24h.07c.607 0 1.822.266 2.166 2.316.32 1.903-1.766 6.43-2.004 6.992z" fill="#F0542B"></path><path class="swipe-arrow" d="M9.766 3.294h5.505l-1.21 1.213c-.22.22-.22.578 0 .8.11.11.26.164.4.164.15 0 .29-.05.4-.16l2.11-2.11c.22-.22.22-.58 0-.8L14.8.24c-.22-.22-.577-.22-.797 0-.22.22-.22.578 0 .798l1.128 1.13H9.77c-.312 0-.564.252-.564.563 0 .31.252.56.564.56z" fill="#F0542B"></path></g></svg></button>').prependTo($(this));
    }
    if (window_w < 768) {
      $this.removeClass("table-pc").addClass("flip-scroll");
      option.removeClass('icon--hide');
    } else {
      $this.addClass("flip-scroll");
      option.addClass('icon--hide');
    }
  });
}

$(document).ready(function () {
  table_mobile();
  $(window).resize(function () {
    table_mobile();
  });
  $(".table-responsive").on("click", function () {
    $(this).find(".table-icon").addClass('icon--hide');
  });
  table_mobile1();
  $(window).resize(function () {
    table_mobile1();
  });
  $(".flip-scroll").on("click", function () {
    $(this).find(".table-icon").addClass('icon--hide');
  });
});