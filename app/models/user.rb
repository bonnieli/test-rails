# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :user_posts
  has_many :posts, through: :user_posts, dependent: :destroy

  # Validations
  validates :username, :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :username, uniqueness: true
end
