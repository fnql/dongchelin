$(document).ready(function(){
  $("#logintul").click(function(){
    $("#panel").slideToggle("slow");
  });
});

$(document).ready(function() {
  $('#summernote').summernote({
      tabsize: 2,
      height: 300,
      lang: 'ko-KR' // 언어 세팅
  });
});