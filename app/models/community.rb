class Community < ApplicationRecord
  belongs_to :user
  validates_presence_of :url, :name, :description, :summary
  has_many :posts
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
