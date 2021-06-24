class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates_presence_of :user_id, :votable_type, :votable_id

  after_create :increment_vote
  after_destroy :decrement_vote

  private
  def increment_vote
    field = self.upvote ? :upvotes : :downvotes
    class_name = self.votable_type.constantize
    class_name.find(self.votable_id).increment(field).save
  end

  def decrement_vote
    field = self.upvote ? :upvotes : :downvotes
    class_name = self.votable_type.constantize
    class_name.find(self.votable_id).decrement(field).save
  end
end
