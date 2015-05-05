class User < ActiveRecord::Base
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
  validates :username, :password, presence: true
  validates :username, uniqueness: true
end
