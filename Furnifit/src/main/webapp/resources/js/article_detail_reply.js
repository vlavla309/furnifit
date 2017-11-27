
/* 댓글들이 처음 출력되는 코드 */
var articleId = $("#newArticleId").val();
var email = $("#newEmail").val();
console.log(articleId);
console.log(email);
/* var reply_id = $("#newReply_id"); */

(getList = function getAllList() {
$.getJSON("/one/reply/all/" + articleId, function(data) {
  var str = "";
  
  $(data).each(
      function() {
        str += "<li class='replyLi' data-rno=" + this.reply_id + ">"
          /* + "<data-rno="+this.reply_id+"class='replyLi'>" */
          +"<i class='fa fa-comments bg-blue'></i>"
          +"<div class='timeline-time'>"
          +"<span class='time'>"
          +"<span class='fa fa-clock-o' style='margin-left:84%'>" + " " + "<span style='font-size:12px';>" + this.regdate + "</span>" + "</span>"
          +"</span>"
          +"<div class='timeline-header' style='font-size: 14px;'>" + this.email + "</div>"
            + "<br>" + "<div class='timeline-body'><strong>" + this.content + "</strong>" + "</div>" + "<br><br>"
            + "<div class='timeline-footer'>" + "<a class='btn btn-danger btn-xs' data-toggle='modal' data-target='#modifyModal'>Modify</a>"
            + "</div>"
            + "</li>"
            + "<hr>";
      });
  $("#replies").html(str);
  });
});
getList();

/* var articleId = $("#newArticleId").val();
var email = $("#newEmail").val();  */

/* 무한 스크롤링 코드 */
$(window).scroll(function() {
    console.log($(window).scrollTop());
    console.log($(window).height());
    console.log($(document).height());
   
    var scrollHeight = $(window).scrollTop() + $(window).height();
    var documentHeight = $(document).height();
    console.log(scrollHeight + ":" + documentHeight);

    // 스크롤이 끝까지 내려가면 window 객체의 scrollTop 속성과 height 속성을 합한 값이
    // document 높이와 같아진다.
    if (scrollHeight >= documentHeight - 100) { //브라우저 마다 미세한 차이 발생으로 -100

      var reply_id = $(".replyLi:last").attr("data-rno");
      /* var articleId = ${article.articleId}; */
	  
        $.ajax({
            url: "/one/reply/infiniteScrollDown",
            data: {
                reply_id : reply_id,
                articleId : articleId
            },
            dataType: "json",
            success: function(data) {
              console.log(data);
                var output = "";
                $(data).each(
                        function() {
                    output += "<li class='replyLi' data-rno=" + this.reply_id + ">"
                  /* + "<data-rno="+this.reply_id+"class='replyLi'>" */
                  +"<i class='fa fa-comments bg-blue'></i>"
                  +"<div class='timeline-time'>"
                  +"<span class='time'>"
                  +"<span class='fa fa-clock-o' style='margin-left:84%'>" + " " + "<span style='font-size:12px';>" + this.regdate + "</span>" + "</span>"
                  +"</span>"
                  +"<div class='timeline-header' style='font-size: 14px;'>" + this.email + "</div>"
                    /* + this.reply_id + ":" + this.content + ":" + this.email + ":" + this.regdate + "<br>" */
                    /* + "<button>MOD</button></li>";  */
                    /* + "<span class='timeline-body'></span>" */
                    + "<br>" + "<div class='timeline-body'><strong>" + this.content + "</strong>" + "</div>" + "<br><br>"
                    + "<div class='timeline-footer'>" + "<a class='btn btn-danger btn-xs' data-toggle='modal' data-target='#modifyModal'>Modify</a>"
                    + "</div>"
                    + "</li>"
                    + "<hr>";
                });
                $("#replies:last").append(output);
            }
        });
    }
});

// 댓글을 등록하는 코드
$("#replyAddBtn").on("click", function() {
  /* var email = $("#newEmail").val(); */
  var content = $("#newContent").val();
  /* var articleId  = $("#newArticleId").val(); */

  $.ajax({
    type : 'post',
    url : '/one/reply',
    headers : {
      "Content-Type" : "application/json",
      "X-HTTP-Method-Override" : "POST"},
    dataType : 'text',
    data : JSON.stringify({
      email : email,
      content : content,
      articleId : articleId,
      }),
    success : function(result) {
      console.log("result: " + result);
      if (result == 'SUCCESS') {
        alert("등록 되었습니다.");
        getList();
        $('#newContent').val("")
      }
    }
  });
});

// 댓글 수정, 삭제할 때 데이터를 모달에 제공한다.
$("#replies").on("click", ".replyLi", function(event){
  
  var reply = $(this);
  
  $("#content").val(reply.find('.timeline-body').text());
  $(".modal-title").html(reply.attr("data-rno"));
  console.log(content)  
});

// 댓글을 삭제하는 코드
$("#replyDelBtn").on("click", function() {

  var reply_id = $(".modal-title").html();
  var content = $("#content").val();

  var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;  // 유효성 검사이다. 이메일을 이용하여 회원만 삭제하도록 한다.                                                    
                                    //#newEmail이 비어 있는지 안 비어있는지로 확인할 수도 있지만 나중에 비회원도 댓글을
  if ( !RegexEmail.test($.trim($("#newEmail").val())) ) {         // 달 수 있게 변경될 수도 있어서 위와 같이 했다.              
        alert("로그인 후 이용해주시기 바랍니다.");                      
      return false;
  } else {
    $.ajax({
      type : 'delete',
      url : '/one/reply/' + reply_id,
      headers : {
        "Content-Type" : "application/json",
        "X-HTTP-Method-Override" : "DELETE"
      },
      dataType : 'text',
      success : function(result) {
        console.log("result: " + result);
        if (result == 'SUCCESS') {
          alert("삭제 되었습니다.");
          $("#modDiv").hide("slow");
          getList();
        }
      }
    });
  }
});

// 댓글을 수정하는 코드
$("#replyModBtn").on("click",function(){
    
    var reply_id = $(".modal-title").html();
    var content = $("#content").val();
    
    var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;  // 유효성 검사이다. 이메일을 이용하여 회원만 수정하도록 한다.
                                        //#newEmail이 비어 있는지 안 비어있는지로 확인할 수도 있지만 나중에 비회원도 댓글을  
    if ( !RegexEmail.test($.trim($("#newEmail").val())) ) {         // 달 수 있게 변경될 수도 있어서 위와 같이 했다.
    alert("로그인 후 이용해주시기 바랍니다.");
    return false;
  } else {
      $.ajax({
        type:'put',
        url:'/one/reply/'+ reply_id,
        headers: { 
              "Content-Type": "application/json",
              "X-HTTP-Method-Override": "PUT" },
        data:JSON.stringify({content:content}), 
        dataType:'text', 
        success:function(result){
          console.log("result: " + result);
          if(result == 'SUCCESS'){
            alert("수정 되었습니다.");
             $("#modDiv").hide("slow");
            getList();
          }
      }});
  }
});   
