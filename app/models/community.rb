class Community < ApplicationRecord
  belongs_to :user
  validates_presence_of :url, :name, :description
  has_many :posts
end
