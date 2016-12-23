class Post < ApplicationRecord
  validates :name, :presence => true

  has_many :comments
end
