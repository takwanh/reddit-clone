$(function(){
  
  $(".vote").on("click", ".upvote, .downvote", function(){
    var votable_id_and_type = $(this).parent().data("id-type"),
        votable_id = votable_id_and_type[0],
        votable_type = votable_id_and_type[1],
        is_update = $(this).hasClass("upvote");
        console.log(votable_id_and_type)

    $.ajax({
      url: "/post/vote",
      method: "POST",
      data: { votable_id: votable_id, votable_type: votable_type, upvote: is_update },
      success: function(){
        console.log("success");
      }
    });

  });
});