class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :message, :user_id, :post_id

  include Votable
end
