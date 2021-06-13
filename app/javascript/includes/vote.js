$(function(){
  
  $(".vote").on("click", ".upvote, .downvote", function(){
    var post_id = $(this).parent().data("id"),
        is_update = $(this).hasClass("upvote");

    $.ajax({
      url: "/post/vote",
      method: "POST",
      data: { post_id: post_id, upvote: is_update },
      success: function(){
        console.log("success");
      }
    });

  });
});