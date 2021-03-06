class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions
  has_many :communities, through: :subscriptions
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates_presence_of :first_name, :last_name, :username

  def full_name
    "#{first_name} #{last_name}"
  end

  def upvoted_things
    self.votes.where(upvote: true).pluck(:votable_id, :votable_type)
  end

  def downvoted_things
    self.votes.where(upvote: false).pluck(:votable_id, :votable_type)
  end
end
