class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all

  accepts_nested_attributes_for :comments

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true
  validates_associated :comments
end
