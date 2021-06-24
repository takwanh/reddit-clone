module VotesHelper
  
  def is_upvoted(thing)
    hit_vote_button = false
    if current_user
      current_user.upvoted_things.each do |post|
        hit_vote_button = true if post[0] == thing.id && post[1] == "#{thing.class}"
      end
    end
    user_signed_in? && hit_vote_button ? " active" : ""
  end

  def is_downvoted(thing)
    hit_vote_button = false
    if current_user
      current_user.downvoted_things.each do |post|
        hit_vote_button = true if post[0] == thing.id && post[1] == "#{thing.class}"
      end
    end
    user_signed_in? &&  hit_vote_button ? " active" : ""
  end
end
